class CustomFirebaseAuthException implements Exception {
  final String message;

  CustomFirebaseAuthException(this.message);
  @override
  String toString() => message;

  factory CustomFirebaseAuthException.fromCode(String code) {
    switch (code) {
      case 'user-not-found':
        return CustomFirebaseAuthException('No user found for that email.');
      case 'wrong-password':
        return CustomFirebaseAuthException(
            'Wrong password provided for that user.');
      case 'email-already-in-use':
        return CustomFirebaseAuthException(
            'The account already exists for that email.');
      case 'weak-password':
        return CustomFirebaseAuthException(
            'The password provided is too weak.');
      case 'invalid-credential':
        return CustomFirebaseAuthException(
            'The Email or Password is incorrect.');
      case 'user-disabled':
        return CustomFirebaseAuthException(
            'The user account has been disabled by an administrator.');
      case 'operation-not-allowed':
        return CustomFirebaseAuthException(
            'This operation is not allowed. Please contact support.');
      case 'account-exists-with-different-credential':
        return CustomFirebaseAuthException(
            'An account already exists with the same email address but different sign-in credentials. Sign in using a provider associated with this email address.');
      case 'invalid-email':
        return CustomFirebaseAuthException(
            'The email address is badly formatted.');

      default:
        return CustomFirebaseAuthException(
            'An Error Occured, Please Try Again Later');
    }
  }
}
