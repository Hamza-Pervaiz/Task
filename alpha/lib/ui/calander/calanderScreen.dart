import 'package:alpha/resources/reponsive_size.dart';
import 'package:alpha/ui/appbar/appbar.dart';
import 'package:alpha/ui/calander/calanderMenuSideBar.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart'; // Import the calendar package

class Calanderscreen extends StatefulWidget {
  const Calanderscreen({super.key});

  @override
  State<Calanderscreen> createState() => _CalanderscreenState();
}

class _CalanderscreenState extends State<Calanderscreen> {
  int _selectedIndex = 0;
  DateTime _selectedDay = DateTime.now(); // Store the selected day
  DateTime _focusedDay = DateTime.now(); // Store the focused day
  Map<CalendarFormat, String> availableCalendarFormats = const {
    CalendarFormat.month: 'Month',
    CalendarFormat.week: 'Week',
    // CalendarFormat.twoWeeks is removed
  };
  Widget buildEventRow(String startTime, String middleTime, String endTime,
      String eventName, String domain) {
    return Row(
      children: [
        // Column for time slots
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(startTime),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(middleTime),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(endTime),
            ),
          ],
        ),
        // Container for event details
        Container(
          width: MySize.size320, // Change to MySize.size300
          height: MySize.size120, // Change to MySize.size100
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.all(MySize.size10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  eventName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Text(domain),
                    SizedBox(
                      width: MySize.size20,
                    ),
                    Icon(Icons.timelapse_outlined),
                    SizedBox(
                      width: MySize.size2,
                    ),
                    Text(startTime),
                  ],
                ),
                Row(
                  children: [
                    CircleAvatar(
                        radius: MySize.size22,
                        backgroundImage:
                            AssetImage('assets/images/avatar1.jpg')),
                    CircleAvatar(
                        radius: MySize.size18,
                        backgroundImage:
                            AssetImage('assets/images/avatar2.png')),
                    CircleAvatar(
                        radius: MySize.size22,
                        backgroundImage:
                            AssetImage('assets/images/avatar3.jpg')),
                    CircleAvatar(
                        radius: MySize.size20,
                        backgroundImage:
                            AssetImage('assets/images/avatar4.jpg')),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildButton(String label, int index) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        width: MySize.size90,
        height: MySize.size50,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: MySize.size16,
            color: isSelected ? Colors.black : Colors.grey[600],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 221, 221, 221),
      drawer: NavBar(),
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.all(MySize.size10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: MySize.size12),
                child: Text(
                  'Calender',
                  style: TextStyle(
                      fontSize: MySize.size20, fontWeight: FontWeight.w900),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(MySize.size12),
                child: Row(
                  children: [
                    Row(
                      children: [
                        _buildButton('Month', 0),
                        SizedBox(width: MySize.size12),
                        _buildButton('Week', 1),
                        SizedBox(width: MySize.size12),
                        _buildButton('Day', 2),
                        SizedBox(width: MySize.size12),
                        Container(
                          width: MySize.size50,
                          height: MySize.size50,
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Center(
                            child: Text(
                              '+',
                              style: TextStyle(
                                fontSize: MySize.size30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MySize.size10,
              ),
              // Add the calendar widget here
              Container(
                margin: EdgeInsets.only(left: MySize.size16),
                width: MySize.size360,
                height: MySize.size360,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(MySize.size10)),
                child: TableCalendar(
                  firstDay: DateTime.utc(2020, 1, 1),
                  lastDay: DateTime.utc(2030, 12, 31),
                  focusedDay: _focusedDay,
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay; // Update the focused day
                    });
                  },
                  calendarStyle: CalendarStyle(
                    selectedDecoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    todayDecoration: BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                    // You can customize other styles here
                  ),
                  headerStyle: HeaderStyle(
                    leftChevronIcon: Icon(Icons.arrow_back,
                        color: Colors.blue), // Custom left arrow
                    rightChevronIcon: Icon(Icons.arrow_forward,
                        color: Colors.blue), // Custom right arrow
                    titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: MySize.size16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MySize.size10,
              ),
              Padding(
                padding: EdgeInsets.only(left: MySize.size10),
                child: Text(
                  'Upcoming',
                  style: TextStyle(
                      fontSize: MySize.size30, fontWeight: FontWeight.w900),
                ),
              ),
              SizedBox(
                height: MySize.size10,
              ),

              buildEventRow(
                  "7:30", "8:00", "8:30", "Brandbook and Guidebook", "Design"),

              buildEventRow(
                  "8:30", "9:00", "9:30", "App Development", "Coding"),

              buildEventRow("9:00", "9:30", "10:00", "Landing Page", "Meeting"),
            ],
          ),
        ),
      ),
    );
  }
}
