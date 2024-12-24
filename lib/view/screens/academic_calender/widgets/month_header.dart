



import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MonthHeader extends StatelessWidget {
  final int month;

  const MonthHeader({
    super.key,
    required this.month,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: Colors.grey[100],
      child: Row(
        children: [
          Text(
            DateFormat('MMMM').format(DateTime(2025, month)),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          const Spacer(),
          Text(
            '2025',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}