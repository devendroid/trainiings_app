import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_trainings_app/core/theme/font_family.dart';
import 'package:my_trainings_app/features/trainings/presentation/widgets/filter_button.dart';
import 'package:my_trainings_app/features/trainings/presentation/widgets/training_list.dart';

import '../../shared/modal/api_resp_state.dart';
import 'bloc/training_cubit.dart';
import 'widgets/highlight_carousel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TrainingCubit()..getTrainings(),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: Text(
              'Trainings',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Colors.white,
                  fontFamily: FontFamily.accolade,
                  letterSpacing: 1.8),
            ),
            actions: const [
              IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: null,
              ),
            ],
          ),
          body: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 180,
                color: Theme.of(context).primaryColor,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Highlights",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                  HighlightCarousel(),
                  BlocBuilder<TrainingCubit, ResponseState>(
                      builder: (context, state) {
                    if (state is ResponseStateLoading) {
                      // Show loading or shimmer effects
                    } else if (state is ResponseStateError) {
                      // Handle Error
                    } else if (state is ResponseStateNoInternet) {
                      // Handle Offline conditions
                    } else if (state is ResponseStateSuccess) {
                      var trainings = state.data as List<Map<String, String>>;
                      return Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: FilterButton(trainings),
                            ),
                            Expanded(child: TrainingList(trainings: trainings)),
                          ],
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  })
                ],
              ),
            ],
          )),
    );
  }
}
