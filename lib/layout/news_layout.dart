import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/sheared/cubit/cubit.dart';
import 'package:news_app/sheared/cubit/states.dart';

import '../modules/search.dart';

class layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, States>(
      builder: (context, states) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'News App ',
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.search_outlined),
              ),
              IconButton(
                onPressed: () {
                  cubit.ChangeMode();
                },
                icon: Icon(cubit.DarkLightMode),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.ItemsBottomNavBar,
            onTap: (index) {
              cubit.ChangeBottonNavBar(index);
            },
            currentIndex: cubit.currentIndexBottomNavBar,
          ),
          body: cubit.BodyScreen[cubit.currentIndexBottomNavBar],
        );
      },
      listener: (context, state) {},
    );
  }
}
