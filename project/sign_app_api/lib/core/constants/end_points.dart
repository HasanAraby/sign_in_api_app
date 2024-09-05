import 'package:get/get.dart';
import 'package:sign_app_api/core/services/services.dart';

class EndPoint {
  MyServices myServices = Get.find();
  static String baseUrl = 'https://food-api-omega.vercel.app/api/v1/user/';
  static String signUp = 'signup';
  static String signIn = 'signin';
  static String logOut = 'logout';
  static String checkEmail = 'check-email';
  static String getUserData(String id) => 'get-user/$id';
  static String updateUser = 'update';
  static String deleteUser = 'delete';
}
