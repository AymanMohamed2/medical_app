part of 'response_consaltant_cubit.dart';

sealed class ResponseConsaltantState {}

final class ResponseConsaltantInitial extends ResponseConsaltantState {}

final class ResponseConsaltantLoading extends ResponseConsaltantState {}

final class ResponseConsaltantSuccess extends ResponseConsaltantState {
  final ResponseConsaltantRequestModel request;
  ResponseConsaltantSuccess(this.request);
}

final class ResponseConsaltantFailure extends ResponseConsaltantState {
  final Failure failure;
  ResponseConsaltantFailure(this.failure);
}
