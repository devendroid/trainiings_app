import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_trainings_app/core/theme/app_theme.dart';

import '../bloc/training_cubit.dart';

class FilterModal extends StatefulWidget {
  final List<String> trainers;

  const FilterModal(
      {super.key, required this.trainers});

  @override
  State<StatefulWidget> createState() => FilterModalState();
}

class FilterModalState extends State<FilterModal> {
  final List<String> _filterOptions = <String>[
    "Location",
    "Training Name",
    "Trainer"
  ];

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext buildContext) {
    return DraggableScrollableSheet(
      
      expand: false,
      initialChildSize: 0.6,
      minChildSize: 0.4,
      maxChildSize: 0.6,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                child: Row(
                  children: [
                    Text("Sort and Filters",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold
                        )),
                    const Spacer(),
                    IconButton(
                      icon:  Icon(Icons.clear, color:
                      Theme.of(context).secondaryTextColor,),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ),
              const Divider(),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: _filterOptions.length,
                        itemBuilder: (context, index) {
                          return _filterTitleWidget(
                              _filterOptions[index], _selectedIndex == index,
                              () {
                            setState(() {
                              _selectedIndex = index;
                            });
                          });
                        },
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: _filterOptionsWidget(_selectedIndex, buildContext, scrollController),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _filterTitleWidget(
      String title, bool isSelected, Function()? onSelect) {
    return Material(
      child: ListTile(
        onTap: () {
          onSelect?.call();
        },
        selected: isSelected,
        selectedColor: Colors.black,
        selectedTileColor: Colors.white,
        tileColor: Colors.grey.withOpacity(.2),
        contentPadding: const EdgeInsets.only(left: 0),
        leading: Container(
          color: isSelected ? Colors.redAccent : Colors.transparent,
          width: 6,
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal),
        ),
      ),
    );
  }

  Widget _filterOptionsWidget(int index, BuildContext buildContext, ScrollController scrollController) {

    switch(index) {
      case  0 : {
        return ListView.builder(
            controller: scrollController,
            itemCount: buildContext
                .read<TrainingCubit>()
                .locations
                .length,
            itemBuilder: (context, index) {
              final locationMap = buildContext
                  .read<TrainingCubit>()
                  .locations[index];
              return CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(locationMap.keys.first),
                value: locationMap.values.first,
                onChanged: (value) {
                  setState(() {
                    buildContext
                        .read<TrainingCubit>()
                        .locations[index]
                    [locationMap.keys.first] = value == true;
                  });
                },
              );
            });
       }

      case 1: {
        return ListView.builder(
            controller: scrollController,
            itemCount: buildContext
                .read<TrainingCubit>()
                .trainings
                .length,
            itemBuilder: (context, index) {
              final trainingMap = buildContext
                  .read<TrainingCubit>()
                  .trainings[index];
              return CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(trainingMap.keys.first),
                value: trainingMap.values.first,
                onChanged: (value) {
                  setState(() {
                    buildContext
                        .read<TrainingCubit>()
                        .trainings[index]
                    [trainingMap.keys.first] = value == true;
                  });
                },
              );
            });
      }

      case 2: {
        return ListView.builder(
            controller: scrollController,
            itemCount: buildContext
                .read<TrainingCubit>()
                .trainers
                .length,
            itemBuilder: (context, index) {
              final trainerMap = buildContext
                  .read<TrainingCubit>()
                  .trainers[index];
              return CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(trainerMap.keys.first),
                value: trainerMap.values.first,
                onChanged: (value) {
                  setState(() {
                    buildContext
                        .read<TrainingCubit>()
                        .trainers[index]
                    [trainerMap.keys.first] = value == true;
                  });
                },
              );
            });
      }
    }
    return const SizedBox.shrink();
  }

}

// const Text("Location"),
// ...List.generate(
// widget.locations.length,
// (index) => CheckboxListTile(
// controlAffinity: ListTileControlAffinity.leading,
// title: Text(widget.locations[index]),
// value: false,
// onChanged: (value) {},
// )),
// const Text("Trainer"),
// ...List.generate(
// widget.trainers.length,
// (index) => CheckboxListTile(
// controlAffinity: ListTileControlAffinity.leading,
// title: Text(widget.trainers[index]),
// value: false,
// onChanged: (value) {},
// )),
