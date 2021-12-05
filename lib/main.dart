import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/app_cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/network/local/shared_preference.dart';
import './network/remote/dio/dio_helper.dart';
import 'package:news_app/screen/news_screen.dart';
import './cubit/cubit_obsever.dart';
import 'cubit/cubit_states.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  blocObserver:
  MyBlocObserver();
  DioHelper.init();
  await CrashHelper.init();
  bool? isDark = CrashHelper.getBooleanData(key: 'isDark');
  print(isDark);
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  late final bool? isDark;
  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit()..changeMode(fromCashed: isDark),
        ),
        BlocProvider(
          create: (context) => NewsCubit()
            ..getBusiness()
            ..getSports()
            ..getScience(),
        )
      ],
      child: BlocConsumer<AppCubit, ParentState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            title: 'NewsApp',
            theme: ThemeData(
              textTheme: const TextTheme(
                  bodyText1: TextStyle(color: Colors.black, fontSize: 20)),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed),
              primarySwatch: Colors.deepOrange,
            ),
            darkTheme: ThemeData(
                hintColor: Colors.white,
                iconTheme: const IconThemeData(color: Colors.white),
                primarySwatch: Colors.deepOrange,
                textTheme: const TextTheme(
                    bodyText1: TextStyle(color: Colors.white, fontSize: 20)),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    backgroundColor: Colors.black,
                    type: BottomNavigationBarType.fixed,
                    unselectedIconTheme: IconThemeData(color: Colors.grey),
                    unselectedItemColor: Colors.grey),
                scaffoldBackgroundColor: Colors.black,
                appBarTheme: const AppBarTheme(
                  elevation: 0.7,
                  backgroundColor: Colors.black,
                  iconTheme: IconThemeData(color: Colors.white),
                  toolbarTextStyle: TextStyle(color: Colors.white),
                )),
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: const NewsScreen(),
          );
        },
      ),
    );
  }
}
