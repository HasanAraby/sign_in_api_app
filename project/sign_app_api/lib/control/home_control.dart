import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sign_app_api/core/api/dio_consumer.dart';
import 'package:sign_app_api/core/functions/snack_bar.dart';
import 'package:sign_app_api/core/repositories/user_repository.dart';
import 'package:sign_app_api/core/services/services.dart';
import 'package:sign_app_api/model/get_user_model.dart';
import 'package:sign_app_api/view/screen/sign_in.dart';

class HomeControl extends GetxController {
  late TextEditingController email;
  late TextEditingController userName;
  late TextEditingController phoneNumber;
  String? imgLink;
  late TextEditingController location;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  XFile? profImage;
  bool loading = false;
  bool noData = false;

  GetUserModel? user;
  MyServices myServices = Get.find();
  UserRepository userRepository = UserRepository(api: DioConsumer(dio: Dio()));

  getData() async {
    loading = true;
    update();
    final response = await userRepository.getUserData();

    loading = false;
    update();

    response.fold((errorMessage) {
      noData = true;
      update();
    }, (getUserModel) {
      noData = false;
      update();
      email.text = getUserModel.email;
      userName.text = getUserModel.name;
      phoneNumber.text = getUserModel.phone;
      location.text = getUserModel.location;
      imgLink = getUserModel.imgLink;
    });
  }

  logOut() async {
    loading = true;
    update();

    final response = await userRepository.logOut();

    loading = false;
    update();

    response.fold((errorMessage) {}, (logOutModel) {
      snack('', logOutModel.message);
      Get.offAll(() => const SignIn());
    });
  }

  deleteUser() async {
    loading = true;
    update();
    final response = await userRepository.deleteUser();

    loading = false;
    update();

    response.fold((errorMessage) {}, (deleteUserModel) {
      snack('', 'Your account has been deleted');
      Get.offAll(() => const SignIn());
    });
  }

  edit() async {
    loading = true;
    update();
    final response = await userRepository.edit(
        phone: phoneNumber.text, userName: userName.text);

    loading = false;
    update();

    response.fold((errorMessage) {}, (updateUserModel) {
      snack('', updateUserModel.message);
    });
  }

  @override
  void onInit() async {
    email = TextEditingController();
    userName = TextEditingController();
    phoneNumber = TextEditingController();
    location = TextEditingController();

    await getData();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    phoneNumber.dispose();
    userName.dispose();
    location.dispose();
    super.dispose();
  }
}
