import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_base/src/core/navigation/navigator.dart';
import 'package:flutter_base/src/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:flutter_base/src/core/widgets/custom_messages.dart';
import 'package:flutter_base/src/features/auth/sign_up/presentation/imports/imports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:path/path.dart';

import '../error/exceptions.dart';
import '../error/failure.dart';

extension ErrorHandler<T extends dynamic> on Future<T> {
  Future<Result<T, Failure>> handleCallbackWithFailure() async {
    if (kDebugMode) {
      return await _defaultHandler();
    } else {
      try {
        return await _defaultHandler();
      } catch (e) {
        return const Error(Failure('An error occurred'));
      }
    }
  }

  Future<Result<T, Failure>> _defaultHandler() async {
    try {
      final result = await this;
      return Success(result);
    } on BlockedException catch (e) {
      return Error(Failure(e.message));
    } on UnauthorizedException catch (e) {
     _handleLogout(e);
      return Error(Failure(e.message));
    } on ServerException catch (e) {
      return Error(Failure(e.message));
    }
  }

  Future<void>_handleLogout(UnauthorizedException e)async{
    Go.context.read<UserCubit>().handleLoggingOut(e);
  }
}

