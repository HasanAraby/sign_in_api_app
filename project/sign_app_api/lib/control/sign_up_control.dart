import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sign_app_api/core/api/dio_consumer.dart';
import 'package:sign_app_api/core/functions/snack_bar.dart';
import 'package:sign_app_api/core/repositories/user_repository.dart';
import 'package:sign_app_api/view/screen/sign_in.dart';

class SignUpControl extends GetxController {
  late TextEditingController email;
  late TextEditingController userName;
  late TextEditingController phoneNumber;
  late TextEditingController pass;
  late TextEditingController confirmPass;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  XFile? profImage;
  bool loading = false;
  UserRepository userRepository = UserRepository(api: DioConsumer(dio: Dio()));

  signUp() async {
    if (profImage == null) {
      snack(' ', 'Uploading an image is a must!');
      return;
    }

    if (formstate.currentState!.validate()) {
      loading = true;
      update();

      final response = await userRepository.signUp(
          email: email.text,
          userName: userName.text,
          phone: phoneNumber.text,
          password: pass.text,
          confirmPassword: confirmPass.text,
          profilePic: profImage!);

      loading = false;
      update();

      response.fold((e) {}, (signUpModel) {
        snack('Success', signUpModel.message);
        Get.offAll(() => const SignIn());
      });
    }
  }

  uploadProfileImage(XFile? img) {
    profImage = img;
    update();
  }

  @override
  void onInit() {
    email = TextEditingController();
    userName = TextEditingController();
    phoneNumber = TextEditingController();
    pass = TextEditingController();
    confirmPass = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    pass.dispose();
    phoneNumber.dispose();
    confirmPass.dispose();
    userName.dispose();
    super.dispose();
  }
}
