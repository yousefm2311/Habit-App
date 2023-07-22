// ignore_for_file: camel_case_types, non_constant_identifier_names, deprecated_member_use

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class Dio_Helper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        validateStatus: (status) => true,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
        baseUrl: 'https://eslamqadri.pythonanywhere.com/',
        headers: {},
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    var api_key,
  }) async {
    dio!.options.headers = {
      'Authorization': "Bearer $api_key",
      'Content-Type': 'application/json'
    };
    return await dio!.get(url, queryParameters: query);
  }

  static postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    var api_key,
    bool isLogin = false,
  }) async {
    try {
      dio!.options.headers = {
        isLogin ? '' : 'Authorization': "Bearer $api_key",
        'Content-Type': 'application/json'
      };
      return dio!.post(url, queryParameters: query, data: data);
    } catch (e) {
      if (e is DioError) {
        if (e.response?.statusCode == 401) {
          // Handle 401 Unauthorized error
          if (kDebugMode) {
            print(
                'Error: Unauthorized. Please check your authentication credentials.');
          }
          // You may choose to prompt the user to re-enter their credentials or perform the necessary authentication flow.
        } else {
          // Handle other DioErrors (e.g., network issues, server errors, etc.)
          if (kDebugMode) {
            print('Error: ${e.message}');
          }
        }
      } else {
        // Handle other errors (e.g., non-Dio exceptions)
        if (kDebugMode) {
          print('Error: ${e.toString()}');
        }
      }
    }
  }
}
