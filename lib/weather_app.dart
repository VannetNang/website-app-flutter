import 'package:flutter/material.dart';
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
            Card(
              color: const Color.fromARGB(255, 47, 49, 51),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: SizedBox(
                width: double.infinity,
                height: 180,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '300.67 K',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.cloud, size: 60),
                    Text('Rain', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),

            // Forecast card
            const SizedBox(height: 25),
            Container(
              alignment: AlignmentGeometry.centerLeft,
              child: Text(
                'Weather Forecast',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              ),
            ),

            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 4,
                children: [
                  HourlyForecastComponent(),
                  HourlyForecastComponent(),
                  HourlyForecastComponent(),
                  HourlyForecastComponent(),
                ],
              ),
            ),

            // Additional information
            const SizedBox(height: 25),
            Placeholder(fallbackHeight: 150),
          ],
        ),
      ),
    );
  }
}
