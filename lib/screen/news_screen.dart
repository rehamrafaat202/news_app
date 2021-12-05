import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/app_cubit.dart';
// import '../network/remote/dio/dio_helper.dart'
import '../cubit/cubit_states.dart';
import '../cubit/states.dart';
import './search_screen.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, ParentState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("News App"),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const SearchScreen();
                      }));
                    },
                    icon: const Icon(Icons.search)),
                IconButton(
                    onPressed: () {
                      AppCubit.get(context).changeMode();
                    },
                    icon: const Icon(Icons.dark_mode))
              ],
            ),
            body: NewsCubit.get(context)
                .allScreen[NewsCubit.get(context).currentIndex],
            bottomNavigationBar: BottomNavigationBar(
                items: NewsCubit.get(context).item,
                currentIndex: NewsCubit.get(context).currentIndex,
                onTap: (index) {
                  NewsCubit.get(context).getPAge(index);
                }),
          );
        },
        listener: (context, state) {});
  }
}
