import 'package:my_trainings_app/features/trainings/domain/usecase/get_filtered_list.dart';
import 'package:my_trainings_app/features/trainings/domain/usecase/get_highlights.dart';

import 'get_training_list.dart';

class TrainingUseCase {

  GetTrainingList getTrainingList = GetTrainingList();
  GetHighlights getHighlights = GetHighlights();
  GetFilteredList getFilteredList = GetFilteredList();

}