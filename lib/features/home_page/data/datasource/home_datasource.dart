import 'package:dio/dio.dart';

class HomeDatasource {
  HomeDatasource({required Dio dio}) : _dio = dio;

  final Dio _dio;
}
