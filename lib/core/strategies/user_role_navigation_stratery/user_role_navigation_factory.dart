import 'package:medical_app/core/enums/user_role_enum.dart';
import 'package:medical_app/core/strategies/user_role_navigation_stratery/doctor_navigation_strategy.dart';
import 'package:medical_app/core/strategies/user_role_navigation_stratery/patient_navigation_strategy.dart';
import 'package:medical_app/core/strategies/user_role_navigation_stratery/user_role_navigation_strategy.dart';
import 'package:medical_app/features/auth/data/models/user_model.dart';

class UserRoleNavigationFactory {
  static UserRoleNavigationStrategy create(UserModel userModel) {
    switch (userModel.userRole) {
      case UserRoleEnum.doctor:
        return DoctorNavigationStrategy(userModel);
      case UserRoleEnum.patient:
        return PatientNavigationStrategy(userModel);
      // ignore: unreachable_switch_default
      default:
        throw Exception('Invalid user role');
    }
  }
}
