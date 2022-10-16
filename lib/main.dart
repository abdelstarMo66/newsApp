import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_layout.dart';
import 'package:news_app/sheared/app_theme/dark_theme.dart';
import 'package:news_app/sheared/app_theme/light_theme.dart';
import 'package:news_app/sheared/cubit/cubit.dart';
import 'package:news_app/sheared/cubit/states.dart';
import 'package:news_app/sheared/network/local/cashe_helper.dart';
import 'package:news_app/sheared/network/remote/dio_hekper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  dioHelper.init();
  await cacheHelper.init();
  bool? isDark = cacheHelper.getData(key: 'DarkMade');
  runApp(NewsApp(isDark));
}

class NewsApp extends StatelessWidget {
  @override
  final bool? isDark;
  NewsApp(this.isDark);

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()
        ..ChangeMode(isDark: isDark)
        ..getBusiness(),
      child: BlocConsumer<AppCubit, States>(
        builder: (context, states) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: layout(),
            theme: LightTheme,
            darkTheme: DarkTheme,
            themeMode: AppCubit.get(context).DarkMade
                ? ThemeMode.dark
                : ThemeMode.light,
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
