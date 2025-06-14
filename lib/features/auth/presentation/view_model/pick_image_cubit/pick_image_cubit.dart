import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medical_app/core/errors/faliure.dart';
import 'package:medical_app/core/services/image_picker_service/image_picker_service.dart';
import 'package:medical_app/core/usecases/pick_image_usecase.dart';

part 'pick_image_state.dart';

class PickImageCubit extends Cubit<PickImageState> {
  PickImageCubit(this.pickImageUsecase) : super(PickImageInitial());
  final PickImageUsecase pickImageUsecase;
  XFile? file;
  Future<void> pickImage(ImagePickerService imagePickerService) async {
    emit(PickImageLoading());
    final result = await pickImageUsecase.excute(imagePickerService);
    result.fold((failure) => emit(PickImageFailure(failure)), (pickedImage) {
      if (pickedImage != null) file = pickedImage;

      emit(PickImageSuccess());
    });
  }
}
