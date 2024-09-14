import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  static const BASE_URL = 'http://api.openweathermap.org/data/2.5/weather';
  final String apiKey;

  WeatherService(this.apiKey);

  Future<Weather> getWeather(String cityName) async {
    final response = await http.get(Uri.parse('$BASE_URL?q=$cityName&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<String> getCurrentCity() async {
    try {
      // Check and request location permission if needed
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission != LocationPermission.whileInUse && permission != LocationPermission.always) {
          throw Exception('Location permission denied');
        }
      }

      // Define location settings
      LocationSettings locationSettings = const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      );

      // Fetch the current location with updated settings
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: locationSettings,
      );

      // Convert the location into a list of placemark objects
      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);

      // Extract the city name from the first placemark
      String? city = placemarks.isNotEmpty ? placemarks[0].locality : null;

      return city ?? "Unknown City";
    } catch (e) {
      print('Error fetching location: $e');
      return "Unknown City";
    }
  }
}
