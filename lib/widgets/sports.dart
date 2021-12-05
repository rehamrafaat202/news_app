import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import 'package:news_app/cubit/cubit_states.dart';
import '../widgets/shared/components.dart';

class Sports extends StatelessWidget {
  const Sports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = NewsCubit.get(context);
    return ConditionalBuilder(
        condition: cubit.sports.isNotEmpty,
        builder: (context) => ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return defaultBuldArticlItems(cubit.sports[index], context);
            },
            itemCount: cubit.sports.length),
        fallback: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}
