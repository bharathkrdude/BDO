// academic_calendar_page.dart

import 'package:bdo/core/constants/colors.dart';
import 'package:bdo/view/screens/academic_calender/widgets/event_card_widget.dart';
import 'package:bdo/view/screens/academic_calender/widgets/month_header.dart';
import 'package:bdo/view/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
// lib/features/academic_calendar/models/academic_event.dart
// lib/features/academic_calendar/models/academic_event.dart

class AcademicEvent {
  final String id;
  final String title;
  final DateTime date;
  final String type;
  final String description;

  AcademicEvent({
    String? id,
    required this.title,
    required this.date,
    required this.type,
    required this.description,
  }) : id = id ?? DateTime.now().toString();

  Color get typeColor {
    switch (type.toLowerCase()) {
      case 'academic':
        return Colors.blue;
      case 'examination':
        return Colors.red;
      case 'holiday':
        return Colors.green;
      case 'event':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }
}

// lib/features/academic_calendar/data/event_data.dart

class EventData {
  static final Map<int, List<AcademicEvent>> academicEvents = {
    1: [
      // January
      AcademicEvent(
        title: "Spring Semester Begins",
        date: DateTime(2025, 1, 6),
        type: "Academic",
        description: "First day of spring semester classes",
      ),
      AcademicEvent(
        title: "Last Date for Registration",
        date: DateTime(2025, 1, 15),
        type: "Academic",
        description: "Final day for course registration",
      ),
    ],
    2: [
      // February
      AcademicEvent(
        title: "Annual Sports Meet",
        date: DateTime(2025, 2, 5),
        type: "Event",
        description: "Three-day inter-college sports competition",
      ),
    ],
    3: [
      // March
      AcademicEvent(
        title: "Mid-semester Exams",
        date: DateTime(2025, 3, 10),
        type: "Examination",
        description: "Mid-term examinations begin",
      ),
    ],

    // Add more months as needed
  };
}

class AcademicCalendarPage extends StatefulWidget {
  const AcademicCalendarPage({super.key});

  @override
  State<AcademicCalendarPage> createState() => _AcademicCalendarPageState();
}

class _AcademicCalendarPageState extends State<AcademicCalendarPage> {
  bool _showCalendarView = false;
  late DateTime _focusedDay;
  DateTime? _selectedDay;
  final Map<int, List<AcademicEvent>> _events = EventData.academicEvents;

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime(2025, 1, 1);
    _selectedDay = _focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(title: 'Academic calender'),
      body: _showCalendarView ? _calendarView() : _monthlyListView(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            _showCalendarView = !_showCalendarView;
          });
        },
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 4,
        highlightElevation: 8,
        label: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.5, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
            );
          },
          child: Text(
            _showCalendarView ? 'List View' : 'Calendar View',
            key: ValueKey<bool>(_showCalendarView),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
              color: Colors.white,
            ),
          ),
        ),
        icon: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Icon(
            _showCalendarView
                ? Icons.list_rounded
                : Icons.calendar_month_rounded,
            key: ValueKey<bool>(_showCalendarView),
            size: 24,
            color: Colors.white,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        extendedPadding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),
      ),
    );
  }

  Widget _monthlyListView() {
    return ListView.builder(
      itemCount: 12,
      padding: const EdgeInsets.only(bottom: 80),
      itemBuilder: (context, monthIndex) {
        final month = monthIndex + 1;
        final monthEvents = _events[month] ?? [];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MonthHeader(month: month),
            if (monthEvents.isNotEmpty) ...[
              const SizedBox(height: 8),
              ...monthEvents
                  .map((event) => EventCard(
                        event: event,
                        uniqueId: 'monthly_${month}_${event.id}',
                      ))
                  .toList(),
            ] else
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'No events scheduled',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }

  Widget _calendarView() {
    return Column(
      children: [
        TableCalendar(
          firstDay: DateTime(2025, 1, 1),
          lastDay: DateTime(2025, 12, 31),
          focusedDay: _focusedDay,
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          calendarFormat: CalendarFormat.month,
          eventLoader: _getEventsForDay,
          startingDayOfWeek: StartingDayOfWeek.monday,
          headerStyle: const HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
          ),
          calendarStyle: CalendarStyle(
            markerDecoration: BoxDecoration(
              color: secondary,
              shape: BoxShape.circle,
            ),
            selectedDecoration: BoxDecoration(
              color: secondary,
              shape: BoxShape.circle,
            ),
            todayDecoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
          ),
          onDaySelected: (selectedDay, focusedDay) {
            if (!isSameDay(_selectedDay, selectedDay)) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            }
          },
          onPageChanged: (focusedDay) {
            setState(() {
              _focusedDay = focusedDay;
            });
          },
        ),
        const Divider(height: 1),
        Expanded(
          child: _selectedDayEvents(),
        ),
      ],
    );
  }

  List<AcademicEvent> _getEventsForDay(DateTime day) {
    return _events[day.month]
            ?.where((event) => isSameDay(event.date, day))
            .toList() ??
        [];
  }

  Widget _selectedDayEvents() {
    if (_selectedDay == null) return const SizedBox.shrink();

    final dayEvents = _getEventsForDay(_selectedDay!);

    if (dayEvents.isEmpty) {
      return Center(
        child: Text(
          'No events for ${DateFormat('MMMM d').format(_selectedDay!)}',
          style: TextStyle(color: Colors.grey[600]),
        ),
      );
    }

    return ListView.builder(
      itemCount: dayEvents.length,
      padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 16),
      itemBuilder: (context, index) => EventCard(
        event: dayEvents[index],
        uniqueId: 'calendar_${_selectedDay.toString()}_${dayEvents[index].id}',
      ),
    );
  }
}
