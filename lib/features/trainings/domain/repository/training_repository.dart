abstract class TrainingRepository {
  Future<List<Map<String, String>>> getHighlights();

  Future<List<Map<String, String>>> getTrainings();
}
