import 'package:flutter/material.dart';
import 'package:travel/base_Data/Widget/images.dart';
import 'package:travel/base_Data/customize.dart';

class Donationdetail extends StatefulWidget {
  const Donationdetail({super.key});

  @override
  State<Donationdetail> createState() => _DonationdetailState();
}

class _DonationdetailState extends State<Donationdetail> {
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
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, -5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Help Family Village ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(
                          '125,000',
                          style: TextStyle(fontSize: 16, color: app.secondary),
                        ),
                        Text(
                          ' fund collected from 500,000',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Divider(
                      color: app.background,
                    ),
                    Row(children: [
                      CircleAvatar(
                        child: Image.asset(
                          'assets/images/1.png',
                          fit: BoxFit.cover,
                        ),
                        radius: 15,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Mekedonia',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: app.basecolor),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '|',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: app.background),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '875',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: app.background),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '|',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: app.background),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '15 day left',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ]),
                    Divider(
                      color: app.background,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          4,
                          (index) {
                            return Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Images(
                                  image: 'asset/images/project.jpg',
                                  height: 100,
                                  radius: 20,
                                  width: 100,
                                ));
                          },
                        ),
                      ),
                    ),
                    Text(
                      "Great question, Mahlet — this is where you can make your charity app feel real, helpful, and trustworthy. On the Event Detail Page, think like a participant: “Should I attend or donate to this?” So, your page should give all info that builds trust, clarity, and motivation.",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              );
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(Icons.arrow_back, color: Colors.white),
                Icon(Icons.share, color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
