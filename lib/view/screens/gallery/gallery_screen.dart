// lib/features/gallery/models/event.dart
import 'package:bdo/view/widgets/custom_appbar.dart';
import 'package:bdo/view/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GalleryEvent {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final List<GalleryImage> images;

  GalleryEvent({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.images,
  });
}

class GalleryImage {
  final String id;
  final String caption;
  final String url;

  GalleryImage({
    required this.id,
    required this.caption,
    required this.url,
  });
}

// lib/features/gallery/data/gallery_data.dart
class GalleryData {
  static List<GalleryEvent> events = [
    GalleryEvent(
      id: '1',
      title: 'Annual Day Celebration 2024',
      description: 'Highlights from our school annual day celebration',
      date: DateTime(2024, 12, 10),
      images: List.generate(
        15,
        (index) => GalleryImage(
          id: 'annual_$index',
          caption: 'Annual Day Moment ${index + 1}',
          url: 'https://picsum.photos/id/${index + 10}/300/300',
        ),
      ),
    ),
    GalleryEvent(
      id: '2',
      title: 'Sports Meet 2024',
      description: 'Sports competition highlights',
      date: DateTime(2024, 11, 25),
      images: List.generate(
        12,
        (index) => GalleryImage(
          id: 'sports_$index',
          caption: 'Sports Meet ${index + 1}',
          url: 'https://picsum.photos/id/${index + 30}/300/300',
        ),
      ),
    ),
  ];
}

// lib/features/gallery/screens/events_list_screen.dart
class EventsListScreen extends StatefulWidget {
  const EventsListScreen({super.key});

  @override
  State<EventsListScreen> createState() => _EventsListScreenState();
}

class _EventsListScreenState extends State<EventsListScreen> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredEvents = GalleryData.events
        .where((event) =>
            event.title.toLowerCase().contains(searchQuery.toLowerCase()) ||
            event.description.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Column(
      children: [
        // Search Bar
        Padding(
          padding: const EdgeInsets.all(16),
          child: SearchWidget(
            onChanged: (value) {
              setState(() {
                searchQuery = value;
              });
            },
          ),
        ),

        // Events List
        Expanded(
          child: filteredEvents.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.event_busy_rounded,
                        size: 48,
                        color: Colors.grey[300],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'No events found',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  itemCount: filteredEvents.length,
                  itemBuilder: (context, index) {
                    return _EventCard(event: filteredEvents[index]);
                  },
                ),
        ),
      ],
    );
  }
}

class _EventCard extends StatelessWidget {
  final GalleryEvent event;

  const _EventCard({required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GalleryScreen(event: event),
              ),
            );
          },
          borderRadius: BorderRadius.circular(12),
          child: Row(
            children: [
              // Event Image
              Hero(
                tag: 'event_${event.id}',
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(
                          event.images.first.url,
                          fit: BoxFit.cover,
                        ),
                        // Photo Count Badge
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.photo_library_rounded,
                                  size: 12,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '${event.images.length}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Event Details
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        event.description,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 13,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today_rounded,
                            size: 14,
                            color: Colors.grey[600],
                          ),
                          const SizedBox(width: 4),
                          Text(
                            DateFormat('MMM d, yyyy').format(event.date),
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Updated GalleryScreen
class GalleryScreen extends StatefulWidget {
  final GalleryEvent event;

  const GalleryScreen({
    super.key,
    required this.event,
  });

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    final filteredImages = widget.event.images
        .where((image) =>
            image.caption.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar:CustomAppBar(title: widget.event.title),
      body: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: SearchWidget(
          //     onChanged: (value) {
          //       setState(() {
          //         searchQuery = value;
          //       });
          //     },
          //   ),
          // ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.75,
              ),
              itemCount: filteredImages.length,
              itemBuilder: (context, index) {
                final image = filteredImages[index];
                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: Image.network(
                          image.url,
                          fit: BoxFit.contain,
                        ),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            image.url,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        image.caption,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
