import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/viewmodel/weather_view_model.dart';

void main() {
  runApp(const MyApp());
}

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

class WeatherApp extends StatelessWidget {
  final TextEditingController _cityController = TextEditingController();

  WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _cityController,
              decoration: const InputDecoration(labelText: 'Enter City Name'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final cityName = _cityController.text;
                weatherBloc.getWeather(cityName);
              },
              child: const Text('Get Weather'),
            ),
            const SizedBox(height: 20),
            BlocBuilder<WeatherViewModel, WeatherState>(
              builder: (context, state) {
                switch (state.runtimeType) {
                  case WeatherLoadingState:
                    return const CircularProgressIndicator();
                  case WeatherLoadedState:
                    final weather = (state as WeatherLoadedState).weather;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('City: ${weather.cityName}'),
                        Text('Temperature: ${weather.temperature}°C'),
                        Text('Description: ${weather.weatherDescription}'),
                      ],
                    );
                  case WeatherErrorState:
                    return Text(
                        'Error: ${(state as WeatherErrorState).errorMessage}');
                  default:
                    return Container(); // Handle other states if needed
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
