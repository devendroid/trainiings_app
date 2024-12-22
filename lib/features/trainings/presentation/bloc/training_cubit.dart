import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/datasource/mock_trainings.dart';
import '../../../../core/di/dependencies.dart';
import '../../../shared/modal/api_resp_state.dart';
import '../../domain/usecase/training_usecase.dart';

class TrainingCubit extends Cubit<ResponseState> {
  late List<Map<String, bool>> locations;
  late List<Map<String, bool>> trainings;
  late List<Map<String, bool>> trainers;

  TrainingCubit() : super(ResponseStateInitial()) {
    locations = locationsMock;
    trainings = trainingsMock;
    trainers = trainersMock;
  }

  Future<void> getHighlights() async {
    emit(ResponseStateLoading());

    final highlights = await getIt<TrainingUseCase>().getHighlights();

    emit(ResponseStateSuccess(highlights));
  }

  Future<void> getTrainings() async {
    emit(ResponseStateLoading());

    final trainingList = await getIt<TrainingUseCase>().getTrainingList();

    emit(ResponseStateSuccess(trainingList));
  }

  Future<void> filterList() async {
    emit(ResponseStateLoading());

    List<String> selectedLocations = locations
        .where((locMap) {
          return locMap.values.first;
        })
        .toList()
        .map((locMapF) {
          return locMapF.keys.first;
        })
        .toList();

    List<String> selectedTrainings = trainings
        .where((trainingMap) {
          return trainingMap.values.first;
        })
        .toList()
        .map((trainingMapF) {
          return trainingMapF.keys.first;
        })
        .toList();

    List<String> selectedTrainers = trainers
        .where((trainerMap) {
          return trainerMap.values.first;
        })
        .toList()
        .map((trainerMapF) {
          return trainerMapF.keys.first;
        })
        .toList();

    final trainingList = await getIt<TrainingUseCase>().getFilteredList(
        selectedLocations, selectedTrainings, selectedTrainers);

    emit(ResponseStateSuccess(trainingList));
  }
}
