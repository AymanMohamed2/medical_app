import 'package:image_picker/image_picker.dart';
import 'package:medical_app/core/services/image_picker_service/image_picker_service.dart';
import 'package:medical_app/core/utils/permession_handler.dart';

class PickImageFromGallery extends ImagePickerService {
  final PermessionHandler permessionHandler;
  final ImagePicker picker;

  PickImageFromGallery({required this.permessionHandler, required this.picker});
  @override
  Future<XFile?> pickImage() async {
    await permessionHandler.requestGalleryPermission();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    return pickedFile;
  }
}
