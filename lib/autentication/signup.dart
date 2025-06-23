import 'package:flutter/material.dart';
import 'package:travel/base_Data/customize.dart';

class Signup extends StatefulWidget {
  Signup({super.key});

  @override
  State<Signup> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Signup> {
  TextEditingController lapcontroller = TextEditingController();
  TextEditingController laps = TextEditingController();
  String error = '';
  Customize items = Customize();

  // Future<void> _SignupUp(String email, String password) async {
  //   try {
  //     await _auth.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => MyHomePage(),
  //         ));
  //     error='User registered successfully';
  //   } catch (e) {
  //   error=='Error registering user: $e';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //fullBackground image

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: items.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 103),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(image: AssetImage('asset/images/main_logo.png'),height: 80,width: 80),
                    Text(
                      'Charity',
                      style: TextStyle(
                          color: items.basecolor,
                          fontSize: 30,
                          fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ),
            ),
            
            Text('Create your account',style: TextStyle(fontSize: items.midfont,fontWeight: FontWeight.bold),),
             SizedBox(
              height: 37,
            ),
           Container(
            height: 46,
              decoration: BoxDecoration(
                color: Colors.grey[200], // Change this to any color you want
                borderRadius: BorderRadius.circular(4),

                boxShadow: [
                  BoxShadow(
                    color: Colors.white, // Top-left shadow for a soft look
                    offset: Offset(-3, -3),
                    blurRadius: 5,
                  ),
                  BoxShadow(
                    color:
                        Colors.grey.shade400, // Bottom-right shadow for depth
                    offset: Offset(1, 1),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: TextFormField(
                controller: laps,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color: items.textcolor,
                    fontFamily: items.font,
                    fontSize: items.midfont,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 22, vertical: 11), // Adjust padding
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 46,
              decoration: BoxDecoration(
                color: Colors.grey[200], // Change this to any color you want
                borderRadius: BorderRadius.circular(4),

                boxShadow: [
                  BoxShadow(
                    color: Colors.white, // Top-left shadow for a soft look
                    offset: Offset(-3, -3),
                    blurRadius: 5,
                  ),
                  BoxShadow(
                    color:
                        Colors.grey.shade400, // Bottom-right shadow for depth
                    offset: Offset(1, 1),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: TextFormField(
                controller: laps,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: items.textcolor,
                    fontFamily: items.font,
                    fontSize: items.midfont,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 22, vertical: 11), // Adjust padding
                ),
              ),
            ),
             SizedBox(
              height: 40,
            ),

              Container(
              height: 46,
              decoration: BoxDecoration(
                color: Colors.grey[200], // Change this to any color you want
                borderRadius: BorderRadius.circular(4),

                boxShadow: [
                  BoxShadow(
                    color: Colors.white, // Top-left shadow for a soft look
                    offset: Offset(-3, -3),
                    blurRadius: 5,
                  ),
                  BoxShadow(
                    color:
                        Colors.grey.shade400, // Bottom-right shadow for depth
                    offset: Offset(1, 1),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: TextFormField(
                controller: laps,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  labelText: 'Confirm Password',
                  suffixIcon: Icon(Icons.visibility),
                  labelStyle: TextStyle(
                    color: items.textcolor,
                    fontFamily: items.font,
                    fontSize: items.midfont,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 22, vertical: 11), // Adjust padding
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
                height: 47,
                decoration: BoxDecoration(
                  color: items.basecolor, // Change this to any color you want
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                    child: Text('Sign up',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontFamily: items.font)))),

            SizedBox(
              height: 83,
            ),
            Center(child: Text('- Or Signup In with -',
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 16,
            ),
            )
            
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              Image(image: AssetImage('asset/images/google_logo.png'),height: 40,width: 40,),
              Image(image: AssetImage('asset/images/google_logo.png'),height: 40,width: 40,),
              Image(image: AssetImage('asset/images/google_logo.png'),height: 40,width: 40,),
            ],),

              SizedBox(
              height: 60,
            ),

           
            // if (error.isNotEmpty)
            //   Text(
            //     error,
            //     style: TextStyle(color: Colors.red),
            //   ),
          ],
        ),
      ),
    );
  }
}
