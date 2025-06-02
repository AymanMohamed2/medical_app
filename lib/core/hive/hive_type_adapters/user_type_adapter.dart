import 'package:hive_flutter/adapters.dart';
import 'package:medical_app/core/enums/signup_method_enum.dart';
import 'package:medical_app/core/enums/user_role_enum.dart';
import 'package:medical_app/features/auth/data/models/user_model.dart';

class UserModelTypeAdapter extends TypeAdapter<UserModel> {
  @override
  UserModel read(BinaryReader reader) {
    return UserModel(
      isCompeleteData: reader.readBool(),
      email: reader.readString(),
      uId: reader.readString(),
      name: reader.readString(),
      hospital: reader.readString(),
      signupMethod: AuthMethodEnum.values[reader.readUint32()],
      userRole: UserRoleEnum.values[reader.readUint32()],
    );
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer.writeBool(obj.isCompeleteData);
    writer.writeString(obj.email ?? '');
    writer.writeString(obj.uId ?? '');
    writer.writeString(obj.name ?? '');
    writer.writeString(obj.hospital ?? '');
    writer.writeUint32(obj.signupMethod?.index ?? 0);
    writer.writeUint32(obj.userRole?.index ?? 0);
  }
}
