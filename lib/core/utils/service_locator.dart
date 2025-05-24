import 'package:get_it/get_it.dart';
import 'package:medical_app/core/strategies/auth_strategies/login_strategy/login_strategy_factory.dart';
import 'package:medical_app/features/auth/data/datasources/local_data_source/base_auth_locale_datasource.dart';
import 'package:medical_app/features/auth/data/datasources/local_data_source/hive_auth_datasource.dart';
import 'package:medical_app/features/auth/data/datasources/remote_data_source/base_auth_remote_datasource.dart';
import 'package:medical_app/features/auth/data/datasources/remote_data_source/firebase_auth_remote_data_source.dart';
import 'package:medical_app/features/auth/data/repository/auth_repository.dart';
import 'package:medical_app/features/auth/data/repository/auth_repository_impl.dart';

GetIt getIt = GetIt.instance;

class ServiceLocator {
  static void init() {
    getIt.registerSingleton<BaseAuthRemoteDataSource>(
      FirebaseAuthRemoteDatasource(),
    );
    getIt.registerSingleton<LoginStrategyFactory>(
      LoginStrategyFactory(getIt.get<BaseAuthRemoteDataSource>()),
    );
    getIt.registerSingleton<BaseAuthLocaleDatasource>(
      HiveAuthDatasource(),
    );
    getIt.registerSingleton<AuthRepository>(AuthRepositoryImpl(
        getIt.get<BaseAuthRemoteDataSource>(),
        getIt.get<BaseAuthLocaleDatasource>(),
        getIt.get<LoginStrategyFactory>()));
  }
}
