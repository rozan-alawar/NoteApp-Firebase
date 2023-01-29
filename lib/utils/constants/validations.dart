import 'package:firebase_proj/utils/extensions/validation_extension.dart';

class Validations {
  static validateEmail(String value) {
    value.isEmpty || !value.isValidEmail ? 'Enter correct email ' : null;
  }

  static passwordValidator(String value) {
    if (value.isEmpty) {
      return 'password is required';
    }

    if (value.length < 8) {
      return 'password must be more than 8 charachters';
    } else {
      return null;
    }
  }

  static confirmPassValidator(String value, String password) {
    if (value.isEmpty) {
      return 'password is required';
    }

    if (value.compareTo(password) == 0) {
      return 'Passwords do not match';
    } else {
      return null;
    }
  }
}
