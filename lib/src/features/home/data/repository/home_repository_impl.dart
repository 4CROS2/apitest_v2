import 'package:apitest/injection_container.dart';
import 'package:apitest/src/features/home/data/datasource/home_datasource.dart';
import 'package:apitest/src/features/home/data/model/product_model.dart';
import 'package:apitest/src/features/home/domain/entity/product_entity.dart';
import 'package:apitest/src/features/home/domain/repository/home_repository.dart';
import 'package:meta/meta.dart';

@immutable
class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl() : _datasource = sl<HomeDatasource>();
  final HomeDatasource _datasource;

  @override
  Future<List<ProductEntity>> fetchData() async {
    final List<dynamic> response = await _datasource.fetchData();
    try {
      final List<ProductModel> products = response
          .map((product) => ProductModel.fromJson(product))
          .toList();
      return products;
    } catch (e) {
      throw Exception('Failed to parse data: $e');
    }
  }
}
