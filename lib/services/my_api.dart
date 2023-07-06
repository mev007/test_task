import 'dart:developer';

import 'package:dio/dio.dart';

import 'dio_util.dart';

class MyAPI {
  Future<(bool, String)> getDogsRandom() async {
    try {
      final response = await DioUtil.service.dio.get('/breeds/image/random');
      if (response.statusCode == 200) {
        final result = response.data as Map<String, dynamic>;
        final url = result['message'].toString();
        return (true, url);
      } else {
        return (false, response.statusMessage ?? 'error');
      }
    } on DioException catch (e) {
      log('>>> Error: ${e.message}');
      return (false, '${e.message}');
    } catch (e) {
      return (false, 'error');
    }
  }
}
