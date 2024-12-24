import 'package:bdo/view/screens/academic_calender/academic_calender.dart';
import 'package:bdo/view/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:bdo/core/constants/colors.dart';
import 'package:bdo/view/screens/dashboard/dashboard_screen.dart';
import 'package:bdo/view/screens/gallery/gallery_screen.dart';
import 'package:bdo/view/screens/payment/payment_screen.dart';
import 'package:bdo/view/screens/profile/screen_profile.dart';
import 'package:bdo/view/widgets/drawer_widget.dart';

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({super.key});

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  // Current index for bottom navigation
  int currentIndex = 0;

  // Pages and their corresponding titles
  final List<Map<String, dynamic>> pages = [
    {
      "title": "Dashboard",
      "page": const DashboardScreen(),
    },
    {
      "title": "Payment",
      "page": const FeePaymentPage(),
    },
    {
      "title": "Calender", // Empty for center FAB
      "page": const AcademicCalendarPage(),
    },
    {
      "title": "Gallery",
      "page": EventsListScreen(),
    },
    {
      "title": "Profile",
      "page": const ProfileScreen(),
    },
  ];

  // Method to change the index
  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: pages[currentIndex]["title"], // Dynamic title
      ),
      drawer: const DrawerWidget(), // Attach the drawer here
      body: IndexedStack(
        index: currentIndex,
        children: pages.map((e) => e["page"] as Widget).toList(),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: primaryButton,
      //   child: const Icon(
      //     Icons.add,
      //     color: white,
      //   ),
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) =>  AcademicCalendarPage()),
      //     );
      //   },
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
  decoration: BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        blurRadius: 10,
      ),
    ],
  ),
  child: BottomNavigationBar(
    currentIndex: currentIndex,
    onTap: changeIndex,
    type: BottomNavigationBarType.fixed,
    backgroundColor: white,
    selectedItemColor: secondary,
    unselectedItemColor: Colors.grey,
    selectedFontSize: 12,
    unselectedFontSize: 12,
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.payment),
        label: 'Payment',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.calendar_month),
        label: 'Calender',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.photo_library),
        label: 'Gallery',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Profile',
      ),
    ],
  ),
),

    );
  }
}
