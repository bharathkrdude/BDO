
import 'package:bdo/view/screens/dashboard/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class UpdateCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final Color color;

  const UpdateCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9, // Adjusted width
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1), // Light background color
        borderRadius: BorderRadius.circular(12), // Rounded corners
        border: Border.all(color: Colors.grey[300]!), // Subtle border
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and Time Row
          Row(
            children: [
              // Title
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              // Time
              Text(
                time,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Subtitle
          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
          const Spacer(),
          // Buttons Row
          const Row(
            children: [
              // Notification Button
              Expanded(
                child: CustomButton(
                  label: 'Notification',
                  containerColor: Colors.green,
                  icon: Icons.notifications,
                  iconColor: Colors.white,
                ),
              ),
              SizedBox(width: 8),
              // Notice Button
              Expanded(
                child: CustomButton(
                  label: 'Notice',
                  containerColor: Colors.purple,
                  icon: Icons.newspaper,
                  iconColor: Colors.white,
                ),
              ),
              SizedBox(width: 8),
              // Send SMS Button
              Expanded(
                child: CustomButton(
                  label: 'Send SMS',
                  containerColor: Colors.blue,
                  icon: Icons.send,
                  iconColor: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}