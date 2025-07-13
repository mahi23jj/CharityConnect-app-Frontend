import 'package:flutter/material.dart';

class Aboutwidget extends StatelessWidget {
  String discription;
  List<String> target;

  Aboutwidget({super.key, required this.discription, required this.target});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            discription,
            style: TextStyle(fontSize: 16 , color: Colors.black),
          ),
          const SizedBox(height: 5),
          // line
          const Divider(
            color: Color.fromARGB(255, 43, 40, 40),
          ),
          const SizedBox(height: 5),
          Text(
            'Target For',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: List.generate(target.length, (index) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 224, 236, 112),
                  borderRadius: BorderRadius.circular(20),
                  // boxShadow: [
                  //   BoxShadow(
                  //     offset: Offset(0, 4),
                  //     color: Colors.black.withOpacity(0.25),
                  //     blurRadius: 4,
                  //   )
                  // ],
                  // border: Border.all(color: , width: 1),
                ),
                child: Text(
                  target[index],
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 5),
          const Divider(
            color: Color.fromARGB(255, 43, 40, 40),
          ),
          const SizedBox(height: 5),
          Text(
            'Memories',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
