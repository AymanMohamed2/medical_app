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
}
