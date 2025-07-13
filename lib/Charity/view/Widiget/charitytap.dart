import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/Campain/view/screen/Donationdetail.dart';
import 'package:travel/Campain/view/widget/Donationlist.dart';
import 'package:travel/Charity/Viewmodel/Bloc/charitybloc.dart';
import 'package:travel/Charity/Viewmodel/Event/charityevent.dart';
import 'package:travel/Charity/Viewmodel/state/charitystate.dart';
import 'package:travel/Charity/view/Widiget/Eventcard.dart';
import 'package:travel/Charity/view/Widiget/donationcard.dart';
import 'package:travel/Event/Model/event_model.dart';
import 'package:travel/Event/view/screen/event_detail.dart';
import 'package:travel/base_Data/customize.dart';

class Charitytap extends StatelessWidget {
  final List<Eventmodel> Events;
  Charitytap({super.key, required this.Events});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharityBloc, Charitystate>(
      builder: (context, state) {
        Customize app = Customize();
        int currentidx = 0;
        if (state is Catagorytap) currentidx = state.index;

        Widget body;

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

        if (currentidx == 0) {
          body = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const Align(
              //   alignment: Alignment.centerLeft,
              //   child: Text(
              //     "Hosted Events",
              //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              //   ),
              // ),

              Column(
                children: List.generate(Events.length, (index) {
                  final event = Events[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0.0),
                    child: GestureDetector(
                      onTap: () {},

                      //  Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => EventDetail()),
                      // ),
                      child: Eventcard(
                        image: event.image,
                        eventname: event.eventname,
                        eventdate: event.eventdate,
                        eventlocation: event.eventlocation,
                      ),
                    ),
                  );
                }),
              ),
            ],
          );
        } else if (currentidx == 1) {
          body = Padding(
            padding: const EdgeInsets.all(0.0),
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
          );
        } else {
          body = const SizedBox(); // fallback or loading
        }

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _actionButton(context, 'Event', 0, currentidx),
                _actionButton(context, 'Donation', 1, currentidx)
              ],
            ),
            const Divider(color: Color.fromARGB(50, 0, 0, 0)),
            const SizedBox(height: 15),
            body
          ],
        );
      },
    );
  }

  Widget _actionButton(
      BuildContext context, String label, int idx, int currentidx) {
    final isactive = currentidx == idx;
    return GestureDetector(
      onTap: () {
        context.read<CharityBloc>().add(tap(idx));
      },
      // onchange(idx),
      child: Container(
        alignment: Alignment.center,
        width: 100,
        child: Column(
          children: [
            Icon(
              label == 'Event' ? Icons.event : Icons.attach_money,
              size: 20,
              color: Colors.black,
            ),
            if (isactive)
              Container(
                height: 3,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
