import 'package:flutter/material.dart';

import 'package:bdo/core/constants/colors.dart';
import 'package:bdo/core/constants/constants.dart';
import 'package:bdo/view/screens/dashboard/widgets/carousel/carousel_widget.dart';
import 'package:bdo/view/screens/dashboard/widgets/update_card_widget.dart';
import 'package:bdo/view/screens/screen_teachers/screen_teachers.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColorWhite,
     
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselWithDots(
              images: images, // Pass the list of images
              height: 250, // Optional: Set the height of the carousel
            ),
            // Updates Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: const Text(
                    'Updates',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.20, // Adjust height as needed
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: updateItems.length, // Number of update cards
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    itemBuilder: (context, index) {
                      final update = updateItems[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: UpdateCard(
                          title: update['title'],
                          subtitle: update['subtitle'],
                          time: update['time'],
                          color: update['color'],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
kHeight10,
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.29,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      right: 8,
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: MediaQuery.of(context).size.height * 0.25,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 1,
                        ),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _MenuItem(
                                icon: Icons.monetization_on,
                                label: 'Bajaj Pay',
                                backgroundColor: Colors.blue,
                              ),
                              _MenuItem(
                                icon: Icons.book_online_sharp,
                                label: 'UPI',
                                backgroundColor: Colors.blue,
                              ),
                            ],
                          ),
                          kHeight5,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _MenuItem(
                                icon: Icons.qr_code_scanner,
                                label: 'Scan any QR',
                                backgroundColor: Colors.blue,
                              ),
                              _MenuItem(
                                icon: Icons.wallet,
                                label: 'Wallet',
                                backgroundColor: Colors.blue,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            //inforamtion

            kHeight10,
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade300,
                    width: 1,
                  ),
                  color: Colors.white, // Background color
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      const Text(
                        'Information',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Row of Menu Tiles
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Individual Menu Item
                          InformationTile(
                            icon: Icons.person,
                            label: 'My Account',
                            backgroundColor: Colors.blue[100]!,
                            iconColor: Colors.blue,
                            onPressed: () {},
                          ),
                          InformationTile(
                            icon: Icons.school,
                            label: 'Teachers',
                            backgroundColor: Colors.green[100]!,
                            iconColor: Colors.green,
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const ScreenTeachers()));
                            },
                          ),
                          InformationTile(
                            icon: Icons.business,
                            label: 'My School',
                            backgroundColor: Colors.brown[100]!,
                            iconColor: Colors.brown,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.1,
            // )
          ],
        ),
      ),
    );
  }
}

class InfoButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const InfoButton({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.grey[600]),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}

class InformationTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color backgroundColor;
  final Color iconColor;
  final VoidCallback onPressed; // Callback for onPressed

  const InformationTile({
    super.key,
    required this.icon,
    required this.label,
    required this.backgroundColor,
    required this.iconColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Circular Avatar with Icon and onPressed functionality
        InkWell(
          onTap: onPressed,
          borderRadius:
              BorderRadius.circular(30), // Match CircleAvatar's radius
          child: CircleAvatar(
            radius: 30,
            backgroundColor: backgroundColor,
            child: Icon(
              icon,
              color: iconColor,
              size: 28,
            ),
          ),
        ),
        const SizedBox(height: 8),
        // Label Text
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

final List<Map<String, dynamic>> updateItems = [
  {
    'title': 'Absent Today',
    'subtitle': 'Rashmi is absent today in school',
    'time': '17/08/2024 11:30',
    'color': Colors.green,
  },
  {
    'title': 'Fee Due',
    'subtitle': 'Your fee payment is pending',
    'time': '17/08/2024 10:45',
    'color': Colors.orange,
  },
  {
    'title': 'Exam Schedule',
    'subtitle': 'Mid-term exams starting next week',
    'time': '17/08/2024 09:15',
    'color': Colors.blue,
  },
  {
    'title': 'Lab Practicals',
    'subtitle': 'exams starting next week',
    'time': '17/08/2024 09:15',
    'color': Colors.indigo,
  },
  // Add more items as needed
];

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color backgroundColor;

  const _MenuItem({
    required this.icon,
    required this.label,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.15,
          height: MediaQuery.of(context).size.height * 0.08,
          padding: const EdgeInsets.all(12),
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: blueApp),
          child: Icon(
            icon,
            color: white,
            size: 28,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 65, // Set a fixed width to force text wrapping
          child: Text(
            label,
            textAlign: TextAlign.center,
            maxLines: 2, // Allow up to 2 lines
            overflow: TextOverflow.ellipsis, // Handle overflow with ellipsis
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}




//first fee 

  // Price Cards Row
            // Padding(
            //   padding:
            //       const EdgeInsets.only(left: 1, right: 1, bottom: 16, top: 0),
            //   child: Container(
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.circular(12),
            //     ),
            //     child: Column(
            //       children: [
            //         kHeight10,
            //         const Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             kWidth5,
            //             PriceCard(
            //               title: 'Current Due',
            //               amount: '₹2500',
            //               color: blueApp,
            //             ),
            //             PriceCard(
            //                 title: 'Total Due',
            //                 amount: '₹22500',
            //                 color: blueApp),
            //             PriceCard(
            //               title: 'Total Fee',
            //               amount: '₹35000',
            //               color: blueApp,
            //             ),
            //             kWidth5,
            //           ],
            //         ),
            //         const SizedBox(height: 10),
            //         Container(
            //           decoration: const BoxDecoration(
            //             color: lightBacground,
            //             borderRadius: BorderRadius.vertical(
            //               bottom: Radius.circular(12),
            //             ),
            //           ),
            //           padding: const EdgeInsets.symmetric(
            //               horizontal: 16, vertical: 8),
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               // Leading: Online Indicator
            //               Row(
            //                 children: [
            //                   Container(
            //                     width: 12,
            //                     height: 12,
            //                     decoration: const BoxDecoration(
            //                       color: Colors.green,
            //                       shape: BoxShape.circle,
            //                     ),
            //                   ),
            //                   const SizedBox(width: 8),
            //                   const Text(
            //                     'Rashmi is Present today',
            //                     style: TextStyle(
            //                       fontSize: 14,
            //                       color: Colors.blue,
            //                       fontWeight: FontWeight.w500,
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //               // Trailing: Arrow-back Icon
            //               Icon(
            //                 Icons.arrow_back_ios,
            //                 color: Colors.grey[600],
            //                 size: 16,
            //               ),
            //             ],
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),

            //feeeeee



            //grid 4

              // Menu Grid
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 16),
            //   child: GridView.count(
            //     shrinkWrap: true,
            //     physics: const NeverScrollableScrollPhysics(),
            //     crossAxisCount: 2, // Two items per row
            //     mainAxisSpacing: 16, // Vertical spacing
            //     crossAxisSpacing: 16, // Horizontal spacing
            //     childAspectRatio:
            //         3.7, // Adjusted aspect ratio for better alignment
            //     children: [
            //       MenuTile(
            //         icon: Icons.person_outline,
            //         label: 'Attendance',
            //         color: Colors.blue[100]!,
            //       ),
            //       MenuTile(
            //         icon: Icons.photo_library_outlined,
            //         label: 'Gallery',
            //         color: Colors.orange[100]!,
            //       ),
            //       MenuTile(
            //         icon: Icons.timeline,
            //         label: 'Timetable',
            //         color: Colors.purple[100]!,
            //       ),
            //       MenuTile(
            //         icon: Icons.play_circle_outline,
            //         label: 'Videos',
            //         color: Colors.green[100]!,
            //       ),
            //     ],
            //   ),
            // ),
            //grid