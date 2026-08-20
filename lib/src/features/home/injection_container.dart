import 'package:apitest/injection_container.dart';
import 'package:apitest/src/features/home/data/datasource/home_datasource.dart';
import 'package:apitest/src/features/home/data/repository/home_repository_impl.dart';
import 'package:apitest/src/features/home/domain/repository/home_repository.dart';
import 'package:apitest/src/features/home/domain/usecase/home_usecase.dart';
import 'package:apitest/src/features/home/presentation/controller/home_controller.dart';

void initializeHomeContainer() {
  sl.registerLazySingleton<HomeDatasource>(() => HomeDatasourceImpl());
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl());
  sl.registerLazySingleton<HomeUsecase>(() => HomeUsecase());
  sl.registerFactory<HomeController>(() => HomeController());
}
