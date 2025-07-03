import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/userprofilepage/view/widget/profile_tab.dart';

import '../../viewmodel/profileprovider.dart';

class user_profile extends StatefulWidget {
  const user_profile({super.key});

  @override
  State<user_profile> createState() => _user_profileState();
}

class _user_profileState extends State<user_profile> {
  final user = 'xyz';
  final email = 'xyz@gmail.com';
  final donate = 0;
  final volunter = 0;
  int currentidx = 0;

  // void ontap(int idx) {
  //   setState(() {
  //     currentidx = idx;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CircleAvatar(
                backgroundColor: Colors.blueAccent,
                radius: 40,
                child: Icon(Icons.ac_unit_sharp),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            user,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            email,
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text('${donate}'),
                  Text('Donation'),
                ],
              ),
              Column(
                children: [
                  Text('${volunter}'), 
                Text('Voluneter')],
              )
            ],
          ),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: ProfileTab(
                currentidx: 0,
                // context.read<Profileprovider>().state,
                onchange: (idx) => () {}),
          ),
          Divider(
            color: const Color.fromARGB(31, 49, 48, 48),
          ),

          // context.read<Profileprovider>().ontap(idx))
        ],
      ),
    );
  }
}
