part of 'fetch_ecg_status_cubit.dart';

sealed class FetchEcgStatusState {}

final class FetchEcgStatusInitial extends FetchEcgStatusState {}

final class FetchEcgStatusLoading extends FetchEcgStatusState {}

final class FetchEcgStatusSuccess extends FetchEcgStatusState {
  final BaseEcgModel baseEcgModel;
  FetchEcgStatusSuccess(this.baseEcgModel);
}

final class FetchEcgStatusFailure extends FetchEcgStatusState {
  final Failure failure;
  FetchEcgStatusFailure(this.failure);
}
