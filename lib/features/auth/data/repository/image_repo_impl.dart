import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medical_app/core/errors/faliure.dart';
import 'package:medical_app/core/errors/permession_failure.dart';
import 'package:medical_app/core/services/image_picker_service/image_picker_service.dart';
import 'package:medical_app/features/auth/data/repository/image_repository.dart';

class ImageRepoImpl extends ImageRepository {
  @override
  Future<Either<Failure, XFile?>> pickImage(
      ImagePickerService imagePickerService) async {
    try {
      return right(await imagePickerService.pickImage());
    } on Exception catch (e) {
      String errorMessage = e.toString().replaceAll("Exception: ", "");
      return left(PermessionFailure(errMessage: errorMessage));
    }
  }
}
