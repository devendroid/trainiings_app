import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_trainings_app/core/theme/app_theme.dart';

import '../bloc/training_cubit.dart';
import 'filter_modal.dart';

class FilterButton extends StatelessWidget {
  final List<Map<String, String>> trainings;

  const FilterButton(this.trainings, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) =>
                BlocProvider.value(
                  value: context.read<TrainingCubit>(),
                  child: FilterModal(
                    trainers: trainings.map((t) => t['trainer']!).toSet().toList(),
                  ),
                )
        ).whenComplete((){
          context.read<TrainingCubit>().filterList();
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
            border: Border.all(color: Theme.of(context).secondaryTextColor)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.filter_list,
              color: Theme.of(context).secondaryTextColor,
              size: 14,
            ),
            const SizedBox(width: 4,),
            Text(
              "Filter",
              style: TextStyle(
                  fontSize: 14, color: Theme.of(context).secondaryTextColor),
            ),
          ],
        ),
      ),
    );
  }
}