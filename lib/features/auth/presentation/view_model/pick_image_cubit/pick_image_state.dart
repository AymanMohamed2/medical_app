part of 'pick_image_cubit.dart';

sealed class PickImageState {}

final class PickImageInitial extends PickImageState {}

final class PickImageLoading extends PickImageState {}

final class PickImageSuccess extends PickImageState {
  final XFile? file;
  PickImageSuccess({this.file});
}

final class PickImageFailure extends PickImageState {
  final Failure failure;
  PickImageFailure(this.failure);
}
