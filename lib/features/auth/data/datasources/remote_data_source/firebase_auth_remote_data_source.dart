import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medical_app/core/exceptions/fire_store_auth_exception.dart';
import 'package:medical_app/core/exceptions/firebase_auth_exception.dart';
import 'package:medical_app/core/networking/firebase_collections.dart';
import 'package:medical_app/core/services/appwrite_service.dart';
import 'package:medical_app/core/utils/get_user_data.dart';
import 'package:medical_app/features/auth/data/datasources/remote_data_source/base_auth_remote_datasource.dart';
import 'package:medical_app/features/auth/data/models/complete_data_request_model.dart';
import 'package:medical_app/features/auth/data/models/login_request_model.dart';
import 'package:medical_app/features/auth/data/models/signup_request_model.dart';
import 'package:medical_app/features/auth/data/models/user_model.dart';

class FirebaseAuthRemoteDatasource extends BaseAuthRemoteDataSource {
  FirebaseAuthRemoteDatasource();

  @override
  Future<UserModel> signUpWithEmailPassword(
      SignupRequestModel signupRequestModel) async {
    try {
      String? image = await AppwriteStorageService.uploadImage(
          signupRequestModel.profileImage!);
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: signupRequestModel.email!,
        password: signupRequestModel.password!,
      );
      final userModel = UserModel.fromSignupRequestModel(
        signupRequestModel,
        credential.user!,
      );
      userModel.image = image!;
      await saveUserData(userModel);
      return userModel;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomFirebaseAuthException('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomFirebaseAuthException(
            'The account already exists for that email.');
      } else {
        log(e.toString());
        throw CustomFirebaseAuthException(
            'An Error Occured, Please Try Again Later');
      }
    } catch (e) {
      log(e.toString());

      throw CustomFirebaseAuthException(
          'An Error Occured, Please Try Again Later');
    }
  }

  @override
  Future<UserModel> signUpWithFacebook(
      SignupRequestModel signupRequestModel) async {
    LoginResult? loginResult;
    try {
      loginResult = await FacebookAuth.instance.login();
    } on Exception catch (_) {
      throw CustomFirebaseAuthException('Facebook sign-in failed');
    }
    if (loginResult.status != LoginStatus.success) {
      throw CustomFirebaseAuthException('Facebook sign-in failed');
    }
    // Create a credential from the access token
    final User? user;
    try {
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);
      user = userCredential.user;
    } on Exception catch (_) {
      throw CustomFirebaseAuthException(
          'this user is already registered with another account');
    }
    if (user == null)
      // ignore: curly_braces_in_flow_control_structures
      throw CustomFirebaseAuthException('Unable to retrieve user');
    final userModel = UserModel.fromFirebaseUser(user, signupRequestModel);
    await saveUserData(userModel);
    final doc = await readUser(userModel.uId!);
    userModel.isCompeleteData = doc['isCompeleteData'] ?? false;
    return userModel;
  }

  @override
  Future<UserModel> signUpWithGoogle(
      SignupRequestModel signupRequestModel) async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    googleUser == null
        ? throw CustomFirebaseAuthException('Google Sign-In failed')
        : null;
    UserModel user =
        UserModel.fromFirebaseUser(userCredential.user!, signupRequestModel);
    await saveUserData(user);
    final doc = await readUser(user.uId!);
    user.isCompeleteData = doc['isCompeleteData'];
    return user;
  }

  Future<void> saveUserData(UserModel userModel) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> doc =
          await readUser(userModel.uId!);
      if (!doc.exists) {
        await FirebaseFirestore.instance
            .collection(FirebaseCollections.users)
            .doc(userModel.uId)
            .set(userModel.toJson());
      }
    } on Exception catch (_) {
      FirebaseAuth.instance.currentUser!.delete();
      throw FireStoreException('An Error Occured, Please Try Again Later');
    }
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> readUser(String uId) async {
    final doc = await FirebaseFirestore.instance
        .collection(FirebaseCollections.users)
        .doc(uId)
        .get();
    return doc;
  }

  @override
  Future<UserModel> loginWithEmailAndPassword(
      LoginRequestModel loginRequestModel) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: loginRequestModel.email!,
        password: loginRequestModel.password!,
      );
      final doc = await readUser(credential.user!.uid);

      final userModel = UserModel.fromFirebaseJson(
        doc.data() as Map<String, dynamic>,
        credential.user!.uid,
      );
      return userModel;
    } on FirebaseAuthException catch (e) {
      throw CustomFirebaseAuthException.fromCode(e.code);
    }
  }

  @override
  Future<UserModel> loginWithFacebook(
      LoginRequestModel loginRequestModel) async {
    LoginResult? loginResult;
    try {
      loginResult = await FacebookAuth.instance.login();
    } on Exception catch (_) {
      throw CustomFirebaseAuthException('Facebook sign-in failed');
    }
    if (loginResult.status != LoginStatus.success) {
      throw CustomFirebaseAuthException('Facebook sign-in failed');
    }
    // Create a credential from the access token
    final User? user;
    try {
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);
      user = userCredential.user;
    } on Exception catch (_) {
      throw CustomFirebaseAuthException(
          'this user is already registered with another account');
    }
    if (user == null)
      // ignore: curly_braces_in_flow_control_structures
      throw CustomFirebaseAuthException('Unable to retrieve user');
    final doc = await readUser(user.uid);
    if (doc.data() == null) {
      throw CustomFirebaseAuthException('This user is not registered');
    }

    final userModel = UserModel.fromFirebaseJson(doc.data()!, user.uid);
    return userModel;
  }

  @override
  Future<UserModel> loginWithGoogle(LoginRequestModel loginRequestModel) async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    googleUser == null
        ? throw CustomFirebaseAuthException('Google Sign-In failed')
        : null;
    final doc = await readUser(userCredential.user!.uid);
    if (doc.data() == null) {
      throw CustomFirebaseAuthException('This user is not registered');
    }
    final userModel = UserModel.fromFirebaseJson(
      doc.data() as Map<String, dynamic>,
      userCredential.user!.uid,
    );
    return userModel;
  }

  Future<String?> uploadImageToStorage(XFile image) async {
    final file = File(image.path);
    final storageRef = FirebaseStorage.instance
        .ref()
        .child('uploads/${DateTime.now().millisecondsSinceEpoch}.jpg');
    await storageRef.putFile(file);
    final downloadUrl = await storageRef.getDownloadURL();
    return downloadUrl;
  }

  @override
  Future<UserModel> completeData(CompleteDataRequestModel request) async {
    await FirebaseFirestore.instance
        .collection(FirebaseCollections.users)
        .doc(GetUserData.user!.uId)
        .update(request.toJson());
    final doc = await readUser(GetUserData.user!.uId!);
    return UserModel.fromFirebaseJson(
        doc.data() as Map<String, dynamic>, GetUserData.user!.uId!);
  }
}
