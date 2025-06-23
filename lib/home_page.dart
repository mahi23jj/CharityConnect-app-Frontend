import 'package:flutter/material.dart';
import 'package:travel/base_Data/customize.dart';
import 'package:travel/story_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Customize items = Customize();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            children: [
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 16),
             child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image(image: AssetImage('asset/images/main_logo.png'),height: 80,width: 80),
                      Text(
                        'Charity',
                        style: TextStyle(
                            color: items.basecolor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                        ],
                      ),
                      Icon(Icons.search,color: items.basecolor,size: 30,),
                    ],
                  ),
           ),


      StoryViewer(),

              // Padding(
              //   padding: const EdgeInsets.only(top: 10,bottom: 30),
              //   child: SingleChildScrollView(
              //     scrollDirection: Axis.horizontal,
              //     child: Row(
              //       children: List.generate(
              //           30,
              //           (index) => Container(
              //                 height: 80,
              //                 width: 80,
              //                 decoration: BoxDecoration(
              //                    image: DecorationImage(image:AssetImage('asset/images/logo1.jpg'), fit: BoxFit.cover ),
              //                     borderRadius: BorderRadius.circular(50)),
                                     
                        
              //                 margin: EdgeInsets.only(right: 10,left: index==0? 16:0),
              //               )),
              //     ),
              //   ),
              // ),
        
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Explore',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: items.basecolor),),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),

             Column(
          children: List.generate(10, (index) => buildCard('The Children Heart Fund Ethiopia (CHFE)')), // Display all items inside the scrollable page
        ),
        
       

// Column(
//   children: [
//     StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance.collection('your_collection_name').snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return CircularProgressIndicator(); // Show loading indicator while fetching data
//         }

//         if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//           return Text("No data available"); // Show message if there's no data
//         }

//         // Convert Firestore documents to a list
//         List<DocumentSnapshot> docs = snapshot.data!.docs;

//         return Column(
//           children: docs.map((doc) {
//             String title = doc['title'] ?? 'No Title'; // Replace with your actual field name
//             return buildCard(title);
//           }).toList(),
//         );
//       },
//     ),
//   ],
// );

        
            ],
          ),
      ),
    
    );
  }
}

Widget buildCard(String title) {
   Customize items = Customize();
  return Column(children: [
         Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            image:  DecorationImage(
                                  image: AssetImage('asset/images/logo1.jpg'), fit: BoxFit.cover),
                             
                              borderRadius: BorderRadius.circular(50)) ,                
                            
                             
                          ),
                      SizedBox(width:10 ,),
                      Text(
                        title,
                        style: TextStyle(fontSize: 13, fontFamily: items.font,fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.add,
                    color: items.basecolor,
                    size: 24,
                  ),
                ],
              ),
            ),
        
            // image with width of screen and height of based on the image height 200
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Container(
                  height: 650,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('asset/images/project.jpg'), fit: BoxFit.cover)),
                  ),
            ),
        

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.favorite_border),
                      SizedBox(width: 25),
                      Icon(Icons.mode_comment_outlined),
                    ],
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Donate',
                        style: TextStyle(
                            color: items.basecolor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ))
                ],
              ),
            ),

            //  Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 24),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //        Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
            //        Text('The Children\'s Heart Fund of Ethiopia seeks passionate...')
            //     ],
            //   ),
            // ),
            Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start, // Aligns text properly if it wraps
    children: [
      Expanded( // Allows second text to wrap
        child: Text(
          title + ' The Children\'s Heart Fund of Ethiopia seeks passionate...',
          softWrap: true, // Ensures wrapping
        ),
      ),
    ],
  ),
),

  ],);
}