import 'package:dio/dio.dart';

class WeatherApiService {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> getWeatherData(String cityName) async {
    // Use the provided sample JSON response for testing
    final sampleJsonResponse = {
      "name": "Beheira",
      "main": {"temp": 295.87},
      "weather": [{"description": "clear sky"}],
    };

    return sampleJsonResponse;
  }
}
