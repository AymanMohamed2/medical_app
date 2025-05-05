import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:medical_app/core/exceptions/fire_store_auth_exception.dart';
import 'package:medical_app/core/exceptions/firebase_auth_exception.dart';
import 'package:medical_app/core/networking/firebase_collections.dart';
import 'package:medical_app/features/auth/data/datasources/remote_data_source/base_auth_remote_datasource.dart';
import 'package:medical_app/features/auth/data/models/signup_request_model.dart';
import 'package:medical_app/features/auth/data/models/user_model.dart';

class FirebaseAuthRemoteDatasource
    extends BaseAuthRemoteDataSource<UserModel, SignupRequestModel> {
  FirebaseAuthRemoteDatasource();

  @override
  Future<UserModel> signUpWithEmailPassword(
      SignupRequestModel signupRequestModel) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: signupRequestModel.email!,
        password: signupRequestModel.password!,
      );
      final userModel = UserModel.fromSignupRequestModel(
        signupRequestModel,
        credential.user!,
      );
      await saveUserData(userModel);
      return userModel;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomFirebaseAuthException('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomFirebaseAuthException(
            'The account already exists for that email.');
      } else {
        throw CustomFirebaseAuthException(
            'An Error Occured, Please Try Again Later');
      }
    } catch (e) {
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
    return user;
  }

  Future<void> saveUserData(UserModel userModel) async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection(FirebaseCollections.users)
          .doc(userModel.uId)
          .get();
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
}
