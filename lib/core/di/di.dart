import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:devbey/core/data/local_data_source.dart';
import 'package:devbey/featuers/login/data/datasource/remote_datasource.dart';
import 'package:devbey/featuers/login/data/repositories_impl/repositories_impl.dart';
import 'package:devbey/featuers/login/domain/repostitories/repostitories.dart';
import 'package:devbey/featuers/login/domain/usecase/login_usecase.dart';
import 'package:devbey/featuers/login/domain/usecase/save_info_usecase.dart';
import 'package:devbey/featuers/search/domain/usecase/get_cars_use_case.dart';
import 'package:devbey/featuers/search/domain/usecase/get_cities_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../featuers/search/data/datasource/remote_datasource.dart';
import '../../featuers/search/data/repositories_impl/repositories_impl.dart';
import '../../featuers/search/domain/repostitories/repostitories.dart';
import '../network/network.dart';

final GetIt instance = GetIt.instance;
Future<void> initDi() async {
//core
  instance
      .registerFactory<DataConnectionChecker>(() => DataConnectionChecker());
  instance.registerFactory<NetworkInfo>(() => NetworkInfoImpl(
      dataConnectionChecker: instance<DataConnectionChecker>()));

  /// shared perf
  final sharedPrefs = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  instance.registerFactory<LocalDataSource>(
      () => LocalDataSourceImpl(prefs: instance<SharedPreferences>()));
}

void loginDi() async {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    //// usecase
    instance.registerFactory<LoginUseCase>(
        () => LoginUseCase(loginRepostitories: instance<LoginRepostitories>()));
         instance.registerFactory<SaveInfoUseCase>(
        () => SaveInfoUseCase(loginRepostitories: instance<LoginRepostitories>()));

    // repository

    instance.registerFactory<LoginRepostitories>(() => LoginRepostitoriesImpl(
        loginRemoteDataSource: instance<LoginRemoteDataSource>(),
        localDataSource: instance<LocalDataSource>(),
        networkInfo: instance<NetworkInfo>()));

    //datasource

    instance.registerLazySingleton<LoginRemoteDataSource>(
        () => LoginRemoteDataSourceImpl());
  }
}

void searchDi() async {
  if (!GetIt.I.isRegistered<GetCitiesUseCase>()) {
    //// usecase
    instance.registerFactory<GetCitiesUseCase>(() =>
        GetCitiesUseCase(searchRepostitories: instance<SearchRepostitories>()));
    instance.registerFactory<GetCarsUseCase>(() =>
        GetCarsUseCase(searchRepostitories: instance<SearchRepostitories>()));

    // repository

    instance.registerFactory<SearchRepostitories>(() => SearchRepostitoriesImpl(
        searchRemoteDataSource: instance<SearchRemoteDataSource>(),
        networkInfo: instance<NetworkInfo>()));

    //datasource

    instance.registerLazySingleton<SearchRemoteDataSource>(
        () => SearchRemoteDataSourceImpl());
  }
}
