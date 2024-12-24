import 'package:bdo/view/screens/payment/summary/payement_summary.dart';
import 'package:flutter/material.dart';

class FeePaymentPage extends StatefulWidget {
  const FeePaymentPage({super.key});

  @override
  State<FeePaymentPage> createState() => _FeePaymentPageState();
}

class _FeePaymentPageState extends State<FeePaymentPage> {
  // List of fee details
  final List<Map<String, dynamic>> feeDetails = [
    {
      "name": "Nandu",
      "amount": 9000,
      "dueDate": "03-Aug-2024",
      "year": "2024-2025",
      "term": "First",
      "isSelected": false,
    },
    {
      "name": "Nandu",
      "amount": 9000,
      "dueDate": "03-Nov-2024",
      "year": "2024-2025",
      "term": "Second",
      "isSelected": false,
    },
    {
      "name": "Nandu",
      "amount": 9000,
      "dueDate": "03-Feb-2025",
      "year": "2024-2025",
      "term": "Third",
      "isSelected": false,
    },{
      "name": "Nandu",
      "amount": 9000,
      "dueDate": "03-Feb-2025",
      "year": "2024-2025",
      "term": "Third",
      "isSelected": false,
    },{
      "name": "Nandu",
      "amount": 9000,
      "dueDate": "03-Feb-2025",
      "year": "2024-2025",
      "term": "Third",
      "isSelected": false,
    },
  ];

  // Function to calculate total amount
  int getTotalAmount() {
    return feeDetails
        .where((fee) => fee["isSelected"])
        .fold<int>(0, (sum, fee) => sum + (fee["amount"] as int));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(title: 'Payments'),
      body: Column(
        children: [
          const SizedBox(height: 20),

          // Instruction Text
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Select fees to pay:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 8),

          // Fee Details List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(
                  16, 0, 16, 80), // Add padding for FAB
              itemCount: feeDetails.length,
              itemBuilder: (context, index) {
                final fee = feeDetails[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      fee["isSelected"] = !fee["isSelected"];
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: fee["isSelected"]
                          ? Colors.green.shade50
                          : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: fee["isSelected"]
                            ? Colors.green
                            : Colors.grey.shade300,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 5,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        // Checkbox
                        Checkbox(
                          value: fee["isSelected"],
                          activeColor: Colors.green,
                          onChanged: (value) {
                            setState(() {
                              fee["isSelected"] = value!;
                            });
                          },
                        ),

                        // Fee Details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Term: ${fee["term"]}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "Amount: ₹${fee["amount"]}",
                                style: const TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                "Due Date: ${fee["dueDate"]}",
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 13,
                                ),
                              ),
                              Text(
                                "Year: ${fee["year"]}",
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Icon
                        Icon(
                          fee["isSelected"]
                              ? Icons.check_circle
                              : Icons.circle_outlined,
                          color: fee["isSelected"] ? Colors.green : Colors.grey,
                          size: 28,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // Floating Action Button for Payment
    floatingActionButton: getTotalAmount() > 0
    ? Padding(
        padding: const EdgeInsets.only(
            bottom: 60), // Add padding to avoid bottom nav bar overlap
        child: FloatingActionButton.extended(
          onPressed: () {
            // Get selected fees
            final selectedFees =
                feeDetails.where((fee) => fee["isSelected"]).toList();

            // Navigate to summary page
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PaymentSummaryPage(
                  selectedFees: selectedFees,
                ),
              ),
            );
          },
          backgroundColor: Colors.green,
          icon: const Icon(
            Icons.payment,
            color: Colors.white,
          ),
          label: Text(
            "Pay ₹${getTotalAmount()}",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      )
    : null,
floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      // Bottom Navigation Bar
    );
  }
}



 // Gradient Header for Student and School Information
          // Container(
          //   width: double.infinity,
          //   padding: const EdgeInsets.all(16),
          //   decoration: const BoxDecoration(
          //     gradient: LinearGradient(
          //       colors: [primaryButton, primaryButton],
          //       begin: Alignment.topLeft,
          //       end: Alignment.bottomRight,
          //     ),
          //     // borderRadius: BorderRadius.only(
          //     //   bottomLeft: Radius.circular(20),
          //     //   bottomRight: Radius.circular(20),
          //     // ),
          //   ),
          //   child: const Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text(
          //         "Student Name: Nandu",
          //         style: TextStyle(
          //           fontSize: 18,
          //           fontWeight: FontWeight.bold,
          //           color: Colors.white,
          //         ),
          //       ),
          //       SizedBox(height: 4),
          //       Text(
          //         "School: Ghss Kamballur",
          //         style: TextStyle(
          //           fontSize: 16,
          //           color: Colors.white70,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),