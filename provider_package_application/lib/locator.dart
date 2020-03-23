import 'package:get_it/get_it.dart';
import 'package:provider_architecture/core/ViewModels/base_model.dart';
import 'package:provider_architecture/core/ViewModels/home_model.dart';
import 'package:provider_architecture/core/ViewModels/login_model.dart';
import 'package:provider_architecture/core/services/api.dart';
import 'package:provider_architecture/core/services/authentication_service.dart';
import 'package:provider_architecture/ui/views/login_view.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => LoginModel());
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => HomeModel());


}
