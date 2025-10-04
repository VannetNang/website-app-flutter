import 'package:flutter/material.dart';

class AdditionalInformationComponent extends StatelessWidget {
  final IconData iconData;
  final String dataInfo;
  final String tempData;

  const AdditionalInformationComponent({
    super.key,
    required this.iconData,
    required this.dataInfo,
    required this.tempData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(iconData, size: 30),
        const SizedBox(height: 5),

        Text(dataInfo, style: TextStyle(color: Colors.grey)),
        const SizedBox(height: 5),
        
        Text(tempData, style: TextStyle(fontSize: 16)),
      ],
    );
  }
}
