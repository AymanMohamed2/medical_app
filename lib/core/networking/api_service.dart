import 'package:dio/dio.dart';
import 'package:medical_app/core/constants/api_constance.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Response<dynamic>> get(
      {required String url,
      Map<String, dynamic>? headers,
      CancelToken? cancelToken}) async {
    var response = await _dio.get(
      cancelToken: cancelToken,
      url,
      options: Options(
        headers: headers ??
            {
              'Authorization': 'Bearer ${ApiConstance.apiKey}',
            },
      ),
    );
    return response;
  }

  Future<dynamic> delete(
      {required String url, Map<String, dynamic>? headers, required}) async {
    var response = await _dio.delete(
      url,
      options: Options(
        headers: headers ??
            {
              'Authorization': 'Bearer ${ApiConstance.apiKey}',
              'accept': "application/json"
            },
      ),
    );
    return response.data;
  }

  Future<Response<dynamic>> patch({
    required String url,
    Map<String, dynamic>? headers,
    required Map<String, dynamic> data,
  }) async {
    var response =
        await _dio.patch(url, data: data, options: Options(headers: headers));
    return response.data;
  }

  Future<Response<dynamic>> post(
      {required String url,
      Map<String, dynamic>? headers,
      required Map<String, dynamic> data}) async {
    var response =
        await _dio.post(url, data: data, options: Options(headers: headers));
    return response.data;
  }

  Future<Response<dynamic>> put(
      {required String url,
      Map<String, dynamic>? headers,
      required Map<String, dynamic> data}) async {
    var response =
        await _dio.put(url, options: Options(headers: headers), data: data);
    return response.data;
  }
}
