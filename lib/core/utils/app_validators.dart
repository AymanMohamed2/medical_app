class AppValidators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an password';
    }
    return null;
  }

  static String? generalValidator(String? value, [String? fieldName]) {
    if (value == null || value.isEmpty) {
      return 'Please enter an $fieldName';
    }
    return null;
  }

  static String? confirmPasswordValidator(
      String? confirmPassword, String? firstPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Please enter an password';
    } else if (confirmPassword != firstPassword) {
      return 'Password does not match';
    }
    return null;
  }

  static String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }
}
