import 'package:get_it/get_it.dart';
import 'package:medical_app/features/auth/data/datasources/remote_data_source/base_auth_remote_datasource.dart';
import 'package:medical_app/features/auth/data/datasources/remote_data_source/firebase_auth_remote_data_source.dart';
import 'package:medical_app/features/auth/data/repository/auth_repository.dart';
import 'package:medical_app/features/auth/data/repository/repository_impl.dart';

GetIt getIt = GetIt.instance;

class ServiceLocator {
  static void init() {
    getIt.registerLazySingleton<BaseAuthRemoteDataSource>(
      () => FirebaseAuthRemoteDatasource(),
    );

    getIt.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(getIt.get<BaseAuthRemoteDataSource>()));
  }
}
