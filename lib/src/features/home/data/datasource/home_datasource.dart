import 'package:dio/dio.dart';

abstract class HomeDatasource {
  Future<List<dynamic>> fetchData();
}

class HomeDatasourceImpl implements HomeDatasource {
  final Dio dio = Dio();
  static const String baseUrl = String.fromEnvironment('BASE_API');
  static const String productsEndpoint =
      String.fromEnvironment('PRODUCTS_ENDPOINT');
  @override
  Future<List<dynamic>> fetchData() async {
    try {
      final response = await dio.get('$baseUrl$productsEndpoint');
      return response.data;
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
