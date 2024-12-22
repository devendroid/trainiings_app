import 'package:flutter/material.dart';

class TrainingDetailScreen extends StatelessWidget {

  final Map<String, String> training;

  const TrainingDetailScreen(this.training);

  @override
  Widget build(BuildContext context) {
    //final Map<String, String> training = ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    return Scaffold(
      appBar: AppBar(title: Text(training['title']!)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(training['cover_image']!, height: 200, fit: BoxFit.cover),
            SizedBox(height: 16),
            Text(
              training['title']!,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 8),
            Text("Date: ${training['date']}"),
            Text("Location: ${training['location']}"),
            SizedBox(height: 16),
            Text(
              "Summary: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ultricies tincidunt ligula a vehicula.",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
