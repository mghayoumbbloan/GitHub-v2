class FormValidate {
  static String validateEmail(String value) {
    if (value.isEmpty) {
      // The form is empty
      return "Enter email address";
    }
    // This is just a regular expression for email addresses
    String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
        "\\@" +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
        "(" +
        "\\." +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
        ")+";
    RegExp regExp = new RegExp(p);

    if (regExp.hasMatch(value)) {
      // So, the email is valid
      return null;
    }
    // The pattern of the email didn't match the regex above.
    return 'Email is not valid';
  }

  static String validatePassword(String value) {
    if (value.length < 5) {
      return 'Password less than 6 characters';
    }
    if (value.isEmpty) {
      return 'Password is empty';
    }
    return null;
  }

  // validate name
  static String validateName(String value) {
    if (value.length < 4) {
      return 'Name can not be less than 4 characters';
    }
    return null;
  }

  // validate text
  static String validateText(String value) {
    if (value.length < 5) {
      return 'Text can not be less than 4 characters';
    }
    return null;
  }

  // validate phone number
  static String validatePhoneNumber(String value) {
    if (value.length < 10 || value.isEmpty) {
      return 'Number can not be less than 11 characters';
    }
    return null;
  }
}
