import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:task_one/core/networking/api_service.dart';
import 'package:task_one/features/authentication/login/model/login_repo_imp.dart';
import 'package:task_one/features/authentication/signup/model/signup_repo_imp.dart';
import 'package:task_one/features/favorite/model/repos/fav_repo_imp.dart';
import 'package:task_one/features/home/model/repos/home_repo_imp.dart';
import 'package:task_one/features/orders/model/repos/order_repo_imp.dart';
import 'package:task_one/features/profile/model/repos/profile_repo_imp.dart';

GetIt getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));
  getIt.registerLazySingleton<SignupRepoImp>(
    () => SignupRepoImp(getIt<ApiService>()),
  );
  getIt.registerLazySingleton<LoginRepoImp>(
    () => LoginRepoImp(getIt<ApiService>()),
  );
  getIt.registerLazySingleton<ProfileRepoImp>(
    () => ProfileRepoImp(getIt<ApiService>()),
  );
  getIt.registerLazySingleton<HomeRepoImp>(
    () => HomeRepoImp(getIt<ApiService>()),
  );
  getIt.registerLazySingleton<FavRepoImp>(
    () => FavRepoImp(getIt<ApiService>()),
  );
    getIt.registerLazySingleton<OrderRepoImp>(
    () => OrderRepoImp(getIt<ApiService>()),
  );
}
