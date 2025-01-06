import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Weather.dart';

class WeatherService {
  static const String _apiKeyWeather = 'fc8b5789ca0df6d39d71ef2add15f29e';
  static const String _apiKey = 'cc378b67acc39d67037f1f1db1d51715'; // Replace with your OpenWeather API key
  static const String _baseUrl = 'https://api.openweathermap.org/data/2.5';

  Future<Weather> fetchWeather(String city) async {
    final response = await http.get(
        Uri.parse('$_baseUrl/weather?q=$city&appid=$_apiKey&units=metric'));

    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {

      throw Exception('Failed to load weather data');
    }
  }

  Future<List<Weather>> fetchForecast(String city) async {
    final response = await http.get(Uri.parse(
        '$_baseUrl/forecast?q=$city&appid=$_apiKey'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<Weather> forecast = [];
      DateTime? previousDate;

      // Extract the list of weather data
      for (var item in data['list']) {
        final date = DateTime.fromMillisecondsSinceEpoch(item['dt'] * 1000);

        // Check if this is the first timestamp of the day
        if (previousDate == null || !_isSameDay(date, previousDate)) {
          forecast.add(Weather.fromJson(item));
          previousDate = date; // Update the previous date
        }

        // Stop after collecting 4 days
        if (forecast.length >= 4) {
          break;
        }
      }

      print('Forecast Data: $forecast'); // Debugging: Print the forecast data
      return forecast;
    } else {
      throw Exception('Failed to load forecast data');
    }
  }

// Helper method to check if two dates are the same day
  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year && date1.month == date2.month && date1.day == date2.day;
  }
}

  // Future<List<Weather>> fetchForecast(String city) async {
  //   final response = await http.get(Uri.parse('$_baseUrl/forecast?q=$city&appid=$_apiKey&units=metric'));
  //
  //   if (response.statusCode == 200) {
  //     final data = jsonDecode(response.body);
  //     final List<Weather> forecast = [];
  //
  //     // Extract the list of weather data
  //     for (var item in data['list']) {
  //       final date = DateTime.fromMillisecondsSinceEpoch(item['dt'] * 1000);
  //       // Take only one entry per day (e.g., at 12:00 PM)
  //       if (date.hour == 12) {
  //         forecast.add(Weather.fromJson(item));
  //       }
  //     }
  //
  //     return forecast.take(4).toList(); // Take the first 4 days
  //   } else {
  //     throw Exception('Failed to load forecast data');
  //   }
  // }

    // Future<List<Weather>> fetchForecast(String city) async {
    //   final response = await http.get(Uri.parse('$_baseUrl/forecast?q=$city&appid=$_apiKey&units=metric'));
    //
    //   if (response.statusCode == 200) {
    //     final data = jsonDecode(response.body);
    //     print("forecast data : ");
    //     print(data);
    //     final List<Weather> forecast = [];
    //
    //     for (var item in data['list']) {
    //       forecast.add(Weather.fromJson(item));
    //     }
    //     return forecast;
    //   } else {
    //     throw Exception('Failed to load forecast data');
    //   }
    // }

