import 'package:flutter/material.dart';

class HourlyForecastComponent extends StatelessWidget {
  const HourlyForecastComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 47, 49, 51),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: 80,
          child: Column(
            spacing: 4,
            children: [
              Text(
                '09:00',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.cloud, size: 40),
              Text('301.17'),
            ],
          ),
        ),
      ),
    );
  }
}
