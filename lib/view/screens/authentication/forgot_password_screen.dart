import 'package:bdo/core/constants/constants.dart';
import 'package:bdo/view/screens/authentication/otp_verification.dart';
import 'package:bdo/view/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                // Back Button
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(height: 20),
                // Logo
                const Center(
                  child:LogoWidget()
                ),
                const SizedBox(height: 50),
                // Forgot Password Text
                const Text(
                  'Forgot Password',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                // Description Text
                Text(
                  'Enter your email or phone number to reset your password',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 40),
                // Email/Phone TextField
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Email or Phone number',
                    prefixIcon: const Icon(Icons.email, color: Colors.grey),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                // Reset Password Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: PrimaryButton(onPressed: (){ Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OtpVerificationScreen()));}, text: 'Submit')
                ),
                const SizedBox(height: 24),
                // Back to Login
                Center(
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Back to Login',
                      style: TextStyle(color: Colors.green[700]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
