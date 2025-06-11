part of 'fetch_bpm_cubit.dart';

sealed class FetchBpmState {}

final class FetchBpmInitial extends FetchBpmState {}

final class FetchBpmLoading extends FetchBpmState {}

final class FetchBpmSuccess extends FetchBpmState {
  final BasePbmModel basePbmModel;
  FetchBpmSuccess(this.basePbmModel);
}

final class FetchBpmFailure extends FetchBpmState {
  final Failure failure;
  FetchBpmFailure(this.failure);
}
