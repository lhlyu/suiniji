bool isValidPhoneNumber(String phoneNumber) {
  final RegExp phoneRegExp = RegExp(
    r'^1[0-9]{10}$',
  );
  return phoneRegExp.hasMatch(phoneNumber);
}
