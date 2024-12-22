import 'package:my_trainings_app/features/trainings/domain/repository/training_repository.dart';
import '../../../../core/di/dependencies.dart';

class GetTrainingList {
  Future<List<Map<String, String>>> call() {
    return getIt<TrainingRepository>().getTrainings();
  }
}
