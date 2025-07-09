import 'package:flutter/material.dart';
import 'package:travel/base_Data/Widget/images.dart';

class Eventcard extends StatelessWidget {
  final String image;
  final String eventname;
  final String eventdate;
  final String eventlocation;
  Eventcard(
      {super.key,
      required this.image,
      required this.eventname,
      required this.eventdate,
      required this.eventlocation});

  @override
  Widget build(BuildContext context) {
    return  Stack(
  children: [
    // Container(
    //   // height: 130,
    //   margin: const EdgeInsets.symmetric(vertical: , horizontal: 12),
    //   decoration: BoxDecoration(
      
    //     borderRadius: BorderRadius.circular(16),
    //     // boxShadow: [
    //     //   BoxShadow(
    //     //     color: Colors.black.withOpacity(0.05),
    //     //     spreadRadius: 2,
    //     //     blurRadius: 8,
    //     //     offset: Offset(0, 4),
    //     //   ),
    //     // ],
    //   ),
      // child:
       Row(
        children: [
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Text(
                  //   ,
                  //   style: TextStyle(
                  //     fontSize: 15,
                  //     fontWeight: FontWeight.w600,
                  //     color: Colors.black87,
                  //   ),
                  // ),
                  Text(eventname,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.grey[600], size: 18),
                      const SizedBox(width: 4),
                      Text(
                        eventlocation,
                        style: TextStyle(color: Colors.grey[700], fontSize: 12),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.calendar_month, color: Colors.grey[600], size: 18),
                      const SizedBox(width: 4),
                      Text(
                        eventdate,
                        style: TextStyle(color: Colors.grey[700], fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    

    // ⭐ Rating Badge
    Positioned(
      top: 12,
      right: 20,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.amber.withOpacity(0.9),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: const [
            Icon(Icons.star, color: Colors.white, size: 16),
            SizedBox(width: 4),
            Text(
              '4.0',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ),
  ],
);

    


    // Stack(children: [
    //   Container(
    //     height: 120,
    //     width: double.infinity,
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(10),
    //       boxShadow: [
    //         BoxShadow(
    //             color: Colors.black.withOpacity(0.05),
    //             spreadRadius: 2,
    //             blurRadius: 3,
    //             offset: Offset(0, 3))
    //       ],
    //     ),
    //     child: Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: Row(
    //         children: [
    //           Padding(
    //               padding: const EdgeInsets.only(right: 10),
    //               child: Images(
    //                 image: image,
    //                 height: 100,
    //                 radius: 20,
    //                 width: 100,
    //               )),
    //           SizedBox(
    //             width: 10,
    //           ),
    //           Column(
    //             //  crossAxisAlignment: CrossAxisAlignment.center,
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             mainAxisAlignment: MainAxisAlignment.end,
    //             children: [
    //               Text(
    //                 eventname,
    //                 style: TextStyle(
                      
    //                     fontSize: 20,
    //                     fontWeight: FontWeight.bold),
    //               ),
    //               SizedBox(
    //                 height: 10,
    //               ),
    //               Row(
    //                 children: [
    //                   const Icon(
    //                     Icons.location_on,
    //                     color: Colors.grey,
    //                   ),
    //                   Text(
    //                     eventlocation,
    //                     style: TextStyle(color: Colors.grey, fontSize: 15),
    //                   ),
    //                 ],
    //               ),
    //               Row(
    //                 children: [
    //                   const Icon(
    //                     Icons.calendar_month,
    //                     color: Colors.grey,
    //                   ),
    //                   Text(
    //                     eventdate,
    //                     style: TextStyle(color: Colors.grey, fontSize: 15),
    //                   ),
    //                 ],
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    //   Positioned(
    //       top: 10,
    //       right: 10,
    //       bottom: 40,
    //       child: Container(
          
    //         width: 50,
    //         decoration: BoxDecoration(
    //             backgroundBlendMode: BlendMode.darken,
    //             borderRadius: BorderRadius.circular(50),
    //             color: Colors.yellow.withOpacity(0.5)),
    //         child: Row(
    //           children: [
    //             Icon(
    //               Icons.star,
    //               color: Colors.white,
    //             ),
    //             Text(
    //               '4',
    //               style: TextStyle(color: Colors.white, fontSize: 15),
    //             ),
    //           ],
    //         ),
    //       ))
    // ]);
  }
}
