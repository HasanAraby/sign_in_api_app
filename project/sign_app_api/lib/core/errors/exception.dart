import 'package:sign_app_api/core/errors/error_model.dart';
import 'package:sign_app_api/core/functions/snack_bar.dart';

class ServerException implements Exception {
  final ErrorModel errModel;

  ServerException({required this.errModel}) {
    snack('problem', errModel.errorMessage);
  }
}
