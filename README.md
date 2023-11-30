# Flutter Weather App

A Flutter weather app that utilizes Cubit for state management, Dio for API requests, and follows the MVVM architecture pattern.

## Overview

This Flutter weather app provides a simple and intuitive interface for users to fetch and display weather information for a specific city. It incorporates the Cubit library for efficient state management, Dio for seamless API requests, and follows the MVVM architecture pattern for a modular and maintainable codebase.

## Setup

To run this project locally, follow these steps:

```bash
git clone https://github.com/mahmoud-badwy/weather_app.git
cd your-project
flutter pub get
flutter run
```

## Project Structure

The project is organized using the MVVM pattern:

```
lib/
  data/
    model/
      weather_model.dart
    repository/
      weather_api_service.dart
  presentation/
    viewmodel/
      weather_view_model.dart
  ui/
    screens/
      weather_screen.dart
```

## Features

- User-friendly UI for entering city names and fetching weather data.
- Integration with the OpenWeatherMap API for accurate weather information.
- Efficient state management using Cubit to handle different app states.
- Follows MVVM architecture for a clean and maintainable codebase.

## Usage

1. Launch the app on your preferred Flutter environment (emulator or physical device).
2. Enter a city name in the provided text field.
3. Click the "Get Weather" button to fetch and display the weather information.

## Dependencies

- [Dio](https://pub.dev/packages/dio): A powerful HTTP client for Dart.
- [Equatable](https://pub.dev/packages/equatable): Simplify equality comparisons for complex Dart objects.
- [Flutter Bloc](https://pub.dev/packages/flutter_bloc): Flutter package for managing state using the BLoC pattern.

## Contact

Feel free to contact me for any inquiries or collaboration:

- Email: [mahmoudbadwysliem@gmail.com](mailto:mahmoudbadwysliem@gmail.com)
- Facebook: [Mahmoud Badwy](https://www.facebook.com/mahmoud.badwy25)
- LinkedIn: [Mahmoud Badwi](https://www.linkedin.com/in/mahmoud-badwi/)

## Contributing

Feel free to contribute to this project. Follow the [contribution guidelines](CONTRIBUTING.md).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
