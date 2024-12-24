import 'package:bdo/view/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class TimetableScreen extends StatelessWidget {
  const TimetableScreen({super.key});

  // Static timetable data
  final List<Map<String, dynamic>> timetable = const [
    {
      "time": "09:00 AM - 10:00 AM",
      "monday": {"subject": "Mathematics", "teacher": "Mr. John"},
      "tuesday": {"subject": "Physics", "teacher": "Mr. Smith"},
      "wednesday": {"subject": "Biology", "teacher": "Ms. Lily"},
      "thursday": {"subject": "Mathematics", "teacher": "Mr. John"},
      "friday": {"subject": "Economics", "teacher": "Mr. Chris"},
    },
    {
      "time": "10:00 AM - 10:15 AM",
      "monday": {"subject": "Break", "teacher": ""},
      "tuesday": {"subject": "Break", "teacher": ""},
      "wednesday": {"subject": "Break", "teacher": ""},
      "thursday": {"subject": "Break", "teacher": ""},
      "friday": {"subject": "Break", "teacher": ""},
    },
    {
      "time": "10:15 AM - 11:15 AM",
      "monday": {"subject": "Science", "teacher": "Ms. Clara"},
      "tuesday": {"subject": "Chemistry", "teacher": "Ms. Olivia"},
      "wednesday": {"subject": "Geography", "teacher": "Mr. Alex"},
      "thursday": {"subject": "Computer Science", "teacher": "Ms. Clara"},
      "friday": {"subject": "Physics", "teacher": "Mr. Smith"},
    },
    {
      "time": "11:15 AM - 12:15 PM",
      "monday": {"subject": "English", "teacher": "Ms. Emma"},
      "tuesday": {"subject": "History", "teacher": "Mr. Daniel"},
      "wednesday": {"subject": "Art", "teacher": "Ms. Rose"},
      "thursday": {"subject": "English", "teacher": "Ms. Emma"},
      "friday": {"subject": "Chemistry", "teacher": "Ms. Olivia"},
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'TimeTable'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Table Header
                Row(
                  children: [
                    _buildHeaderCell("Time", flex: 2),
                    _buildHeaderCell("Monday"),
                    _buildHeaderCell("Tuesday"),
                    _buildHeaderCell("Wednesday"),
                    _buildHeaderCell("Thursday"),
                    _buildHeaderCell("Friday"),
                  ],
                ),
                const SizedBox(height: 10),

                // Table Rows
                Column(
                  children: timetable.map((entry) => _buildRow(entry)).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Build Header Cell
  Widget _buildHeaderCell(String text, {int flex = 1}) {
    return Container(
      width: 120,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(right: 2),
      decoration: BoxDecoration(
        color: const Color(0xFFB0007D),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Build Row
  Widget _buildRow(Map<String, dynamic> entry) {
    final time = entry["time"];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Time Slot Column
        Container(
          width: 120,
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: const Color(0xFFE4F2FE),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            time,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),

        // Day Columns
        ...["monday", "tuesday", "wednesday", "thursday", "friday"].map((day) {
          final subject = entry[day]["subject"];
          final teacher = entry[day]["teacher"];
          final isBreak = subject == "Break";

          return Container(
            width: 120,
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(left: 2, bottom: 10),
            decoration: BoxDecoration(
              color: isBreak ? Colors.orange.withOpacity(0.2) : Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Column(
              children: [
                Text(
                  subject,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: isBreak ? Colors.orange : Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  teacher,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
