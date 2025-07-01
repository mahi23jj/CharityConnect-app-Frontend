import 'package:flutter/material.dart';
import 'package:travel/Event/Model/Filter_model.dart';
import 'package:travel/Event/view/widget/eventbar.dart';
import 'package:travel/Event/view/widget/filter_bar.dart';
import 'package:travel/base_Data/customize.dart';

class UpcomingEvent extends StatefulWidget {
  const UpcomingEvent({super.key});

  @override
  State<UpcomingEvent> createState() => _UpcomingEventState();
}

class _UpcomingEventState extends State<UpcomingEvent> {
  Customize app = Customize();

  Filter filter = Filter();

  void showLongPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Top Close Button
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close, color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 10),

                Text(
                  'Filter by',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 10),

                Text(
                  'Location',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    // expnaded not to cause overflow
                    Expanded(
                      child: FilterWidget(
                          allConditions: filter.locations.keys.toList(),
                          selectedCondition: 'Location',
                          selectedConditions: filter.location),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: FilterWidget(
                          allConditions: filter.location.isNotEmpty
                              ? filter.locations[filter.location.last] ?? []
                              : [],
                          selectedCondition: 'subLocation',
                          selectedConditions: filter.subLocation),
                    ),
                    //  FilterWidget(allConditions: filter.location.isNotEmpty? filter.locations[filter.location.last]:[], selectedCondition:'subLocation', selectedConditions: filter.subLocation),
                  ],
                ),

                const SizedBox(height: 20),
                Text(
                  'Support For',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                FilterWidget(
                    allConditions: filter.supportConditions,
                    selectedCondition: 'Support Conditions',
                    selectedConditions: filter.supportCondition),

                Text(
                  'Caused By',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                FilterWidget(
                    allConditions: filter.cause,
                    selectedCondition: 'Cause',
                    selectedConditions: filter.causeTypes),

                // Placeholder image

                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Handle send action here
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child:
                      const Text("Send", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        );
      },
    );
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: const Text(
    //       'Something went wrong. Please try again later.',
    //       style: TextStyle(fontSize: 16),
    //     ),
    //     backgroundColor: Colors.red[400],
    //     behavior: SnackBarBehavior.floating,
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(12),
    //     ),
    //     margin: const EdgeInsets.all(16),
    //     padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
    //     duration: const Duration(seconds: 4),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // change the font
          // actions: [
          //   Icon(
          //     Icons.filter_alt_outlined,
          //     color: app.basecolor,
          //     size: 24,
          //   )
          // ],
          title: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Upcaming Event",
              style: TextStyle(
                  color: app.basecolor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              // Padding(padding: EdgeInsets.all(4)),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    // Icon container
                    GestureDetector(
                      onTap: () => showLongPopup(context),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey[300], // Light gray background
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.tune,
                            size: 20, color: Colors.black),
                      ),
                    ),
                    const SizedBox(width: 8),

                    // "Design" text container
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                          // color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                          border: BoxBorder.all(color: app.basecolor)),
                      child: const Text(
                        'Women',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    const SizedBox(width: 8),

                    // "Design" text container
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                          // color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                          border: BoxBorder.all(color: app.basecolor)),
                      child: const Text(
                        'Voluenter',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Column(
                children: List.generate(
                    4,
                    (index) => Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Eventbar(
                              image: 'asset/images/project.jpg',
                              eventname: 'Javascript',
                              eventdate: '2022-12-12',
                              eventlocation: 'Jakarta'),
                        )),
              ),
            ],
          ),
        ));
  }
}
