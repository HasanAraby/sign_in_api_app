import 'package:sign_app_api/core/constants/api_keys.dart';

class UpdateUserModel {
  final String message;

  UpdateUserModel({required this.message});

  factory UpdateUserModel.fromJson(Map<String, dynamic> json) {
    return UpdateUserModel(message: json[ApiKey.message]);
  }
}
