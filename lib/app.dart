import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../presentation/viewmodel/weather_view_model.dart';
import 'ui/screens/weather_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => WeatherViewModel(),
        child: WeatherApp(),
      ),
    );
  }
}
