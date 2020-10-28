import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/bloc/weather_event.dart';
import 'package:weather_app/utils/debouncer.dart';

class InputField extends StatefulWidget {
  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  TextEditingController _controller;
  final _debouncer = Debouncer(milliseconds: 500);

  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final WeatherBloc weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return TextField(
      controller: _controller,
      onChanged: (text) {
        _debouncer.run(() {
          weatherBloc.add(WeatherLoadEvent(input: text));
        });
      },
    );
  }
}
