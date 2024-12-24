import 'package:bdo/view/screens/authentication/login.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingData> _pages = [
    OnboardingData(
      imageUrl: 'https://images.pexels.com/photos/3662667/pexels-photo-3662667.jpeg',
      title: 'Welcome to Baby Day Out!',
      description: 'Where tiny adventures begin! 👶',
      icon: Icons.child_friendly,
    ),
    OnboardingData(
      imageUrl: 'https://images.pexels.com/photos/3662632/pexels-photo-3662632.jpeg',
      title: 'Safe & Loving Care',
      description: 'Your little one\'s home away from home',
      icon: Icons.favorite,
    ),
    OnboardingData(
      imageUrl: 'https://images.pexels.com/photos/3662877/pexels-photo-3662877.jpeg',
      title: 'Learn & Play',
      description: 'Watch your baby grow, explore, and smile!',
      icon: Icons.toys_outlined,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xFFFFF3E0), // Soft peach
                  const Color(0xFFFFE0B2), // Light orange
                ],
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: _pages.length,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    itemBuilder: (context, index) {
                      return OnboardingPage(data: _pages[index], screenWidth: screenWidth);
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          _pages.length,
                          (index) => Padding(
                            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              height: 16,
                              width: _currentPage == index ? 32 : 16,
                              decoration: BoxDecoration(
                                color: _currentPage == index
                                    ? const Color(0xFFFF9B9B) // Soft pink
                                    : const Color(0xFFFFCDD2), // Lighter pink
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.pink.withOpacity(0.2),
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.05),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
                        child: SizedBox(
                          width: double.infinity,
                          height: screenHeight * 0.08,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_currentPage == _pages.length - 1) {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ),
                                );
                              } else {
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFF8A80), // Coral pink
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  _currentPage == _pages.length - 1
                                      ? 'Start the Journey!'
                                      : 'Continue',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.045,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: screenWidth * 0.03),
                                Icon(
                                  _currentPage == _pages.length - 1
                                      ? Icons.baby_changing_station
                                      : Icons.arrow_forward_rounded,
                                  color: Colors.white,
                                  size: screenWidth * 0.06,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final OnboardingData data;
  final double screenWidth;

  const OnboardingPage({
    super.key,
    required this.data,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.06),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: screenWidth * 0.6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.pink.withOpacity(0.2),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(
                data.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.child_care, size: 100, color: Color(0xFFFF8A80)),
              ),
            ),
          ),
          SizedBox(height: screenWidth * 0.08),
          Icon(
            data.icon,
            size: screenWidth * 0.12,
            color: const Color(0xFFFF8A80), // Coral pink
          ),
          SizedBox(height: screenWidth * 0.04),
          Text(
            data.title,
            style: TextStyle(
              fontSize: screenWidth * 0.06,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFE57373), // Darker pink
              letterSpacing: 0.5,
              fontFamily: 'Quicksand',
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: screenWidth * 0.04),
          Text(
            data.description,
            style: TextStyle(
              fontSize: screenWidth * 0.045,
              color: const Color(0xFF795548), // Warm brown
              height: 1.5,
              fontFamily: 'Quicksand',
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class OnboardingData {
  final String imageUrl;
  final String title;
  final String description;
  final IconData icon;

  OnboardingData({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.icon,
  });
}
