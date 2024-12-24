import 'package:bdo/core/services/authprovier.dart';
import 'package:bdo/view/screens/academic_calender/academic_calender.dart';
import 'package:bdo/view/screens/assignments/assignments_screen.dart';
import 'package:bdo/view/screens/authentication/login.dart';
import 'package:bdo/view/screens/circular/circular.dart';
import 'package:bdo/view/screens/events/event_screen.dart';
import 'package:bdo/view/screens/timetable/timetable_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../core/constants/colors.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drawer Header with School Info
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [primaryButton, primaryButton1],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: white, width: 2),
                  ),
                  child: const CircleAvatar(
                    radius: 45,
                    backgroundColor: white,
                    child: Icon(
                      Icons.school,
                      size: 50,
                      color: primaryButton,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Green Valley International School",
                  style: TextStyle(
                    color: white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                const Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: white,
                      size: 16,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "New York, USA",
                      style: TextStyle(
                        color: white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Menu Items
          Expanded(
            child: Container(
              color: backgroundColorlightgrey,
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 10),
                children: [
                  // Dashboard
                  ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: primaryButton.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.dashboard, color: primaryButton),
                    ),
                    title: const Text(
                      "Academic Calender",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AcademicCalendarPage()),
                    ),
                  ),

                  // Attendance
                  ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: primaryButton1.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.calendar_today,
                          color: primaryButton1),
                    ),
                    title: const Text(
                      "Circulars",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CircularsScreen()),
                    ),
                  ),

                  // Fees & Payments
                  ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: blueApp.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.payment, color: blueApp),
                    ),
                    title: const Text(
                      "Timetable",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const TimetableScreen())),
                  ),

                  // Academic Calendar
                  ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: secondary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.event_note, color: secondary),
                    ),
                    title: const Text(
                      "Assignments",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AssignmentsScreen())),
                  ),

                  // Exam Schedule
                  ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: secondaryButton.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child:
                          const Icon(Icons.assignment, color: secondaryButton),
                    ),
                    title: const Text(
                      "Events",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const EventsScreen())),
                  ),

                  // Settings
                  ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: primaryButton.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.settings, color: primaryButton),
                    ),
                    title: const Text(
                      "Settings",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () => Navigator.pop(context),
                  ),

                  const Divider(height: 30),

                  // Logout
                  ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.logout, color: Colors.red),
                    ),
                    title: const Text(
                      "Logout",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.red,
                      ),
                    ),
                    onTap: () {context.read<AuthProvider>().logout();
              // Navigate to LoginScreen using Get
              Get.offAll(() => const LoginScreen());} 
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
