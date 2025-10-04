import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app_flutter/additional_information_component.dart';
import 'package:weather_app_flutter/hourly_forecast_component.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Weather App',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              print('Icon clicked...');
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),

      body: Padding(
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
                            '300.67 K',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 16),
                          Icon(Icons.cloud, size: 60),

                          SizedBox(height: 16),
                          Text('Rain', style: TextStyle(fontSize: 16)),
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 2,
                children: [
                  HourlyForecastComponent(
                    hourlyTime: '9:00',
                    hourlyIcon: Icons.thunderstorm,
                    hourlyTemp: '296.12',
                  ),
                  HourlyForecastComponent(
                    hourlyTime: '9:00',
                    hourlyIcon: Icons.sunny,
                    hourlyTemp: '296.12',
                  ),
                  HourlyForecastComponent(
                    hourlyTime: '9:00',
                    hourlyIcon: Icons.cloud,
                    hourlyTemp: '296.12',
                  ),
                  HourlyForecastComponent(
                    hourlyTime: '9:00',
                    hourlyIcon: Icons.sunny,
                    hourlyTemp: '296.12',
                  ),
                ],
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
                  tempData: '90',
                ),
                AdditionalInformationComponent(
                  iconData: Icons.air,
                  dataInfo: 'Wind Speed',
                  tempData: '7.67',
                ),
                AdditionalInformationComponent(
                  iconData: Icons.umbrella,
                  dataInfo: 'Pressure',
                  tempData: '1006',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
