import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_app_api/core/api/dio_consumer.dart';
import 'package:sign_app_api/core/repositories/user_repository.dart';
import 'package:sign_app_api/model/sign_in_model.dart';
import 'package:sign_app_api/view/screen/home.dart';

class SignInControl extends GetxController {
  late TextEditingController email;
  late TextEditingController pass;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool loading = false;

  UserRepository userRepository = UserRepository(api: DioConsumer(dio: Dio()));
  SignInModel? user;

  signIn() async {
    if (formstate.currentState!.validate()) {
      loading = true;
      update();

      final response =
          await userRepository.signIn(email: email.text, password: pass.text);
      loading = false;
      update();

      response.fold((l) {
        // snack('problem', 'no internet');
      }, (user) {
        Get.offAll(() => const Home());
      });
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    pass = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    pass.dispose();
    super.dispose();
  }
}
