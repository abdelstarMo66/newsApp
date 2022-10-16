import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/busness.dart';
import 'package:news_app/modules/sciences.dart';
import 'package:news_app/modules/sports.dart';
import 'package:news_app/sheared/cubit/states.dart';
import 'package:news_app/sheared/network/local/cashe_helper.dart';
import 'package:news_app/sheared/network/remote/dio_hekper.dart';

class AppCubit extends Cubit<States> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  List<BottomNavigationBarItem> ItemsBottomNavBar = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.business_outlined),
      label: 'Business',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports_outlined),
      label: 'Sports',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.science_outlined),
      label: 'Science',
    ),
  ];

  List<Widget> BodyScreen = [
    BusnussScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  int currentIndexBottomNavBar = 0;

  void ChangeBottonNavBar(index) {
    currentIndexBottomNavBar = index;
    if (index == 1)
      getSports();
    else if (index == 2) getScience();

    emit(ChangeBottomNavBarState());
  }

  bool DarkMade = false;
  IconData DarkLightMode = Icons.brightness_4_outlined;

  void ChangeMode({bool? isDark}) {
    if (isDark != null) {
      DarkMade = isDark;
      emit(ChangeModeApp());
    } else {
      DarkMade = !DarkMade;
      cacheHelper.putData(key: "DarkMade", value: DarkMade).then((value) {
        emit(ChangeModeApp());
      });
    }
    if (!DarkMade) {
      DarkLightMode = Icons.dark_mode_outlined;
      emit(IconChangeMode());
    } else {
      DarkLightMode = Icons.brightness_4_outlined;
      emit(IconChangeMode());
    }
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(BusinessLoadingState());
    dioHelper.getData(
      url: 'v2/top-headlines',
      Query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '4560b738f4644d7292fcff517e4899c1'
      },
    ).then((value) {
      business = value.data['articles'];
      emit(BusinessSuccessState());
    }).catchError((error) {
      emit(
        BusinessErrorState(error.toString()),
      );
    });
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(SportsLoadingState());

    if (sports.length == 0) {
      dioHelper.getData(
        url: 'v2/top-headlines',
        Query: {
          'country': 'eg',
          'category': 'sports',
          'apiKey': '4560b738f4644d7292fcff517e4899c1'
        },
      ).then((value) {
        sports = value.data['articles'];
        emit(SportsSuccessState());
      }).catchError((error) {
        emit(
          SportsErrorState(error.toString()),
        );
      });
    } else {
      emit(SportsSuccessState());
    }
  }

  List<dynamic> science = [];

  void getScience() {
    emit(ScienceLoadingState());

    if (science.length == 0) {
      dioHelper.getData(
        url: 'v2/top-headlines',
        Query: {
          'country': 'eg',
          'category': 'science',
          'apiKey': '4560b738f4644d7292fcff517e4899c1'
        },
      ).then((value) {
        science = value.data['articles'];
        emit(ScienceSuccessState());
      }).catchError((error) {
        emit(
          ScienceErrorState(error.toString()),
        );
      });
    } else {
      emit(ScienceSuccessState());
    }
  }

  List<dynamic> search = [];

  void getSearch(String? words) {
    emit(SearchLoadingState());
    search = [];

    dioHelper.getData(
      url: 'v2/everything',
      Query: {
        'q': '$words',
        'apiKey': '4560b738f4644d7292fcff517e4899c1',
      },
    ).then((value) {
      search = value.data["articles"];
      print("Done");
      emit(SearchSuccessState());
    }).catchError((e) {
      e.toString();
      emit(SearchErrorState(e.toString()));
    });
  }
}
