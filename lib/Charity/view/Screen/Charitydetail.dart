//
import 'package:flutter/material.dart';
import 'package:travel/Charity/view/Widiget/Eventcard.dart';
import 'package:travel/Charity/view/Widiget/contact.dart';
import 'package:travel/Event/view/screen/event_detail.dart';
import 'package:travel/base_Data/Widget/text.dart';
import 'package:travel/base_Data/customize.dart';
import 'package:travel/userprofilepage/view/widget/profile_tab.dart';

class Charitydetail extends StatefulWidget {
  const Charitydetail({super.key});

  @override
  State<Charitydetail> createState() => _CharitydetailState();
}

class _CharitydetailState extends State<Charitydetail> {
  Customize app = Customize();
  final user = 'xyz';
  final email = 'Contact info';
  final donate = 120;
  final volunter = 8;

  // Row(
  void showSocialMediaDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Close button
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close, color: Colors.grey),
                  ),
                ),

                const SizedBox(height: 10),
                const Text(
                  'Social Media',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 20),

                // Social List
                ...[
        
                  buildSocialItem(icon: Icons.phone, title: "Phone Number"),
                  buildSocialItem(icon: Icons.facebook, title: "Facebook"),
                  buildSocialItem(icon: Icons.camera_alt, title: "Instagram"),
                  buildSocialItem(icon: Icons.music_note, title: "TikTok"),
                  buildSocialItem(icon: Icons.telegram, title: "Telegram"),
                  buildSocialItem(icon: Icons.email, title: "Email"),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   title: Text("XYZ"),
      //   centerTitle: true,

      //   elevation: 1,
      // ),
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.only(top: 60, bottom: 10, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Picture
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.grey[200],
                radius: 45,
                child: Icon(Icons.volunteer_activism,
                    color: app.basecolor, size: 40),
              ),
            ),

            const SizedBox(height: 10),

            // Organization Name
            Text(
              user,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            const SizedBox(height: 6),
            GestureDetector(
                onTap: () => showSocialMediaDialog(context),
                child: Text(email,
                    style: TextStyle(
                        color: const Color.fromARGB(255, 13, 92, 211)))),

            const SizedBox(height: 20),

            // Stats
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStat("Followers", donate.toString()),
                _buildStat("Events", volunter.toString()),
              ],
            ),

            const SizedBox(height: 20),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _actionButton("Follow", app.basecolor),
                const SizedBox(width: 12),
                _actionButton("Report", Colors.red),
              ],
            ),

            const SizedBox(height: 20),

            ExpandableText(
              text:
                  "Building trust and connection with your audience matters. Our organization aims to serve with transparency,impact, and compassion. Explore the events we've hosted below.Building trust and connection with your audience matters. Our organization aims to serve with transparency, impact, and compassion. Explore the events we've hosted below.impact, and compassion. Explore the events we've hosted below.",
            ),

            // About / Description
            // Text(
            //   "Building trust and connection with your audience matters. Our organization aims to serve with transparency, impact, and compassion. Explore the events we've hosted below.",
            //   style: const TextStyle(fontSize: 15.5, height: 1.4),
            //   textAlign: TextAlign.center,
            // ),

            const SizedBox(height: 20),

            // Tabs
            ProfileTab(
              currentidx: 0,
              onchange: (idx) {},
            ),

            const Divider(color: Color.fromARGB(50, 0, 0, 0)),

            const SizedBox(height: 10),

            // Event List
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Hosted Events",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
            const SizedBox(height: 10),

            Column(
              children: List.generate(
                4,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: GestureDetector(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EventDetail())),
                    child: Eventcard(
                      image: 'asset/images/project.jpg',
                      eventname: 'Javascript Conference',
                      eventdate: '2022-12-12',
                      eventlocation: 'Jakarta',
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildStat(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: TextStyle(color: Colors.grey[700], fontSize: 14),
        )
      ],
    );
  }

  Widget _actionButton(String label, Color color) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        // Add action here
      },
      child: Container(
        alignment: Alignment.center,
        height: 44,
        width: 130,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(label,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
