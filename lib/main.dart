import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_trainings_app/core/di/dependencies.dart';
import 'package:my_trainings_app/routing/route_name.dart';
import 'package:my_trainings_app/routing/router.dart';

import 'core/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator.configureDependencies();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trainings App',
      theme: AppTheme.lightTheme,
      initialRoute: RouteName.home,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
