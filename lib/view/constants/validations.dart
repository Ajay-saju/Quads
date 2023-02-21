String? validateEmail(String value) {
  String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return 'Enter Valid Email';
  } else {
    return null;
  }
}

String? validateMobile(String value) {
// Indian Mobile number are of 10 digit only
  if (value.length != 10) {
    return 'Mobile Number must be of 10 digit';
  } else {
    return null;
  }
}

String? validateName(String value) {
  if (value.length < 3) {
    return 'Name must be more than 2 charater';
  } else {
    return null;
  }
}
