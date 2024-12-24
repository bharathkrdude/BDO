import 'package:bdo/view/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class TeacherDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> teacher;

  const TeacherDetailsScreen({
    super.key,
    required this.teacher,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  CustomAppBar(title: 'Teacher details'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Photo Section
            Container(
              width: double.infinity,
              height: 280,
              decoration: BoxDecoration(
                // borderRadius: const BorderRadius.only(
                //   bottomLeft: Radius.circular(30),
                //   bottomRight: Radius.circular(30),
                // ),
                image: DecorationImage(
                  image: NetworkImage(teacher['photo']),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Basic Information Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name and Role with Call Button
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          teacher['name'],
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color:
                                Color(0xFF1A237E), // Indigo color for the name
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // Call action
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Calling ${teacher['name']}...'),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.call,
                          color: Colors.green,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${teacher['subject']} Specialist',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue[700], // Bright blue for the role
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Key Information Section
                  _buildInfoSection(
                    'Department',
                    teacher['department'],
                    Icons.business,
                    Colors.orange[700]!, // Orange for department
                  ),
                  const SizedBox(height: 16),
                  _buildInfoSection(
                    'Teaching Experience',
                    '${teacher['experience']} of Excellence',
                    Icons.timeline,
                    Colors.green[700]!, // Green for experience
                  ),
                  const SizedBox(height: 16),
                  _buildInfoSection(
                    'Specialization',
                    '${teacher['subject']} and Related Studies',
                    Icons.school,
                    Colors.purple[700]!, // Purple for specialization
                  ),
                  const SizedBox(height: 16),
                  _buildInfoSection(
                    'Email',
                    teacher['email'],
                    Icons.email,
                    Colors.red[700]!, // Red for email
                  ),
                  const SizedBox(height: 32),

                  // Professional Summary
                  const Text(
                    'Professional Summary',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'A dedicated educator with ${teacher['experience']} of experience in teaching ${teacher['subject']}. Specializes in creating an engaging and interactive learning environment that promotes student success and academic excellence.',
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.6,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Teaching Philosophy
                  const Text(
                    'Teaching Philosophy',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Believes in fostering a supportive and challenging learning environment where students can develop critical thinking skills and confidence in their abilities. Emphasizes practical application and real-world connections in teaching.',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.6,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Achievements Section
                  const Text(
                    'Key Achievements',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildAchievementItem(
                    '95% Student Success Rate',
                    'Consistently maintains high academic performance among students',
                  ),
                  const SizedBox(height: 8),
                  _buildAchievementItem(
                    'Innovative Teaching Methods',
                    'Implements modern teaching techniques and technology in classroom',
                  ),
                  const SizedBox(height: 8),
                  _buildAchievementItem(
                    'Student Mentor',
                    'Guided numerous students in academic and career development',
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoSection(
      String title, String value, IconData icon, Color iconColor) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: iconColor,
            size: 24,
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAchievementItem(String title, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.check_circle,
          color: Colors.blue,
          size: 20,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
