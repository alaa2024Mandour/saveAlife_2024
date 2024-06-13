import 'package:dio/dio.dart';
import 'package:save_a_life_2024/shared/network/endPoints/end_points.dart';

class DioHelper {
  static Dio? dio ;

  static init(){
     dio = Dio(
      BaseOptions(
        baseUrl:EndPoints.basURL ,
        receiveDataWhenStatusError: true,
      )
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String,dynamic>? query,
    String lang = 'en',
    String?  token,
  }) async{

    dio?.options.headers = {
      'Authorization':token ?? ''
    };

    return await dio!.get(
        url,
        queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    // Map<String,dynamic>? query,
    required Map<String,dynamic> data,
     // String? token,

  }) async{

    return await dio!.post(
        url,
        // queryParameters: query,
        data: data,
    );

  }
}

// URL :https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=af5361507f034e7a86e52b589355a90c

// API for Serch : https://newsapi.org/v2/everything?q=tesla&from=2023-10-05&sortBy=publishedAt&apiKey=af5361507f034e7a86e52b589355a90c

