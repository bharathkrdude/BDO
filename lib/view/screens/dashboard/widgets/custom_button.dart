import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  final String label;
  final Color containerColor;
  final IconData icon;
  final Color iconColor;

  const CustomButton({
    super.key,
    required this.label,
    required this.containerColor,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: iconColor,
            size: 16,
          ),
          const SizedBox(width: 4),
          Flexible(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
              overflow: TextOverflow.ellipsis, // Prevent overflow
              maxLines: 1, // Ensure single-line text
            ),
          ),
        ],
      ),
    );
  }
}
