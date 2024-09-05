import 'package:dio/dio.dart';
import 'package:sign_app_api/core/constants/api_keys.dart';
import 'package:sign_app_api/core/errors/error_model.dart';
import 'package:sign_app_api/core/errors/exception.dart';

handleDioExeptions(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerException(
          errModel: ErrorModel.fromJson({
        ApiKey.status: 0,
        ApiKey.errorMessage: 'check your connection and restart your app'
      }));

    case DioExceptionType.sendTimeout:
      throw ServerException(
          errModel: ErrorModel.fromJson({
        ApiKey.status: 0,
        ApiKey.errorMessage: 'check your connection and restart your app'
      }));

    case DioExceptionType.receiveTimeout:
      throw ServerException(
          errModel: ErrorModel.fromJson({
        ApiKey.status: 0,
        ApiKey.errorMessage: 'check your connection and restart your app'
      }));

    case DioExceptionType.badCertificate:
      throw ServerException(
          errModel: ErrorModel.fromJson({
        ApiKey.status: 0,
        ApiKey.errorMessage: 'check your connection and restart your app'
      }));

    case DioExceptionType.cancel:
      throw ServerException(
          errModel: ErrorModel.fromJson({
        ApiKey.status: 0,
        ApiKey.errorMessage: 'check your connection and restart your app'
      }));

    case DioExceptionType.connectionError:
      throw ServerException(
          errModel: ErrorModel.fromJson({
        ApiKey.status: 0,
        ApiKey.errorMessage: 'check your connection and restart your app'
      }));

    case DioExceptionType.unknown:
      throw ServerException(
          errModel: ErrorModel.fromJson({
        ApiKey.status: 0,
        ApiKey.errorMessage: 'check your connection and restart your app'
      }));

    case DioExceptionType.badResponse:
      switch (e.response!.statusCode) {
        case 400:
          throw ServerException(
              errModel: ErrorModel.fromJson(e.response!.data));

        case 401:
          throw ServerException(
              errModel: ErrorModel.fromJson(e.response!.data));

        case 403:
          throw ServerException(
              errModel: ErrorModel.fromJson(e.response!.data));

        case 404:
          throw ServerException(
              errModel: ErrorModel.fromJson(e.response!.data));

        case 409:
          throw ServerException(
              errModel: ErrorModel.fromJson(e.response!.data));

        case 422:
          throw ServerException(
              errModel: ErrorModel.fromJson(e.response!.data));

        case 504:
          throw ServerException(
              errModel: ErrorModel.fromJson(e.response!.data));
      }
  }
}
