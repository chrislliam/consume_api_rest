import 'response_default.dart';

import '../enums/app_enums.dart';
import '../errors/error_interceptor_interface.dart';

mixin ResponseBuilder {
  static DefaultResponse failed<T>(
      {T? object, String? message, IErrorInterceptor? errorInterceptor}) {
    if (errorInterceptor != null) {
      message = errorInterceptor.handleError(message!);
    }
    return DefaultResponse<T>(
        object: object!, message: message!, status: ResponseStatus.rsFailed);
  }

  static DefaultResponse success<T>({
    required T object,
  }) {
    return DefaultResponse<T>(object: object);
  }
}
