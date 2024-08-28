
import 'package:bookly/core/errors/failure.dart';
import 'package:dio/dio.dart';
class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      _handleError(error);
    } else {
      failure = DataSource.unknown.getFailure();
    }
  }
}

Failure _handleError(DioException dioException) {
  switch (dioException.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.connectTimeout.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.sendTimeout.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.receiveTimeout.getFailure();
    case DioExceptionType.badCertificate:
    // TO DO
    case DioExceptionType.badResponse:
      if (dioException.response?.statusMessage != null &&
          dioException.response?.statusMessage != null) {
        return Failure(dioException.response?.statusCode ?? 0,
            dioException.response?.statusMessage ?? 'Error Bad Response');
      } else {
        return DataSource.unknown.getFailure();
      }
    case DioExceptionType.cancel:
      return DataSource.cancel.getFailure();
    case DioExceptionType.connectionError:
      return DataSource.noContent.getFailure();
    case DioExceptionType.unknown:
      return DataSource.unknown.getFailure();
  }
}

enum DataSource {
  success, // Represents a successful operation (e.g., HTTP 200)
  noContent, // Represents a successful operation with no content (e.g., HTTP 204)
  badRequest, // Represents a validation error or missing parameters (e.g., HTTP 400)
  unauthorized, // Represents an authentication error (e.g., HTTP 401)
  forbidden, // Represents a forbidden request (e.g., HTTP 403)
  internalServerError, // Represents a server-related error (e.g., HTTP 500)

  // Local status codes
  connectTimeout, // Represents a connection timeout error
  cancel, // Represents a request cancellation
  receiveTimeout, // Represents a receive timeout error
  sendTimeout, // Represents a send timeout error
  cacheError, // Represents a cache-related error
  noInternetConnection, // Represents a lack of internet connection
  unknown, // Represents an unknown error

  networkError, // Represents any network-related error
  unexpectedError, // Represents any unexpected error
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.success:
        return Failure(ResponseCode.success, ErrorMessages.success);
      case DataSource.noContent:
        return Failure(ResponseCode.noContent, ErrorMessages.noContent);
      case DataSource.badRequest:
        return Failure(ResponseCode.badRequest, ErrorMessages.badRequest);
      case DataSource.unauthorized:
        return Failure(ResponseCode.unauthorized, ErrorMessages.unauthorized);
      case DataSource.forbidden:
        return Failure(ResponseCode.forbidden, ErrorMessages.forbidden);
      case DataSource.internalServerError:
        return Failure(ResponseCode.internalServerError,
            ErrorMessages.internalServerError);
      case DataSource.connectTimeout:
        return Failure(
            ResponseCode.connectTimeout, ErrorMessages.connectTimeout);
      case DataSource.cancel:
        return Failure(ResponseCode.cancel, ErrorMessages.cancel);
      case DataSource.receiveTimeout:
        return Failure(
            ResponseCode.receiveTimeout, ErrorMessages.receiveTimeout);
      case DataSource.sendTimeout:
        return Failure(ResponseCode.sendTimeout, ErrorMessages.sendTimeout);
      case DataSource.cacheError:
        return Failure(ResponseCode.cacheError, ErrorMessages.cacheError);
      case DataSource.noInternetConnection:
        return Failure(ResponseCode.noInternetConnection,
            ErrorMessages.noInternetConnection);
      case DataSource.unknown:
        return Failure(ResponseCode.unknown, ErrorMessages.unknown);
      case DataSource.networkError:
        return Failure(ResponseCode.networkError, ErrorMessages.networkError);
      case DataSource.unexpectedError:
        return Failure(
            ResponseCode.unexpectedError, ErrorMessages.unexpectedError);
    }
  }
}

class ResponseCode {
  static const int success = 200;
  static const int failure = 1;

  static const int noContent = 204; // Added No Content response code
  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const int forbidden = 403; // Added Forbidden response code
  static const int internalServerError = 500;

  // Local status codes don't have specific HTTP status codes but can be assigned arbitrary values
  static const int connectTimeout = -1;
  static const int cancel = -2;
  static const int receiveTimeout = -3;
  static const int sendTimeout = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int unknown = -7;

  // Additional generic codes for network and unexpected errors
  static const int networkError = -8;
  static const int unexpectedError = -9;
}

class ErrorMessages {
  static const String success = "Request was successful.";
  static const String noContent =
      "Request was successful, but there is no content to show.";
  static const String badRequest =
      "Bad request. Please check your input parameters.";
  static const String unauthorized =
      "Unauthorized access. Please authenticate and try again.";
  static const String forbidden =
      "Forbidden request. You do not have permission to access this resource.";
  static const String internalServerError =
      "Internal server error. Please try again later.";
  static const String connectTimeout =
      "Connection timeout. Please check your internet connection and try again.";
  static const String cancel = "Request was cancelled.";
  static const String receiveTimeout =
      "Receive timeout. The server took too long to respond.";
  static const String sendTimeout =
      "Send timeout. The request took too long to send.";
  static const String cacheError =
      "Cache error. Unable to retrieve data from the cache.";
  static const String noInternetConnection =
      "No internet connection. Please check your connection and try again.";
  static const String unknown = "Unknown error occurred. Please try again.";
  static const String networkError =
      "Network error. Please check your connection and try again.";
  static const String unexpectedError =
      "An unexpected error occurred. Please try again.";
}
