import 'package:flutter/material.dart';

class AdditionalInformationComponent extends StatelessWidget {
  const AdditionalInformationComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.water_drop, size: 30),
        const SizedBox(height: 5),
        Text('Humidity', style: TextStyle(color: Colors.grey),),
        const SizedBox(height: 5),
        Text('90', style: TextStyle(fontSize: 16),),
      ],
    );
  }
}
