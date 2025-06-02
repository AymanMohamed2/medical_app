import 'package:medical_app/features/auth/data/models/user_model.dart';

abstract class BaseAuthLocaleDatasource {
  Future<void> saveUser(UserModel userModel);
  Future<UserModel?> getUser();
}
