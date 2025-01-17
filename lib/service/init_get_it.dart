import 'package:get_it/get_it.dart';
import 'package:mini_ecommerce/service/api_service.dart';
import 'package:mini_ecommerce/service/startup_service.dart';

GetIt getIt = GetIt.instance;

void setupLocator(){

  getIt.registerLazySingleton<ApiService>(()=> ApiService());
  getIt.registerLazySingleton<StartupService>(()=> StartupService());
}