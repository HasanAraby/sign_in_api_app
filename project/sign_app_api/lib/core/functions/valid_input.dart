import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == 'username') {
    if (!GetUtils.isUsername(val)) {
      return "Not Valid Username";
    }
  }

  if (type == 'email') {
    if (!GetUtils.isEmail(val)) {
      return "Not Valid Email";
    }
  }

  if (type == 'phone') {
    if (!GetUtils.isPhoneNumber(val)) {
      return "Not Valid Phone Number";
    }
  }

  if (val.length < min) {
    return "can't be less than $min";
  }

  if (val.length > max) {
    return "can't be larger than $max";
  }

  if (val.isEmpty) {
    return "can't be empty";
  }
}
