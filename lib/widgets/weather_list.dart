import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/bloc/weather_state.dart';

class WeatherList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherEmptyState) {
          return Center(
            child: Text(
              'No data. Please input text',
              style: TextStyle(fontSize: 20),
            ),
          );
        }
        if (state is WeatherLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is WeatherLoadedState) {
          return ListView.builder(
            itemCount: state.loadedWeather.length,
            itemBuilder: (context, index) => Container(
              color: index % 2 == 0 ? Colors.white : Colors.blue[50],
              child: Column(
                children: [
                  Text(
                    'City: ${state.loadedWeather[index].title}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('Latt Long: ${state.loadedWeather[index].latt_long}')
                ],
              ),
            ),
          );
        }
        if (state is WeatherErrorState) {
          return Center(
            child: Text(
              "Error fetching data...",
              style: TextStyle(fontSize: 20),
            ),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
