class WeatherModel {
  final String cityName;
  final double temperature;
  final String weatherDescription;

  WeatherModel({
    required this.cityName,
    required this.temperature,
    required this.weatherDescription,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      weatherDescription: json['weather'][0]['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': cityName,
      'main': {'temp': temperature},
      'weather': [{'description': weatherDescription}],
    };
  }
}
