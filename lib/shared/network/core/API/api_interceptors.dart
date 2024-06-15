
import 'package:dio/dio.dart';

import '../../local/cachHelper.dart';
import '../../endPoints/end_points.dart';
class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    if (CacheHelper().getData(key: ApiKeys.token) != null){
      options.headers[ApiKeys.Authorization] =CacheHelper().getData(key: ApiKeys.token)
          != null ? 'Bearer ${CacheHelper().getData(key: ApiKeys.token)}'
          : null ;
    }
    super.onRequest(options, handler);
  }
}

// import 'package:dio/dio.dart';
//
// class ApiInterceptor extends Interceptor {
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     // Get the token from the cache
//     String token = CachHelper.getData(key: ApiKeys.token) as String;
//
//     // Check if the token exists in the cache
//     if (token != null) {
//       // Set the authorization header with the token
//       options.headers[ApiKeys.token] = 'FOODAPI ${ApiKeys.token}';
//     }
//
//     super.onRequest(options, handler);
//   }
// }