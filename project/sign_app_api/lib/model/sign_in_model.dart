import 'package:sign_app_api/core/constants/api_keys.dart';

class SignInModel {
  final String message;
  final String token;

  const SignInModel({required this.message, required this.token});

  factory SignInModel.fromJson(Map<String, dynamic> json) {
    return SignInModel(
        message: json[ApiKey.message], token: json[ApiKey.token]);
  }
}
