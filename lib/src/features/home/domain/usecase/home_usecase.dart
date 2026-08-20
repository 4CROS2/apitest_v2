import 'package:apitest/injection_container.dart';
import 'package:apitest/src/features/home/domain/entity/product_entity.dart';
import 'package:apitest/src/features/home/domain/repository/home_repository.dart';

class HomeUsecase {
  HomeUsecase() : _homeRepository = sl<HomeRepository>();
  final HomeRepository _homeRepository;

  Future<List<ProductEntity>> fetchData() async => _homeRepository.fetchData();
}
