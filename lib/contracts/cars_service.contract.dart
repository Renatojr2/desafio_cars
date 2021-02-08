import 'package:dio/dio.dart';

abstract class ICarsService {
  Future<Response> getCars();
}
