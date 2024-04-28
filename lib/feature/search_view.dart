// ignore_for_file: use_build_context_synchronously, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search City'),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: TextField(
          onSubmitted: (value) async {
            var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
            getWeatherCubit.getWeather(cityName: value);
            Navigator.pop(context);
          },
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 28, horizontal: 16),
            labelText: 'Search',
            hintText: ('Enter your city'),
            suffixIcon: Icon(Icons.search),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
          ),
        ),
      )),
    );
  }
}
