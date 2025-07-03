import 'package:flutter/material.dart';

class Donationlist extends StatelessWidget {
  final String title;
  final String image;
  final String author;
  final String amount;
  final String date;
  final double progress;

  const Donationlist({
    super.key,
    required this.title,
    required this.image,
    required this.author,
    required this.amount,
    required this.date,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          // 📷 Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              image,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),

          // 📄 Details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              const SizedBox(height: 4),
              Text(author, style: TextStyle(fontSize: 12, color: Colors.black)),
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 100,
                    child: LinearProgressIndicator(
                      value: progress, // must be between 0.0 - 1.0
                      minHeight: 6,
                      backgroundColor: Colors.grey.shade300,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${(progress * 100).toStringAsFixed(0)}% reached',
                    style: const TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ],
              ),

              const SizedBox(height: 8),
              // 💰 Amount and Time
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(amount,
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold)),
                  Text(date,
                      style: TextStyle(fontSize: 12, color: Colors.black)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
