import 'package:get_it/get_it.dart';
import 'package:my_trainings_app/features/trainings/domain/usecase/training_usecase.dart';

import '../../features/trainings/data/repository/training_repository_impl.dart';
import '../../features/trainings/domain/repository/training_repository.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  getIt.registerSingleton<TrainingRepository>(TrainingRepositoryImpl());
  getIt.registerSingleton<TrainingUseCase>(TrainingUseCase());
}
