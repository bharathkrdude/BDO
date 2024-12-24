



import 'package:flutter/material.dart';

class MenuTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const MenuTile({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Background color
        borderRadius: BorderRadius.circular(23), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1), // Subtle shadow
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Circular Avatar (flush with the edge of the container)
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
             
              shape: BoxShape.circle,
              color: color, // Background color of the circle
            ),
            child: Icon(
              icon,
              color: Colors.white, // Icon color
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          // Label Text
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black, // Text color
            ),
          ),
        ],
      ),
    );
  }
}
