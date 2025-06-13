import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medical_app/core/errors/faliure.dart';
import 'package:medical_app/core/services/image_picker_service/image_picker_service.dart';

abstract class ImageRepository {
  Future<Either<Failure, XFile?>> pickImage(
      ImagePickerService imagePickerService);
}
