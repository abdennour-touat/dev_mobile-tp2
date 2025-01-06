import 'package:flutter/material.dart';

import '../Weather.dart';
class ForecastComponent extends StatelessWidget {
  final List<Weather> forecast;

  const ForecastComponent({Key? key, required this.forecast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '4-Day Forecast',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        SizedBox(
          height: 150, // Fixed height for the horizontal ListView
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: forecast.length,
            itemBuilder: (context, index) {
              final day = forecast[index];
              return Container(
                width: 110, // Slightly reduced width for each card
                margin: const EdgeInsets.all(4), // Reduced margin
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(6.0), // Reduced padding
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          day.formattedDay,
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold), // Smaller font size
                        ),
                        const SizedBox(height: 2.0), // Reduced spacing
                        Image.network(
                          'http://openweathermap.org/img/wn/${day.icon}@2x.png',
                          width: 30, // Smaller image size
                          height: 30,
                        ),
                        const SizedBox(height: 2.0), // Reduced spacing
                        Text(
                          day.formattedTemperature,
                          style: const TextStyle(fontSize: 12), // Smaller font size
                        ),
                        const SizedBox(height: 2.0), // Reduced spacing
                        _buildWeatherInfo(Icons.water_drop, '${day.humidity}%'),
                        const SizedBox(height: 2.0), // Reduced spacing
                        _buildWeatherInfo(Icons.air, day.formattedWindSpeed),
                        const SizedBox(height: 2.0), // Reduced spacing
                        _buildWeatherInfo(Icons.cloudy_snowing, day.formattedPrecipitation),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildWeatherInfo(IconData icon, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 12), // Smaller icon size
        const SizedBox(width: 2.0), // Reduced spacing
        Text(
          value,
          style: const TextStyle(fontSize: 10), // Smaller font size
        ),
      ],
    );
  }
}