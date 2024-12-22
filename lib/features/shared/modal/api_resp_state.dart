import 'package:equatable/equatable.dart';

abstract class ResponseState<T> extends Equatable {
  const ResponseState();

  @override
  List<T> get props => [];
}

class ResponseStateInitial extends ResponseState {}
class ResponseStateLoading extends ResponseState {}
class ResponseStateCancel extends ResponseState {}

class ResponseStateEmpty extends ResponseState {
  final String message;
  const ResponseStateEmpty(this.message);

  @override
  List<Object> get props => [message];

  @override
  String toString() => "No data found (Message: $message)";
}

class ResponseStateSuccess<T> extends ResponseState {
  final T data;

  const ResponseStateSuccess(this.data);

  @override
  List<T> get props => [data];
}

class ResponseStateError extends ResponseState {
  final String errorMessage;

  const ResponseStateError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() => "Failed with Error (Message: $errorMessage)";
}

class ResponseStateNoInternet extends ResponseState {
  final String message;
  const ResponseStateNoInternet(this.message);

  @override
  List<Object> get props => [message];

  @override
  String toString() => "No Internet (Message: $message)";
}