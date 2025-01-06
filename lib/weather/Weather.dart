import 'package:intl/intl.dart';

// class Weather {
//   final String cityName;
//   final DateTime date;
//   final String icon;
//   final double precipitation;
//   final int humidity;
//   final double temperature;
//   final double windSpeed;
//
//   Weather({
//     required this.cityName,
//     required this.date,
//     required this.icon,
//     required this.precipitation,
//     required this.humidity,
//     required this.temperature,
//     required this.windSpeed,
//   });
//
//   factory Weather.fromJson(Map<String, dynamic> json) {
//     return Weather(
//       cityName: json['name'] ?? 'Unknown',
//       date: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
//       icon: json['weather'][0]['icon'],
//       precipitation: (json['rain']?['1h'] ?? 0.0).toDouble(), // Convert to double
//       humidity: json['main']['humidity'],
//       temperature: (json['main']['temp']).toDouble(), // Convert to double
//       windSpeed: (json['wind']['speed']).toDouble(), // Convert to double
//     );
//   }
//
//   String get formattedDate {
//     return DateFormat('MMMM d, y').format(date); // Format: "October 10, 2023"
//   }
//
//   String get formattedDay {
//     return DateFormat('EEEE').format(date); // Format: "Monday"
//   }
// }

class Weather {
  final String cityName;
  final DateTime date;
  final String icon;
  final double precipitation;
  final int humidity;
  final double temperature;
  final double windSpeed;

  Weather({
    required this.cityName,
    required this.date,
    required this.icon,
    required this.precipitation,
    required this.humidity,
    required this.temperature,
    required this.windSpeed,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'] ?? 'Unknown',
      date: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
      icon: json['weather'][0]['icon'],
      precipitation: (json['rain']?['1h'] ?? 0.0).toDouble(),
      humidity: json['main']['humidity'],
      temperature: (json['main']['temp']).toDouble(),
      windSpeed: (json['wind']['speed']).toDouble(),
    );
  }

  String get formattedDate {
    return DateFormat('MMMM d, y').format(date); // Format: "October 10, 2023"
  }

  String get formattedDay {
    return DateFormat('EEEE').format(date); // Format: "Monday"
  }

  String get formattedTemperature {
    return '${temperature.toStringAsFixed(1)}°C'; // Format: "15.3°C"
  }

  String get formattedWindSpeed {
    return '${windSpeed.toStringAsFixed(1)} m/s'; // Format: "5.2 m/s"
  }

  String get formattedPrecipitation {
    return '${precipitation.toStringAsFixed(1)} mm'; // Format: "2.5 mm"
  }
}