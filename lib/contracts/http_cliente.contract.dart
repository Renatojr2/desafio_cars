import 'package:desafio_carros/models/api-response_model.dart';

abstract class IHttpClient {
  Future<ApiResponse> get();
}
