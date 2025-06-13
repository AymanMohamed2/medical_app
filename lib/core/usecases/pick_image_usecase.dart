import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medical_app/core/errors/faliure.dart';
import 'package:medical_app/core/services/image_picker_service/image_picker_service.dart';
import 'package:medical_app/features/auth/data/repository/image_repository.dart';

class PickImageUsecase {
  final ImageRepository shopRepository;

  PickImageUsecase({required this.shopRepository});

  Future<Either<Failure, XFile?>> excute(
          ImagePickerService imagePickerService) async =>
      await shopRepository.pickImage(imagePickerService);
}
