//
import 'package:flutter/material.dart';
import 'package:travel/Charity/Viewmodel/repository/charityrepo.dart';
import 'package:travel/Charity/view/Widiget/Eventcard.dart';
import 'package:travel/Charity/view/Widiget/charitytap.dart';
import 'package:travel/Charity/view/Widiget/contact.dart';
import 'package:travel/Charity/view/Widiget/donationcard.dart';
import 'package:travel/Event/view/screen/event_detail.dart';
import 'package:travel/base_Data/Widget/text.dart';
import 'package:travel/base_Data/customize.dart';
import 'package:travel/userprofilepage/view/widget/profile_tab.dart';

class Charitydetail extends StatefulWidget {
  String id;
  Charitydetail({super.key, required this.id});

  @override
  State<Charitydetail> createState() => _CharitydetailState();
}

class _CharitydetailState extends State<Charitydetail> {
  Customize app = Customize();
  final user = 'xyz';
  final email = 'Contact info';
  final donate = 120;
  final volunter = 8;
  int currentidx = 0;

  // Row(
  void showSocialMediaDialog(
      BuildContext context,
      String? Facebook,
      String? Instagram,
      String? Telegram,
      String? Email,
      String? Website,
      String? Whatsapp) {
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
                  Website != null
                      ? buildSocialItem(
                          links: Website, icon: Icons.web, title: "Website")
                      : Container(),
                  Facebook != null
                      ? buildSocialItem(
                          links: '', icon: Icons.facebook, title: "Facebook")
                      : Container(),
                  Instagram != null
                      ? buildSocialItem(
                          links: '', icon: Icons.camera_alt, title: "Instagram")
                      : Container(),
                  Whatsapp != null
                      ? buildSocialItem(
                          links: '', icon: Icons.music_note, title: "whatsapp")
                      : Container(),
                  Telegram != null
                      ? buildSocialItem(
                          links: '', icon: Icons.telegram, title: "Telegram")
                      : Container(),
                  Email != null
                      ? buildSocialItem(
                          links: '', icon: Icons.email, title: "Email")
                      : Container(),
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
      body: FutureBuilder(
          future: Charityrepo().getcharitydetail(widget.id),
          builder: (context, Snapshot) {
            if (Snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (Snapshot.hasError) {
              return Center(child: Text('Error: ${Snapshot.error}'));
            }
            final org = Snapshot.data!;
            return SingleChildScrollView(
              padding: const EdgeInsets.only(
                  top: 60, bottom: 10, left: 16, right: 16),
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
                    org.orgName,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  const SizedBox(height: 6),
                  GestureDetector(
                      onTap: () => showSocialMediaDialog(
                          context,
                          org.orgFacebook,
                          org.orgInstagram,
                          org.orgWhatsapp,
                          org.orgTelegram,
                          org.websiteUrl,
                          org.orgEmail),
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
                    text: org.orgDescription,
                  ),

                  const SizedBox(height: 20),

                  Charitytap(
                    Events: org.events,
                  ),

                  // Event List
                ],
              ),
            );
          }),
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
