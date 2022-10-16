import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/sheared/cubit/states.dart';

import '../sheared/componant/artical.dart';
import '../sheared/cubit/cubit.dart';

class SearchScreen extends StatelessWidget {
  var searchCon = TextEditingController();
  String? values;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, States>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: searchCon,
                  style: const TextStyle(color: Colors.white),
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                      borderSide: BorderSide(),
                    ),
                    label: Text(
                      'Search',
                      style: TextStyle(color: Colors.white),
                    ),
                    prefixIcon: Icon(
                      Icons.search_outlined,
                      color: Colors.white,
                    ),
                    fillColor: Colors.blueGrey,
                    filled: true,
                  ),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'must not be empty';
                    }
                    return null;
                  },
                  onFieldSubmitted: (value) {
                    AppCubit.get(context).getSearch(value);
                  },
                  onChanged: (value) {
                    values = value;
                  },
                ),
              ),
              MaterialButton(
                onPressed: () {
                  AppCubit.get(context).getSearch(values);
                },
                color: Colors.black26,
                child: const Text(
                  'Search',
                  style: TextStyle(color: Colors.teal),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                  child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    articalItem(AppCubit.get(context).search[index], context),
                separatorBuilder: (context, index) => Container(
                  height: 1,
                  color: Colors.grey,
                ),
                itemCount: AppCubit.get(context).search.length,
              )),
            ],
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
