import 'package:flutter/material.dart';
import 'package:my_trainings_app/features/trainings/presentation/training_detail_screen.dart';
import 'package:my_trainings_app/routing/route_name.dart';

import '../features/trainings/presentation/home_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case RouteName.trainingDetail:
        final training = settings.arguments as Map<String, String>;
        return MaterialPageRoute(
            builder: (_) => TrainingDetailScreen(training));

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
