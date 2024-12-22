import 'package:flutter/material.dart';
import 'package:my_trainings_app/features/trainings/presentation/widgets/training_card.dart';
import 'package:my_trainings_app/routing/route_name.dart';

class TrainingList extends StatelessWidget {
  final List<Map<String, String>> trainings;

  const TrainingList({super.key, required this.trainings});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8),
      color: Colors.grey.withOpacity(.2),
      child: ListView.builder(
        itemCount: trainings.length,
        itemBuilder: (context, index) {
          final training = trainings[index];

          return TrainingCard(
            date: training["date"]??"",
            time: training["time"]??"",
            location: training["location"]??"",
            status: 'Filling Fast!',
            title: training["title"]??"",
            rating: 4.6,
            speakerName: training["trainer"]??"",
            speakerImage: training["image"]??"",
            onEnroll: () {
              Navigator.pushNamed(context, RouteName.trainingDetail, arguments: training);
            },
          );
        },
      ),
    );
  }
}
