import 'package:equatable/equatable.dart';

abstract class TrainingEvent extends Equatable {
  const TrainingEvent();

  @override
  List<Object> get props => [];
}

class LoadTrainings extends TrainingEvent {}

class ApplyFilters extends TrainingEvent {
  final String location;

  const ApplyFilters(this.location);

  @override
  List<Object> get props => [location];
}
