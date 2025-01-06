import 'package:flutter/material.dart';
import 'package:untitled/weather/services/WeatherService.dart';

import 'Weather.dart';
import 'components/forecast.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherPage> {
  final WeatherService _weatherService = WeatherService();
  final TextEditingController _cityController = TextEditingController();
  Weather? _weather;
  List<Weather> _forecast = [];
  String _errorMessage = '';

  Future<void> _fetchWeather() async {
    final city = _cityController.text.trim();
    if (city.isEmpty) {
      setState(() {
        _errorMessage = 'Please enter a city name';
      });
      return;
    }

    try {
      final weather = await _weatherService.fetchWeather(city);
      final forecast = await _weatherService.fetchForecast(city);
      setState(() {
        _weather = weather;
        _forecast = forecast.take(4).toList(); // Take the first 4 days
        _errorMessage = '';
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to fetch weather data';
        _weather = null;
        _forecast = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _cityController,
              decoration: const InputDecoration(
                labelText: 'Enter City',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.location_city),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _fetchWeather,
              child: const Text('Get Weather'),
            ),
            const SizedBox(height: 16.0),
            if (_errorMessage.isNotEmpty)
              Text(
                _errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
            if (_weather != null)
              Card(
                elevation: 4,
                margin: const EdgeInsets.all(16),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        _weather!.cityName,
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        _weather!.formattedDate,
                        style: const TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      const SizedBox(height: 16.0),
                      Image.network(
                        'http://openweathermap.org/img/wn/${_weather!.icon}@2x.png',
                        width: 100,
                        height: 100,
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildWeatherInfo(Icons.thermostat, _weather!.formattedTemperature),
                          _buildWeatherInfo(Icons.water_drop, '${_weather!.humidity}%'),
                          _buildWeatherInfo(Icons.air, _weather!.formattedWindSpeed),
                          _buildWeatherInfo(Icons.cloudy_snowing, _weather!.formattedPrecipitation),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            if (_forecast.isNotEmpty)
              ForecastComponent(forecast: _forecast), // Use the ForecastComponent
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherInfo(IconData icon, String value) {
    return Column(
      children: [
        Icon(icon, size: 30, color: Colors.blue),
        const SizedBox(height: 4.0),
        Text(
          value,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}