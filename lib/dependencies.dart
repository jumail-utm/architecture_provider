import './services/rest_service.dart';
import './services/todo_data_service.dart';
import './services/user_data_service.dart';
import 'package:get_it/get_it.dart';

GetIt service = GetIt.instance;

void init() {
  service.registerLazySingleton(() => RestService());
  service.registerLazySingleton(() => TodoDataService());
  service.registerLazySingleton(() => UserDataService());
}
