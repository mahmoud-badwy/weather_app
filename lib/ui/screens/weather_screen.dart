// Update lib/ui/screens/weather_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../presentation/viewmodel/weather_view_model.dart';

class WeatherApp extends StatelessWidget {
  final TextEditingController _cityController = TextEditingController();

  WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _cityController,
              decoration: const InputDecoration(
                labelText: 'Enter City Name',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.location_city),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final cityName = _cityController.text;
                weatherBloc.getWeather(cityName);
              },
              style: ElevatedButton.styleFrom(
                // backgroundColor: Colors.,
                textStyle: const TextStyle(fontSize: 16),
              ),
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
                    return Card(
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'City: ${weather.cityName}',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Temperature: ${weather.temperature}°C',
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Description: ${weather.weatherDescription}',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    );
                  case WeatherErrorState:
                    return Text(
                      'Error: ${(state as WeatherErrorState).errorMessage}',
                      style: const TextStyle(color: Colors.red),
                    );
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
