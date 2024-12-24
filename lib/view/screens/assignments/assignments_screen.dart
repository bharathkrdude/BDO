import 'package:bdo/core/constants/colors.dart';
import 'package:bdo/view/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';



class AssignmentsScreen extends StatelessWidget {
  const AssignmentsScreen({super.key});

  // Static assignments data
  final List<Map<String, dynamic>> assignments = const [
    {
      "title": "Mathematics Assignment Lab Report Presentation Presentation Presentation Presentation PresentationPresentation Presentation Presentation PresentationPresentation",
      "dueDate": "2024-12-15",
      "subject": "Mathematics",
      "teacher": "Mr. John",
    },
    {
      "title": "Physics Lab Report",
      "dueDate": "2024-12-17",
      "subject": "Physics",
      "teacher": "Ms. Clara",
    },
    {
      "title": "English Essay",
      "dueDate": "2024-12-20",
      "subject": "English",
      "teacher": "Ms. Emma",
    },
    {
      "title": "History Presentation",
      "dueDate": "2024-12-22",
      "subject": "History",
      "teacher": "Mr. Daniel",
    },
    {
      "title": "Biology Research Paper",
      "dueDate": "2024-12-25",
      "subject": "Biology",
      "teacher": "Ms. Lily",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(title: 'Assignments'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: assignments.length,
          itemBuilder: (context, index) {
            final assignment = assignments[index];
            return GestureDetector(
              onTap: () {
                // Handle assignment click
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AssignmentDetailsScreen(
                      assignment: assignment,
                    ),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black.withOpacity(0.15)),
                  color: white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 5,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Row for Subject and Due Date
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Subject Badge
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: subjectBg,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              assignment["subject"],
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: subjectColor,
                              ),
                            ),
                          ),
                          // Due Date Badge
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: dueDateBg,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: dueDateColor,
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.calendar_today,
                                  size: 16,
                                  color: dueDateColor,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  assignment["dueDate"],
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: dueDateColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      // Title
                      Text(
                        assignment["title"],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
class AssignmentDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> assignment;

  const AssignmentDetailsScreen({super.key, required this.assignment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: const CustomAppBar(title: 'Assignment Details'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: secondary.withOpacity(0.7),
                // gradient: LinearGradient(
                //   colors: [primaryButton, primaryButton.withOpacity(0.8)],
                //   begin: Alignment.topLeft,
                //   end: Alignment.bottomRight,
                // ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      
                      
                      Expanded(
                        child: Text(
                          assignment["title"],
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "Due: ${assignment["dueDate"]}",
                      style: const TextStyle(
                        color: white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Content Section
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Info Cards
                  Row(
                    children: [
                      Expanded(
                        child: _buildInfoCard(
                          icon: Icons.book,
                          title: "Subject",
                          value: assignment["subject"],
                          color: const Color(0xFF00A9AB),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildInfoCard(
                          icon: Icons.person,
                          title: "Teacher",
                          value: assignment["teacher"],
                          color: const Color(0xFF4C8077),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Description Card
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: primaryButton.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(
                                Icons.description,
                                color: primaryButton,
                                size: 20,
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Text(
                              "Description",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "This is a detailed description of the assignment. Teachers can provide additional instructions or resources here. This is a detailed description of the assignment. Teachers can provide additional instructions or resources here.This is a detailed description of the assignment. Teachers can provide additional instructions or resources here.This is a detailed description of the assignment. Teachers can provide additional instructions or resources here.This is a detailed description of the assignment. Teachers can provide additional instructions or resources here.This is a detailed description of the assignment. Teachers can provide additional instructions or resources here.This is a detailed description of the assignment. Teachers can provide additional instructions or resources here.This is a detailed description of the assignment. Teachers can provide additional instructions or resources here.This is a detailed description of the assignment. Teachers can provide additional instructions or resources here.This is a detailed description of the assignment. Teachers can provide additional instructions or resources here.This is a detailed description of the assignment. Teachers can provide additional instructions or resources here.This is a detailed description of the assignment. Teachers can provide additional instructions or resources here.This is a detailed description of the assignment. Teachers can provide additional instructions or resources here.This is a detailed description of the assignment. Teachers can provide additional instructions or resources here.",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Action Buttons
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryButton,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.upload_file, color: white),
                            SizedBox(width: 12),
                            Text(
                              "Submit Assignment",
                              style: TextStyle(
                                color: white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.download, color: primaryButton),
                            SizedBox(width: 12),
                            Text(
                              "Download Resources",
                              style: TextStyle(
                                color: primaryButton,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
