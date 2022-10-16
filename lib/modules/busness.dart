import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/sheared/cubit/cubit.dart';

import '../sheared/componant/artical.dart';
import '../sheared/cubit/states.dart';

class BusnussScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, States>(
      builder: (context, state) {
        return ConditionalBuilder(
          condition: cubit.business.length > 0,
          builder: (context) => ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return articalItem(cubit.business[index], context);
            },
            separatorBuilder: (context, index) {
              return Container(
                height: 1,
                color: Colors.grey,
              );
            },
            itemCount: cubit.business.length,
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
      listener: (context, state) {},
    );
  }
}
