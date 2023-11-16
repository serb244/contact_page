import 'package:dio/dio.dart';

class NetworkClient {
  static final Dio _dio = Dio();

  static Dio getDioInstance() {
    // add Options if you needed
    return _dio;
  }
}
