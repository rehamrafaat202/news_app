import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app/cubit/cubit_states.dart';
import 'package:news_app/widgets/shared/components.dart';

class Science extends StatelessWidget {
  const Science({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = NewsCubit.get(context);
    return ConditionalBuilder(
        condition: cubit.science.isNotEmpty,
        builder: (context) => ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return defaultBuldArticlItems(cubit.science[index], context);
            },
            itemCount: cubit.science.length),
        fallback: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}
