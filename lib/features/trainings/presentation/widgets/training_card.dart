import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_trainings_app/core/theme/app_theme.dart';

import '../../../shared/widgets/vertical_dashed_line.dart';

class TrainingCard extends StatelessWidget {
  final String date;
  final String time;
  final String location;
  final String status;
  final String title;
  final double rating;
  final String speakerName;
  final String speakerImage;
  final VoidCallback onEnroll;

  const TrainingCard({
    Key? key,
    required this.date,
    required this.time,
    required this.location,
    required this.status,
    required this.title,
    required this.rating,
    required this.speakerName,
    required this.speakerImage,
    required this.onEnroll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        elevation: 2,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 115,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      date,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).primaryTextColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      time,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Theme.of(context).secondaryTextColor,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      maxLines: 3,
                      location,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Theme.of(context).primaryTextColor,  fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: CustomPaint(
                    size: const Size(1, double.infinity),
                    painter: VerticalDashedLine()
                ),
              ),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        if (status.isNotEmpty)
                          Text(
                            status,
                            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                color: Colors.red, fontWeight: FontWeight.bold
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '$title ($rating)',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).primaryTextColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        // Speaker's Image
                        CircleAvatar(
                          radius: 16,
                          backgroundImage: NetworkImage(speakerImage),
                        ),
                        const SizedBox(width: 8),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Keynote Speaker',
                                maxLines: 1,
                                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                  color: Theme.of(context).primaryTextColor,
                                ),
                              ),
                              Text(
                                speakerName,
                                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                  color: Theme.of(context).secondaryTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    // Enroll Now Button
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        height: 34,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                          ),
                          onPressed: onEnroll,
                          child: const Text('Enrol Now', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}