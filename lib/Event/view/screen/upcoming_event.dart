import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/Event/Model/Filter_model.dart';
import 'package:travel/Event/Model/event_model.dart';
import 'package:travel/Event/view/screen/event_detail.dart';
import 'package:travel/Event/view/widget/Filterwidegt.dart';
import 'package:travel/Event/view/widget/catagorybutton.dart';
import 'package:travel/Event/view/widget/eventbar.dart';
import 'package:travel/Event/view/widget/filter_bar.dart';
import 'package:travel/Event/viewmodel/Bloc/eventBloc.dart';
import 'package:travel/Event/viewmodel/Event/eventsevent.dart';
import 'package:travel/Event/viewmodel/state/eventstate.dart';
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
              crossAxisAlignment: CrossAxisAlignment.start,
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

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Filter',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                Text(
                  'Location',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                LocationWidget(
                    allConditions: filter.locations.keys.toList(),
                    selectedCondition: 'Location',
                    selectedConditions: filter.location),
                // const SizedBox(height: 20),
                Text(
                  'Support For',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                FilterWidget(
                    allConditions: filter.supportConditions,
                    selectedCondition: 'Support Conditions',
                    selectedConditions: filter.supportCondition),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Handle send action here
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text("Cancel",
                          style: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Handle send action here
                        Navigator.pop(context);

                        // Dispatch BLoC event to filter
                        context.read<Eventbloc>().add(GetEvents(
                              supportGroups:
                                  filter.supportCondition, // from your widget
                            ));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: app.basecolor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text("Apply",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
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
                child: SizedBox(
                  height: 50,
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
                      Catagorybutton(
                        catagory: filter.catagory,
                      )
                  
                      // "Design" text container
                    ],
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),

              BlocBuilder<Eventbloc, Eventstate>(
                builder: (context, state) {
                  if (state is Eventloading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is Eventloaded) {
                    return Column(
                      children: List.generate(
                            state.upcamingevents.length,
                          (index) => Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: GestureDetector(
                                  onTap: () {

                                    // context.read<Eventbloc>().add(GetEventsdetail(id: ));
                                    
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EventDetail(id: state.upcamingevents[index].id,)));
                                  } ,
                                  child: Eventbar(
                                      image: state.upcamingevents[index].image,
                                      eventname:
                                          state.upcamingevents[index].eventname,
                                      eventdate:
                                          state.upcamingevents[index].eventdate,
                                      eventlocation: state
                                          .upcamingevents[index].eventlocation),
                                ),
                              )),
                    );
                  } else if (state is Eventerror) {
                    return Text(state.message);
                  }
                  return const Center(
                    child: Text('Nothing is loded'),
                  );
                },
              )
            ],
          ),
        ));
  }
}
