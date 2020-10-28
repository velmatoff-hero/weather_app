import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/services/weather_repository.dart';
import 'package:weather_app/widgets/input_field.dart';
import 'package:weather_app/widgets/weather_list.dart';

class HomePage extends StatelessWidget {
  final weatherRepository = WeatherRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherBloc>(
      create: (context) => WeatherBloc(weathersRepository: weatherRepository),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Weather App'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            InputField(),
            Expanded(
              child: WeatherList(),
            )
          ],
        ),
      ),
    );
  }
}
