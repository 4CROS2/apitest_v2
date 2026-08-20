import 'package:apitest/src/features/home/domain/entity/product_entity.dart';

abstract interface class HomeRepository {
  Future<List<ProductEntity>> fetchData();
}
