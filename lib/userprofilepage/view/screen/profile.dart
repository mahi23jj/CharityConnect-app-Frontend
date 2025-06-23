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
            children: [
              const CircleAvatar(
                backgroundColor: Colors.blueAccent,
                radius: 40,
                child: Icon(Icons.ac_unit_sharp),
              ),
              Column(
                children: [
                  Text(
                    user,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [Text('Donation'), Text('${donate}')],
                      ),
                      Column(
                        children: [Text('Voluneter'), Text('${volunter}')],
                      )
                    ],
                  ),
                  Divider(),
                  ProfileTab(
                      currentidx: context.read<Profileprovider>().state,
                      onchange: (idx) =>
                          context.read<Profileprovider>().ontap(idx))
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
