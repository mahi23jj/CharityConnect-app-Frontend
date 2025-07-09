import 'package:flutter/material.dart';
import 'package:travel/Campain/view/screen/Donationdetail.dart';
import 'package:travel/Campain/view/widget/Donationlist.dart';

class CampaignListPage extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {'title': 'Scholarship', 'count': 20},
    {'title': 'Disaster', 'count': 8},
    {'title': 'Health', 'count': 4},
    {'title': 'Education', 'count': 12},
  ];

  final List<Map<String, dynamic>> campaigns = [
    {
      'image': 'asset/images/project.jpg',
      'title': 'Urgent! Help the construction mosque',
      'author': 'Adaa Bisaaa',
      'amount': '\$23,423',
      'daysLeft': '31 days left',
      'progress': 0.6,
    },
    {
      'image': 'asset/images/project.jpg',
      'title': 'Elderly strokes work roughly paid 20 thousand',
      'author': 'Prikilow',
      'amount': '\$40,200',
      'daysLeft': '20 days left',
      'progress': 0.4,
    },
    {
      'image': 'asset/images/project.jpg',
      'title': "Help people who can't continue their education",
      'author': 'Bissaa kuy',
      'amount': '\$5,500',
      'daysLeft': '15 days left',
      'progress': 0.9,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔍 Search Bar
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search campaign',
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            // 🏷️ Category Chips
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    child: Icon(Icons.filter_list, color: Colors.white),
                  ),
                  SizedBox(width: 12),
                  ...categories.map((cat) => Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Chip(
                          label: Text('${cat['title']} ${cat['count']}'),
                          backgroundColor: Colors.grey[200],
                        ),
                      )),
                ],
              ),
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: List.generate(
                  campaigns.length,
                  (index) {
                    final item = campaigns[index];
                    return GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DonationDetail())),
                      child: Donationlist(
                        title: item['title'],
                        amount: item['amount'],
                        image: item['image'],
                        author: item['author'],
                        date: item['daysLeft'],
                        progress: item['progress'],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
