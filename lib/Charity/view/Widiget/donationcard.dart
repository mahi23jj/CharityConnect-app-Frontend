import 'package:flutter/material.dart';

class Donationcard extends StatelessWidget {
  final String eventname;
  final String eventdate;
  final String eventlocation;
  Donationcard(
      {super.key,
      required this.eventname,
      required this.eventdate,
      required this.eventlocation});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3))
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            //  crossAxisAlignment: CrossAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                eventname,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                  Text(
                    eventlocation,
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.calendar_month,
                    color: Colors.white,
                  ),
                  Text(
                    eventdate,
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      Positioned(
        top: 10,
        right: 10,
        bottom: 40,
          child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            backgroundBlendMode: BlendMode.darken,
            borderRadius: BorderRadius.circular(50),
            color: Colors.yellow.withOpacity(0.5)),
        child: Row(
          children: [
            Icon(
              Icons.star,
              color: Colors.white,
            ),
            Text(
              '4',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ],
        ),
      ))
    ]);
  }
}
