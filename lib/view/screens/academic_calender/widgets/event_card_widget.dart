import 'package:bdo/core/constants/colors.dart';
import 'package:bdo/view/screens/academic_calender/academic_calender.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventCard extends StatelessWidget {
  final AcademicEvent event;
  final String uniqueId;

  const EventCard({
    super.key,
    required this.event,
    required this.uniqueId,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: white,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ExpansionTile(
        key: ValueKey('event_${event.id}_$uniqueId'),
        leading: Container(
          width: 4,
          height: 40,
          decoration: BoxDecoration(
            color: event.typeColor,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        title: Text(
          event.title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          DateFormat('EEEE, MMMM d').format(event.date),
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.description,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 12),
                Chip(
                  label: Text(
                    event.type,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  backgroundColor: event.typeColor,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
