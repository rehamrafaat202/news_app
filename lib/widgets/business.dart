import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit_states.dart';
import 'package:news_app/cubit/states.dart';
import '../widgets/shared/components.dart';

class Business extends StatelessWidget {
  const Business({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, ParentState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return ConditionalBuilder(
          condition: cubit.business.isNotEmpty,
          builder: (context) => ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return defaultBuldArticlItems(cubit.business[index], context);
            },
            itemCount: cubit.business.length,
          ),
          fallback: (context) => const Center(
            child: CircularProgressIndicator(
              color: Colors.deepOrange,
            ),
          ),
        );
      },
    );
  }
}
