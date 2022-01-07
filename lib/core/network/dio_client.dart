import 'package:dio/dio.dart';

class DioClient {
  final String baseUrl;

  DioClient(this.baseUrl);

  Dio dioClient() {
    Dio client = Dio(BaseOptions(
      baseUrl: baseUrl,
    ));

    return client;
  }
}
