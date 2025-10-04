import 'package:flutter/material.dart';

class HourlyForecastComponent extends StatelessWidget {
  const HourlyForecastComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 48, 48, 48),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: SizedBox(
          width: 80,
          child: Column(
            spacing: 4,
            children: [
              Text(
                '09:00',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.cloud, size: 30),
              Text('301.17', style: TextStyle(fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }
}
