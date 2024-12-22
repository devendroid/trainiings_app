import '../../../../core/datasource/mock_trainings.dart';
import '../../domain/repository/training_repository.dart';

class TrainingRepositoryImpl extends TrainingRepository{

  @override
  Future<List<Map<String, String>>> getHighlights() async {
    return mockTrainingsHighlights;
  }

  @override
  Future<List<Map<String, String>>> getTrainings() async {
    return mockTrainings;
  }

}