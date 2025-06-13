import 'package:image_picker/image_picker.dart';
import 'package:medical_app/core/services/image_picker_service/image_picker_service.dart';
import 'package:medical_app/core/utils/permession_handler.dart';

class PickImageFromCamera extends ImagePickerService {
  final PermessionHandler permessionHandler;
  final ImagePicker picker;
  PickImageFromCamera({required this.permessionHandler, required this.picker});
  @override
  Future<XFile?> pickImage() async {
    await permessionHandler.requestCameraPermission();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    return pickedFile;
  }
}
