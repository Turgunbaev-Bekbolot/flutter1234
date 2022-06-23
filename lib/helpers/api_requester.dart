import 'package:dio/dio.dart';
import 'package:last_project/helpers/catch_exeption.dart';

class ApiRequester {
  static String url = 'https://rickandmortyapi.com/api';
  Future<Dio> initDio() async {
    return Dio(
      BaseOptions(
        baseUrl: url,
        responseType: ResponseType.json,
        receiveTimeout: 10000,
        headers: {},
        connectTimeout: 10000,
      ),
    );
  }

  Future<Response> toGet(String url, {Map<String, dynamic>? param}) async {
    Dio dio = await initDio();
    try {
      return dio.get(url, queryParameters: {});
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
