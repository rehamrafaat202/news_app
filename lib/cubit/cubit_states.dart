import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import '../network/remote/dio/dio_helper.dart';
import 'package:news_app/widgets/business.dart';
import 'package:news_app/widgets/science.dart';
import 'package:news_app/widgets/sports.dart';

class NewsCubit extends Cubit<ParentState> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> item = const [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.new_label_sharp,
        ),
        label: "News"),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.sports,
        ),
        label: "Sports"),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.science,
        ),
        label: "Science"),
  ];
  List<Widget> allScreen = const [Business(), Sports(), Science()];
  void getPAge(index) {
    currentIndex = index;
    emit(NewsNavgationState());
    getBusiness();
  }

  // String busines = "business";
  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];
  List<dynamic> search = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '1fa8a8274fd94f14badadf38da9dd335',
      },
    ).then((value) {
      //print(value.data['articles'][0]['title']);
      business = value.data['articles'];
      print(business[1]['urlToImage']);

      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  void getSports() {
    emit(NewsGetSportsLoadingState());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '1fa8a8274fd94f14badadf38da9dd335',
      },
    ).then((value) {
      //print(value.data['articles'][0]['title']);
      sports = value.data['articles'];
      print(sports[1]['urlToImage']);

      emit(NewsGetSportsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSportsErrorState(error.toString()));
    });
  }

  void getScience() {
    emit(NewsGetBusinessLoadingState());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '1fa8a8274fd94f14badadf38da9dd335',
      },
    ).then((value) {
      //print(value.data['articles'][0]['title']);
      science = value.data['articles'];
      print(science[1]['urlToImage']);

      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());

    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': '$value',
        'apiKey': '1fa8a8274fd94f14badadf38da9dd335',
      },
    ).then((value) {
      //print(value.data['articles'][0]['title']);
      search = value.data['articles'];

      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }
}
