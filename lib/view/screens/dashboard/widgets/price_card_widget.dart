

import 'package:bdo/core/constants/colors.dart';
import 'package:bdo/core/constants/constants.dart';
import 'package:flutter/material.dart';

class PriceCard extends StatelessWidget {
  final String title;
  final String amount;
  final Color? color;

  const PriceCard({
    super.key,
    required this.title,
    required this.amount,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      width: MediaQuery.of(context).size.width * 0.3,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color ?? Colors.blue[800],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              color: white,
            ),
          ),
          kHeight10,
          Text(
            amount,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: white,
            ),
          ),
        ],
      ),
    );
  }
}
