import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weatherapp/services/weather_service.dart';
import '../models/weather_model.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  // API key
  final _weatherService = WeatherService('4d1be21330a7d791d51aeeb6343b520b');
  Weather? _weather;

  // Fetch weather data
  _fetchWeather() async {
    // Get current city
    String cityName = await _weatherService.getCurrentCity();

    // Get weather for the city
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather as Weather?;
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  // Init state
  @override
  void initState() {
    super.initState();
    // Fetch weather on startup
    _fetchWeather();
  }

  // Weather animations
  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return 'assets/sunny.json'; // default to sunny

    switch (mainCondition.toLowerCase()) {
      case 'clouds':
        return 'assets/cloud.json';
      case 'mist':
      case 'smoke':
        return 'assets/smoke.json';
      case 'haze':
        return 'assets/haze.json';
      case 'dust':
      case 'fog':
        return 'assets/fog.json';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'assets/rain.json';
      case 'thunderstorm':
        return 'assets/thunder.json';
      case 'clear':
        return 'assets/sunny.json';
      default:
        return 'assets/sunny.json';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // City name
              Text(
                _weather?.cityName ?? "Loading city...",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              // Weather animation
              SizedBox(
                height: 300,
                width: 500,
                child: Lottie.asset(
                  getWeatherAnimation(_weather?.mainCondition),
                ),
              ),

              // Temperature
              const SizedBox(height: 20),
              Text(
                '${_weather?.temperature.round()}°C',
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),

              // Weather condition
              Text(
                '${_weather?.mainCondition}',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
