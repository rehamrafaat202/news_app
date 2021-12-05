import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit_states.dart';
import 'package:news_app/cubit/states.dart';
import '../widgets/shared/components.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    final searchController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return BlocConsumer<NewsCubit, ParentState>(
        listener: (context, state) => {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25)),
                            prefixIcon: const Icon(Icons.search),
                            hintText: "Search"),
                        keyboardType: TextInputType.text,
                        controller: searchController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Search must be empty";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          cubit.getSearch(value);
                        },
                      ),
                      Expanded(
                        child: ConditionalBuilder(
                          condition: cubit.search.isNotEmpty,
                          builder: (context) => ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return defaultBuldArticlItems(
                                  cubit.search[index], context);
                            },
                            itemCount: cubit.search.length,
                          ),
                          fallback: (context) => Center(child: Container()),
                        ),
                      )
                    ],
                  )),
            ),
          );
        });
  }
}
