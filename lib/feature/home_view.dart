import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/widget/no_weather.dart';
import 'package:weather_app/core/widget/weather_info_body.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/feature/search_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Weather App',
            style: TextStyle(fontSize: 20),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const SearchView();
                      },
                    ),
                  );
                },
                icon: const Icon(Icons.search))
          ],
        ),
        body: BlocBuilder<GetWeatherCubit, WeatherStates>(
          builder: (context, state) {
            if (state is InitialState) {
              return const no_weather_body();
            } else if (state is WeatherLodedState) {
              return weatherInfoBody(
                weather: state.weatherModel,
              );
            } else {
              return const Text('oops there was an error ');
            }
          },
        ));
  }
}
