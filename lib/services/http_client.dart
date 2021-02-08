import 'dart:convert';

import 'package:desafio_carros/contracts/http_cliente.contract.dart';
import 'package:desafio_carros/models/api-response_model.dart';
import 'package:desafio_carros/models/cars_models.dart';
import 'package:dio/dio.dart';

class HttpCliente implements IHttpClient {
  Dio _dio;
  String baseUrl;

  HttpCliente() {
    _dio = Dio(
      BaseOptions(baseUrl: 'https://app-cars-backend.herokuapp.com'),
    );
  }
  @override
  Future<ApiResponse> get() async {
    Response response;
    try {
      response = await _dio.get('/cars');
    } catch (e) {
      print(e);
    }

    return ApiResponse.fromJson(jsonDecode(response.data));
  }
}
