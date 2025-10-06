import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_flutter/additional_information_component.dart';
import 'package:weather_app_flutter/hourly_forecast_component.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  Future getWeather() async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=Phnom+Penh,KH&appid=$apiKey',
        ),
      );

      final data = jsonDecode(response.body);

      return data;
    } catch (e) {
      throw 'Unexpected error occurred';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              flex: 7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset('assets/images/logo.png', height: 40),
                  const SizedBox(width: 8),
                  Text(
                    'Weather App',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ],
              ),
            ),

            Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () {
                    setState(() {
                      getWeather();
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),

      body: FutureBuilder(
        future: getWeather(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator.adaptive());
          }

          if (snapshot.hasError) {
            return Center(child: Text('An error occurred'));
          }

          final data = snapshot.data;

          final weatherData = data["list"][0];

          // Current Info Data
          final currentTemp = weatherData["main"]["temp"];
          final currentSky = weatherData["weather"][0]["main"];

          // Additional Info Data
          final humidity = weatherData["main"]["humidity"];
          final pressure = weatherData["main"]["pressure"];
          final windSpeed = weatherData["wind"]["speed"];

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Main card
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    color: const Color.fromARGB(255, 47, 49, 51),
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                        child: Padding(
                          padding: EdgeInsetsGeometry.all(16),
                          child: Column(
                            children: [
                              Text(
                                '$currentTemp K',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              SizedBox(height: 16),
                              Icon(
                                currentSky == "Clouds"
                                    ? Icons.cloud
                                    : currentSky == "Rain"
                                    ? Icons.thunderstorm
                                    : currentSky == "Clear"
                                    ? Icons.sunny
                                    : Icons.help_outline,
                                size: 60,
                              ),

                              SizedBox(height: 16),
                              Text(currentSky, style: TextStyle(fontSize: 16)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // Forecast card
                const SizedBox(height: 25),
                Container(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Text(
                    'Weather Forecast',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                ),

                const SizedBox(height: 10),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      final forecastData = data["list"][index + 1];
                      final forecastTime = forecastData["dt_txt"];
                      final forecastSky = forecastData["weather"][0]["main"];
                      final forecastTemp = forecastData["main"]["temp"];

                      // Convert time to readable format
                      final parsedTime = DateTime.parse(forecastTime);
                      final time = DateFormat().add_j().format(parsedTime);

                      return HourlyForecastComponent(
                        hourlyTime: time.toString(),
                        hourlyIcon: forecastSky == "Clouds"
                            ? Icons.cloud
                            : forecastSky == "Rain"
                            ? Icons.thunderstorm
                            : forecastSky == "Clear"
                            ? Icons.sunny
                            : Icons.help_outline,
                        hourlyTemp: forecastTemp.toString(),
                      );
                    },
                  ),
                ),

                // Additional information
                const SizedBox(height: 25),
                Container(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Text(
                    'Additional Information',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                ),

                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AdditionalInformationComponent(
                      iconData: Icons.water_drop,
                      dataInfo: 'Humidity',
                      tempData: humidity.toString(),
                    ),
                    AdditionalInformationComponent(
                      iconData: Icons.air,
                      dataInfo: 'Wind Speed',
                      tempData: windSpeed.toString(),
                    ),
                    AdditionalInformationComponent(
                      iconData: Icons.umbrella,
                      dataInfo: 'Pressure',
                      tempData: pressure.toString(),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
