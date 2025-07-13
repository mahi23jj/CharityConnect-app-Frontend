import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel/Event/view/widget/aboutwidget.dart';
import 'package:travel/base_Data/customize.dart';

class Detailbranchs extends StatefulWidget {
  String discription;
  List<String> target;
  Detailbranchs({super.key,required this.discription,required this.target});

  @override
  State<Detailbranchs> createState() => _DetailbranchsState();
}

class _DetailbranchsState extends State<Detailbranchs> {
  int selectedTab = 0;
  Customize app = Customize();

  Widget body = Container();

  

  @override
  Widget build(BuildContext context) {
    if (selectedTab == 0) {
      body = Aboutwidget(
        discription: widget.discription,
        target: widget.target,
      );
    } else if (selectedTab == 1) {
      body = Container();
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTab("About", 0),
            const SizedBox(width: 20),
            _buildTab("Buy Ticket", 1),
          ],
        ),
        const SizedBox(height: 10),
        body
      ],
    );
  }


  Widget _buildTab(String title, int index) {
    final bool isSelected = selectedTab == index;
    return GestureDetector(
      onTap: () => setState(() => selectedTab = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? app.basecolor : Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            // BoxShadow(
            //   offset: Offset(0, 4),
            //   color: Colors.black.withOpacity(0.25),
            //   blurRadius: 4,
            // )
          ],
          border: Border.all(color: app.basecolor, width: 1),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
