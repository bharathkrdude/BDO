import 'package:bdo/core/services/authprovier.dart';
import 'package:bdo/view/screens/academic_calender/academic_calender.dart';
import 'package:bdo/view/screens/authentication/login.dart';
import 'package:bdo/view/screens/profile/change_password_screen.dart';
import 'package:bdo/view/screens/profile/edit_profile.dart';
import 'package:bdo/view/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '',
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EditProfileScreen()),
              );
            },
            icon: const Icon(Icons.edit, color: Colors.white),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Profile Image and Info
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://publichealth.uga.edu/wp-content/uploads/2020/01/Thomas-Cameron_Student_Profile.jpg'),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Alwin Jhonny',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '8087935135',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.7), fontSize: 16),
                ),
                Text(
                  'alwinjhonny@gmail.com',
                  style: TextStyle(color: Colors.grey[600], fontSize: 16),
                ),

                const SizedBox(height: 24),

                // Info Cards

                const SizedBox(height: 32),

                MenuItem(
                  icon: Icons.lock_reset_rounded,
                  color: Colors.blue.shade100,
                  title: 'Change Password',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ChangePassWordScreen()));
                  },
                ),
                 MenuItem(
                  icon: Icons.calendar_month_outlined,
                  color: Colors.teal.shade100,
                  title: 'Academic Calender',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AcademicCalendarPage()));
                  },
                ),
                MenuItem(
                  icon: Icons.logout,
                  color: Colors.red.shade100,
                  title: 'Logout',
                  onTap: () {
                    
              context.read<AuthProvider>().logout();
              // Navigate to LoginScreen using Get
              Get.offAll(() => const LoginScreen());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

   const InfoCard({super.key, required this.title, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final VoidCallback onTap;

  const MenuItem(
      {super.key, required this.icon,
      required this.color,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: Colors.black87),
      ),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
