import 'package:flutter/material.dart';
 final List<String> images = [
  'https://as1.ftcdn.net/v2/jpg/03/01/24/66/1000_F_301246613_sZb5qyMgzPuT0WIrlTAc5hhZQcZIunNd.jpg',
      'https://as1.ftcdn.net/v2/jpg/03/01/24/58/1000_F_301245840_zwJpFB1MCmJkTg1tMDK9pFnCwce6dQ1T.jpg',
      'https://as2.ftcdn.net/v2/jpg/03/01/24/55/1000_F_301245538_LwVt5kzQJj1KvIiojVbu1ezCoUeXsj23.jpg',
      'https://as1.ftcdn.net/v2/jpg/03/01/24/66/1000_F_301246613_sZb5qyMgzPuT0WIrlTAc5hhZQcZIunNd.jpg',
      
    ];
class CarouselWithDots extends StatefulWidget {
  final List<String> images; // List of images to display
  final double height; // Height of the carousel

  const CarouselWithDots({
    super.key,
    required this.images,
    this.height = 200, // Default height
  });

  @override
  State<CarouselWithDots> createState() => _CarouselWithDotsState();
}

class _CarouselWithDotsState extends State<CarouselWithDots> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Stack(
        children: [
          // PageView for the images
          PageView.builder(
            controller: _pageController,
            itemCount: widget.images.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(1),
                child: Image.network(
                  widget.images[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              );
            },
          ),

          // Dots overlayed on the image
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.images.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () {
                    _pageController.animateToPage(
                      entry.key,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Container(
                    width: _currentIndex == entry.key ? 12 : 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == entry.key
                          ? Colors.white
                          : Colors.grey.shade400,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
  
}
