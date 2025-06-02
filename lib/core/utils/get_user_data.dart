import 'package:medical_app/core/utils/service_locator.dart';
import 'package:medical_app/features/auth/data/datasources/local_data_source/base_auth_locale_datasource.dart';
import 'package:medical_app/features/auth/data/models/user_model.dart';

abstract class GetUserData {
  static UserModel? user;
  static Future<void> init() async {
    user = await getIt.get<BaseAuthLocaleDatasource>().getUser();
  }
}
