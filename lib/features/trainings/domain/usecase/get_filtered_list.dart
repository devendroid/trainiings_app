import 'package:my_trainings_app/features/trainings/domain/repository/training_repository.dart';
import '../../../../core/di/dependencies.dart';

class GetFilteredList {

  Future<List<Map<String, String>>> call(List<String> selectedLocations,
      List<String> selectedTrainings, List<String> selectedTrainers) async {
    final trainingList = await getIt<TrainingRepository>().getTrainings();

    // Filtering logic
    List<Map<String, String>> filteredTrainings = trainingList.where((
        training) {
      // Check if the location matches any of the selected locations
      bool matchesLocation = selectedLocations == null ||
          selectedLocations.isEmpty ||
          selectedLocations.contains(training['location']);

      // Check if the trainings matches any of the selected training
      bool matchesTraining = selectedTrainings == null ||
          selectedTrainings.isEmpty ||
          selectedTrainings.contains(training['title']);

      // Check if the trainer matches any of the selected trainers
      bool matchesTrainer = selectedTrainers == null ||
          selectedTrainers.isEmpty ||
          selectedTrainers.contains(training['trainer']);

      return matchesLocation && matchesTraining && matchesTrainer;
    }).toList();

    return filteredTrainings;
  }

}