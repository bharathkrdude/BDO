import 'package:bdo/core/constants/colors.dart';
import 'package:bdo/view/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'pdf_viewer_screen.dart';

class CircularsScreen extends StatelessWidget {
  CircularsScreen({super.key});

  final List<Map<String, dynamic>> circulars = [
    {
      "title": "Annual Day Celebration Guidelines",
      "date": "2024-12-05",
      "type": "Event",
      "fileUrl":
          "https://rti.gov.in/rti-act.pdf",
      "fileSize": "1.2 MB",
    },
    {
      "title": "Revised Academic Calendar 2024",
      "date": "2024-12-04",
      "type": "Academic",
      "fileUrl":
          "https://www.adobe.com/support/products/enterprise/knowledgecenter/media/c4611_sample_explain.pdf",
      "fileSize": "2.5 MB",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: const CustomAppBar(title: 'Circulars'),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: circulars.length,
        itemBuilder: (context, index) {
          final circular = circulars[index];
          final date = DateTime.parse(circular["date"]);

          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
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
              children: [
                // Header with type and date
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        circular["type"],
                        style: const TextStyle(
                          color: secondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        DateFormat('dd MMM yyyy').format(date),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                // Circular content
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        circular["title"],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          // View Button
                          Expanded(
                            child: TextButton.icon(
                              onPressed: () {
                                // Navigate to PDF Viewer Screen
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PdfViewerScreen(
                                      fileUrl: circular["fileUrl"],
                                    ),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.visibility),
                              label: const Text("View"),
                              style: TextButton.styleFrom(
                                foregroundColor: secondary,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: const BorderSide(color: secondary),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          // Download Button
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                // Download logic
                              },
                              icon: const Icon(Icons.download),
                              label: Text(circular["fileSize"]),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: secondary,
                                foregroundColor: Colors.white,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
