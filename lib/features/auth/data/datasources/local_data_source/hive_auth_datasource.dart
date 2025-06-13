import 'package:medical_app/core/hive/hive_boxes.dart';
import 'package:medical_app/features/auth/data/datasources/local_data_source/base_auth_locale_datasource.dart';
import 'package:medical_app/features/auth/data/models/user_model.dart';
import 'package:hive_flutter/adapters.dart';

class HiveAuthDatasource extends BaseAuthLocaleDatasource {
  @override
  Future<UserModel?> getUser() async {
    var box = await Hive.openBox(HiveBoxes.user);
    return box.get(HiveBoxes.user);
  }

  @override
  Future<void> saveUser(UserModel userModel) async {
    var box = await Hive.openBox(HiveBoxes.user);
    await box.put(HiveBoxes.user, userModel);
  }

  @override
  Future<void> deleteUser() async {
    var box = Hive.box(HiveBoxes.user);
    return box.delete(HiveBoxes.user);
  }
}
