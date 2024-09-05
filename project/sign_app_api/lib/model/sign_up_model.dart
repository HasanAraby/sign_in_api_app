import 'package:sign_app_api/core/constants/api_keys.dart';

class SignUpModel {
  final String message;

  SignUpModel({required this.message});
  factory SignUpModel.fromJson(Map<String, dynamic> jsonData) {
    return SignUpModel(message: jsonData[ApiKey.message]);
  }
}
