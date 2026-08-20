import 'package:apitest/injection_container.dart';
import 'package:apitest/src/features/app/presentation/controller/app_controller.dart';

void initializeAppContainer(){
  sl.registerLazySingleton<AppController>(() => AppController());
}