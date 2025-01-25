import 'package:equatable/equatable.dart';

class TrainingState extends Equatable {
  final List<Map<String, String>> trainings;
  final bool isFiltered;

  const TrainingState({required this.trainings, this.isFiltered = false});

  @override
  List<Object> get props => [trainings, isFiltered];
}