import 'package:bdo/view/screens/screen_teachers/teacher_details_screen/Teacher_details_screen.dart';
import 'package:bdo/view/screens/screen_teachers/widgets/teacher_card_widget.dart';
import 'package:bdo/view/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class ScreenTeachers extends StatefulWidget {
  const ScreenTeachers({super.key});

  @override
  State<ScreenTeachers> createState() => _ScreenTeachersState();
}

class _ScreenTeachersState extends State<ScreenTeachers> {
  int? hoveredIndex;

  final List<Map<String, dynamic>> teachers = [
    {
      'name': 'Treesa Jacob',
      'photo':
          'https://d19d5sz0wkl0lu.cloudfront.net/dims4/default/b2928d2/2147483647/resize/800x%3E/quality/90/?url=https%3A%2F%2Fatd-brightspot.s3.amazonaws.com%2F7f%2F38%2Fb37d0d6148e48fea8f76209eb3bb%2Fbigstock-pretty-teacher-smiling-at-came-69887626-1.jpg',
      'subject': 'Mathematics',
      'department': 'Science Department',
      'experience': '8 years',
      'email': 'example@example.com',
    },
    {
      'name': 'Jane Smith',
      'photo':
          'https://static1.bigstockphoto.com/7/7/2/large1500/277620496.jpg',
      'subject': 'Science',
      'department': 'Science Department',
      'experience': '12 years',
      'email': 'test@example.com',
    },
    // Add more teachers...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: CustomAppBar(
        title: 'Teachers',
      ),
      body: Column(
        children: [
          // const StatsSection(),
          Expanded(
            child: TeachersList(
              teachers: teachers,
              hoveredIndex: hoveredIndex,
              onHover: (index) => setState(() => hoveredIndex = index),
            ),
          ),
        ],
      ),
    );
  }
}

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          StatCard(title: 'Total Teachers', value: '25', icon: Icons.people),
          StatCard(title: 'Departments', value: '8', icon: Icons.category),
          StatCard(title: 'Experience', value: '10+', icon: Icons.timeline),
        ],
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}

class TeachersList extends StatelessWidget {
  final List<Map<String, dynamic>> teachers;
  final int? hoveredIndex;
  final Function(int?) onHover;

  const TeachersList({
    super.key,
    required this.teachers,
    required this.hoveredIndex,
    required this.onHover,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: teachers.length,
      itemBuilder: (context, index) {
        return TeacherCard(
          teacher: teachers[index],
          isHovered: hoveredIndex == index,
          onHover: (isHovered) => onHover(isHovered ? index : null),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    TeacherDetailsScreen(teacher: teachers[index])));
          },
        );
      },
    );
  }
}
