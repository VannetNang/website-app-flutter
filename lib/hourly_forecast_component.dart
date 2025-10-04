import 'package:flutter/material.dart';

class HourlyForecastComponent extends StatelessWidget {
  final String hourlyTime;
  final IconData hourlyIcon;
  final String hourlyTemp;

  const HourlyForecastComponent({
    super.key,
    required this.hourlyTime,
    required this.hourlyIcon,
    required this.hourlyTemp,
  });

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
                hourlyTime,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Icon(hourlyIcon, size: 30),
              Text(hourlyTemp),
            ],
          ),
        ),
      ),
    );
  }
}
