import 'package:dio/dio.dart';

class WeatherApiService {
  final Dio _dio = Dio();
  final String apiKey = 'f0c27140035a9437bda67e6ab6af3b1d'; 

  Future<Map<String, dynamic>> getWeatherData(String cityName) async {
    try {
      final response = await _dio.get(
        'https://api.openweathermap.org/data/2.5/weather',
        queryParameters: {
          'q': cityName,
          'appid': apiKey,
        },
      );

      // Check if the response contains an error message
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw DioError(
          requestOptions: RequestOptions(path: ''), // Provide a placeholder path
          error: 'Failed to fetch weather data',
        );
      }
    } catch (error) {
      // Handle Dio errors (e.g., network errors)
      throw DioError(
        requestOptions: RequestOptions(path: ''), // Provide a placeholder path
        error: 'Failed to fetch weather data: $error',
      );
    }
  }
}
