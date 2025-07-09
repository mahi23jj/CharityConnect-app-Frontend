import 'package:flutter/material.dart';
import 'package:travel/base_Data/Widget/images.dart';
import 'package:travel/base_Data/customize.dart';

class DonationDetail extends StatefulWidget {
  const DonationDetail({super.key});

  @override
  State<DonationDetail> createState() => _DonationDetailState();
}

class _DonationDetailState extends State<DonationDetail> {
  Customize app = Customize();

  void share(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
          height: 160,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _shareOption(Icons.telegram, 'Telegram'),
              _shareOption(Icons.facebook, 'Facebook'),
              _shareOption(Icons.youtube_searched_for, 'YouTube', Colors.red),
            ],
          ),
        );
      },
    );
  }

  Widget _shareOption(IconData icon, String label, [Color? iconColor]) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.grey.shade200,
          child: Icon(icon, color: iconColor ?? Colors.black),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Top Image
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.45,
            width: double.infinity,
            child: Image.asset(
              'asset/images/project.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // Draggable Content
          DraggableScrollableSheet(
            initialChildSize: 0.6,
            minChildSize: 0.6,
            maxChildSize: 0.95,
            builder: (_, controller) {
              return Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, -5),
                    ),
                  ],
                ),
                child: ListView(
                  controller: controller,
                  children: [
                    Text(
                      'Help Family Village',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: app.basecolor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '125,000 raised from 500,000 target',
                      style: TextStyle(fontSize: 15, color: app.secondary),
                    ),
                    const SizedBox(height: 6),
                    // Progress bar
                    LinearProgressIndicator(
                      value: 125000 / 500000,
                      backgroundColor: Colors.grey.shade300,
                      color: app.basecolor,
                      minHeight: 8,
                    ),
                    const SizedBox(height: 20),

                    // Organizer Info Row
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/1.png'),
                          radius: 18,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Mekedonia',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: app.basecolor,
                            ),
                          ),
                        ),
                        Text(
                          '875 donors • 15 days left',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 30),

                    // Image Gallery
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Images(
                              image: 'asset/images/project.jpg',
                              height: 100,
                              width: 100,
                              radius: 12,
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Description
                    const Text(
                      "This project aims to support displaced families by providing stable housing and essential resources. Your donation helps fund construction, education, and basic healthcare support in the Family Village initiative.",
                      style: TextStyle(fontSize: 15, height: 1.4),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              );
            },
          ),

          // Top Back & Share Buttons
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.arrow_back, color: Colors.white),
                IconButton(
                  onPressed: () => share(context),
                  icon: const Icon(Icons.share, color: Colors.white),
                ),
              ],
            ),
          ),

          // Bottom Apply Button
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: app.basecolor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              onPressed: () {
                print("Apply tapped");
              },
              child: const Text(
                "Apply",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
