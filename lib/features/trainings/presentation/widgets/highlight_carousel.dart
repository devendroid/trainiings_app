import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../routing/route_name.dart';
import '../../../shared/modal/api_resp_state.dart';
import '../bloc/training_cubit.dart';

class HighlightCarousel extends StatelessWidget {
  HighlightCarousel({Key? key}) : super(key: key);
  var trainings = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TrainingCubit()..getHighlights(),
      child:
          BlocBuilder<TrainingCubit, ResponseState>(builder: (context, state) {
        if (state is ResponseStateLoading) {
          return const SizedBox.shrink();
        } else if (state is ResponseStateEmpty) {
        } else if (state is ResponseStateSuccess) {
          trainings = state.data as List<Map<String, String>>;
        }
        return CarouselSlider(
          options: CarouselOptions(
            height: 180.0,
            autoPlay: false,
            enlargeCenterPage: true,
          ),
          items: trainings.map((training) {
            return Builder(
              builder: (BuildContext context) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RouteName.trainingDetail,
                        arguments: training);
                  },
                  child: Card(
                    elevation: 5,
                    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(
                          training['cover_image']!,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: Colors.black.withOpacity(.4),
                        ),
                        Positioned(
                          bottom: 1,
                          left: 8,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                training['title'] ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${training['location']}, ${training['date']}",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(color: Colors.white70),
                              ),
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("\$975",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall
                                            ?.copyWith(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                decorationColor:
                                                    Theme.of(context)
                                                        .primaryColor,
                                                decorationThickness: 2.0)),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text("\$885",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge
                                            ?.copyWith(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontWeight: FontWeight.bold,
                                            ))
                                  ]),
                            ],
                          ),
                        ),
                        Positioned(
                          right: 8,
                          bottom: 8,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "View Details ",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(color: Colors.white70),
                              ),
                              Icon(
                                Icons.arrow_forward_outlined,
                                size: 16,
                                color: Colors.white70,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }).toList(),
        );
      }),
    );
  }
}
