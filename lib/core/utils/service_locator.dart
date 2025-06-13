import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:medical_app/core/networking/api_service.dart';
import 'package:medical_app/core/services/gemini_services.dart';
import 'package:medical_app/core/strategies/auth_strategies/login_strategy/login_strategy_factory.dart';
import 'package:medical_app/features/auth/data/datasources/local_data_source/base_auth_locale_datasource.dart';
import 'package:medical_app/features/auth/data/datasources/local_data_source/hive_auth_datasource.dart';
import 'package:medical_app/features/auth/data/datasources/remote_data_source/base_auth_remote_datasource.dart';
import 'package:medical_app/features/auth/data/datasources/remote_data_source/firebase_auth_remote_data_source.dart';
import 'package:medical_app/features/auth/data/repository/auth_repository.dart';
import 'package:medical_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:medical_app/features/chat/data/datasources/base_home_data_source.dart';
import 'package:medical_app/features/chat/data/datasources/remote_data_source.dart';
import 'package:medical_app/features/chat/data/repository/home_repo_impl.dart';
import 'package:medical_app/features/chat/domain/repositories/home_repository.dart';
import 'package:medical_app/features/chat/domain/usecases/send_message_use_case.dart';
import 'package:medical_app/features/doctor_home/data/repository/consaltant_doctor_repo_impl.dart';
import 'package:medical_app/features/doctor_home/data/repository/consaltant_doctor_repository.dart';
import 'package:medical_app/features/patient_home/data/repository/doctors_repo_impl.dart';
import 'package:medical_app/features/patient_home/data/repository/doctors_repository.dart';
import 'package:medical_app/features/patient_home/data/repository/ecg_repository.dart';
import 'package:medical_app/features/patient_home/data/repository/ecg_repository_impl.dart';
import 'package:medical_app/features/patient_home/data/repository/patient_vitals_repo_impl.dart';
import 'package:medical_app/features/patient_home/data/repository/patient_vitals_repository.dart';
import 'package:medical_app/features/patient_home/data/repository/pbm_repository.dart';
import 'package:medical_app/features/patient_home/data/repository/pbm_repository_impl.dart';

GetIt getIt = GetIt.instance;

class ServiceLocator {
  static void init() {
    getIt.registerSingleton<Dio>(
      Dio(),
    );
    getIt.registerSingleton<ApiService>(
      ApiService(getIt.get<Dio>()),
    );
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

    getIt.registerSingleton<DoctorsRepository>(
      DoctorsRepoImpl(),
    );

    getIt.registerSingleton<BpmRepository>(
      BpmRepositoryImpl(getIt.get<ApiService>()),
    );
    getIt.registerSingleton<EcgRepository>(
      EcgRepositoryImpl(getIt.get<ApiService>()),
    );
    getIt.registerSingleton<PatientVitalsRepository>(
      PatientVitalsRepoImpl(getIt.get<ApiService>()),
    );
    getIt.registerSingleton<GeminiServices>(
        GeminiServices(getIt.get<ApiService>()));
    getIt.registerSingleton<BaseHomeDataSource>(
        RemoteDataSource(getIt.get<GeminiServices>()));
    getIt.registerSingleton<HomeRepository>(
        HomeRepoImpl(getIt.get<BaseHomeDataSource>()));
    getIt.registerSingleton<SendMessageUseCase>(
        SendMessageUseCase(getIt.get<HomeRepository>()));

    getIt.registerSingleton<ConsaltantDoctorRepository>(
        ConsaltantDoctorRepoImpl());
  }
}
