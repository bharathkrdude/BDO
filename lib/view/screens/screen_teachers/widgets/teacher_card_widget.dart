import 'package:flutter/material.dart';

class TeacherCard extends StatelessWidget {
  final Map<String, dynamic> teacher;
  final bool isHovered;
  final Function(bool) onHover;
  final VoidCallback onPressed;

  const TeacherCard({
    super.key,
    required this.teacher,
    required this.isHovered,
    required this.onHover,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed, // Handle the tap event
      child: MouseRegion(
        onEnter: (_) => onHover(true),
        onExit: (_) => onHover(false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.only(bottom: 16),
          transform: Matrix4.translationValues(0, isHovered ? -5 : 0, 0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: TeacherCardContent(
            teacher: teacher,
            isHovered: isHovered,
          ),
        ),
      ),
    );
  }
}



class TeacherCardContent extends StatelessWidget {
  final Map<String, dynamic> teacher;
  final bool isHovered;

  const TeacherCardContent({
    super.key,
    required this.teacher,
    required this.isHovered,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              TeacherAvatar(
                photoPath: teacher['photo'],
                isHovered: isHovered,
              ),
              const SizedBox(width: 16),
              TeacherInfo(teacher: teacher),
            ],
          ),
          if (isHovered) ...[
            const SizedBox(height: 12),
            TeacherStats(teacher: teacher),
          ],
        ],
      ),
    );
  }
}

class TeacherAvatar extends StatelessWidget {
  final String photoPath;
  final bool isHovered;

  const TeacherAvatar({
    super.key,
    required this.photoPath,
    required this.isHovered,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.blue.withOpacity(isHovered ? 0.8 : 0.3),
          width: isHovered ? 3 : 2,
        ),
      ),
      child: CircleAvatar(
        radius: 35,
        backgroundImage: NetworkImage(photoPath),
      ),
    );
  }
}


class TeacherInfo extends StatelessWidget {
  final Map<String, dynamic> teacher;

  const TeacherInfo({
    super.key,
    required this.teacher,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            teacher['name'],
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(
                Icons.book,
                size: 16,
                color: Colors.blue,
              ),
              const SizedBox(width: 4),
              Text(
                teacher['subject'],
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            teacher['department'],
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

class TeacherStats extends StatelessWidget {
  final Map<String, dynamic> teacher;

  const TeacherStats({
    super.key,
    required this.teacher,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InfoChip(icon: Icons.timeline, label: teacher['experience']),
        const InfoChip(icon: Icons.star, label: '4.8/5'),
        const InfoChip(icon: Icons.people, label: '120+ Students'),
      ],
    );
  }
}

class InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const InfoChip({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: Colors.blue),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.blue,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
