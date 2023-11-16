import '../constants/constants.dart';

class Validator {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return AppTexts.contactEnterName;
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return AppTexts.contactEnterEmail;
    }
    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(value)) {
      return AppTexts.contactEnterValidEmail;
    }
    return null;
  }

  static String? validateMessage(String? value) {
    if (value == null || value.isEmpty) {
      return AppTexts.contactEnterMessage;
    }
    return null;
  }
}
