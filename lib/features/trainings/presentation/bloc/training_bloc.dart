import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/network/mock_trainings.dart';
import 'training_event.dart';
import 'training_state.dart';

class TrainingBloc extends Bloc<TrainingEvent, TrainingState> {
  TrainingBloc() : super(TrainingState(trainings: mockTrainings)) {
    on<LoadTrainings>((event, emit) {
      emit(TrainingState(trainings: mockTrainings));
    });

    on<ApplyFilters>((event, emit) {
      final filteredTrainings = mockTrainings
          .where((training) => training['location'] == event.location)
          .toList();
      emit(TrainingState(trainings: filteredTrainings, isFiltered: true));
    });
  }
}
