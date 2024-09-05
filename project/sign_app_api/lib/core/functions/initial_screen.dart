import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_app_api/core/constants/api_keys.dart';
import 'package:sign_app_api/core/services/services.dart';
import 'package:sign_app_api/view/screen/home.dart';
import 'package:sign_app_api/view/screen/sign_in.dart';

Widget initialScreen() {
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString(ApiKey.id) == '' ||
      myServices.sharedPreferences.getString(ApiKey.id) == null) {
    return const SignIn();
  }
  return const Home();
}
