import 'package:finance_firebase/src/modules/home/controller/home_controller.dart';
import 'package:finance_firebase/src/modules/home/repository/home_repository.dart';
import 'package:get_it/get_it.dart';

GetIt di = GetIt.I;

void registerDependencies() {
  ///Controllers
  di.registerLazySingleton<HomeController>(() => HomeController(di.get()));

  ///Repositories
  di.registerLazySingleton<HomeRepository>(() => HomeRepository());
}
