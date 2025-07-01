import 'package:flutter/material.dart';

class Eventbar extends StatelessWidget {
  final String image;
  final String eventname;
  final String eventdate;
  final String eventlocation;
 Eventbar({super.key,required this.image,required this.eventname,required this.eventdate,required this.eventlocation});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3), spreadRadius: 5, blurRadius: 7, offset: Offset(0, 3))],
        ),

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
        //  crossAxisAlignment: CrossAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
          children: [
          Text(eventname,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Row(
            children: [
              const Icon(Icons.location_on,color: Colors.white,),
              Text(eventlocation,style: TextStyle(color: Colors.white,fontSize: 15),),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.calendar_month,color: Colors.white,),
              Text(eventdate,style: TextStyle(color: Colors.white,fontSize: 15),),
            ],
          ),
        ],),
      ) ,);
  }
}