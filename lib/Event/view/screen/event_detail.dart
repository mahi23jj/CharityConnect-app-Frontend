import 'package:flutter/material.dart';
import 'package:travel/base_Data/customize.dart';

class EventDetail extends StatefulWidget {
  const EventDetail({super.key});

  @override
  State<EventDetail> createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail> {
  int selectedTab = 0;
  Customize app = Customize();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background image
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.45,
            width: double.infinity,
            child: Image.asset(
              'asset/images/project.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // Foreground content
          DraggableScrollableSheet(
            initialChildSize: 0.6,
            minChildSize: 0.6,
            maxChildSize: 0.95,
            builder: (_, controller) {
              return Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, -5),
                      ),
                    ],
                  ),
                  child: ListView(controller: controller, children: [
                    // Tabs
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildTab("About", 0),
                        const SizedBox(width: 20),
                        _buildTab("Buy Ticket", 1),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Fake description or rundown
                  ]));
            },
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Center(
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  color: app.basecolor,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(4, 4),
                    ),
                  ],
                ),
                child: TextButton(
                  onPressed: () {
                    // TODO: Add your apply action here
                    print("Apply tapped");
                  },
                  child: const Text(
                    "Apply",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Title & top overlay
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Icon(Icons.arrow_back, color: Colors.white),
                SizedBox(height: 10),
                Text(
                  "Event Title",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 5),
                Text(
                  "Location • Date • Time",
                  style: TextStyle(color: Colors.white70),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String title, int index) {
    final bool isSelected = selectedTab == index;
    return GestureDetector(
      onTap: () => setState(() => selectedTab = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? app.basecolor : Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            // BoxShadow(
            //   offset: Offset(0, 4),
            //   color: Colors.black.withOpacity(0.25),
            //   blurRadius: 4,
            // )
          ],
          border: Border.all(color: app.basecolor, width: 1),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
