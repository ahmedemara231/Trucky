import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_base/src/config/language/languages.dart';
import 'package:flutter_base/src/core/network/backend_configuation.dart';

class ConfigurationInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('the headers is added');
    options.headers.addAll({
      HttpHeaders.acceptHeader: ContentType.json,
      // Headers.contentTypeHeader: Headers,
      'lang':
          Languages.currentLanguage.locale.languageCode
    });
    log('the headers is added ${options.headers.toString()}');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (BackendConfiguation.type.isPhp) {
      _handleError(response);
    }
    handler.next(response);
  }

  void _handleError(Response response) {
    final errorKey = response.data['key'];
    log('response  : ${response.data['key']}');
    final statusCode = _mapErrorKeyToStatusCode(errorKey); // need activate = 403
    final errorMessage = response.data['msg'];

    if (statusCode != null) {
      throw DioException(
        type: DioExceptionType.badResponse,
        requestOptions: response.requestOptions,
        response: Response(
          requestOptions: response.requestOptions,
          data: {
            'message': errorMessage,
          },
          statusCode: statusCode,
        ),
        error: {
          'message': errorMessage,
        },
      );
    }
  }

  // bool isNeedApproval(String key) {
  //   if (key == 'needApproval') {
  //     UserCubit.instance.setUserStatus(UserStatus.needApproval);
  //   }
  //   UserCubit.instance.setUserStatus(UserStatus.needApproval);
  //   return false;
  // }

  int? _mapErrorKeyToStatusCode(String errorKey) {
    log('error key  :$errorKey');
    switch (errorKey) {
      case 'fail':
        return HttpStatus.badRequest;
      case 'unauthenticated':
        return HttpStatus.unauthorized;
      case 'blocked':
        return HttpStatus.locked;
      case 'exception':
        return HttpStatus.internalServerError;
      case 'needActive':
        return HttpStatus.forbidden;
      default:
        return null;
    }
  }
}
