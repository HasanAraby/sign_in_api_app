import 'package:sign_app_api/core/constants/api_keys.dart';

class LogOutModel {
  final String message;

  LogOutModel({required this.message});

  factory LogOutModel.fromJson(Map<String, dynamic> json) {
    return LogOutModel(message: json[ApiKey.message]);
  }
}
