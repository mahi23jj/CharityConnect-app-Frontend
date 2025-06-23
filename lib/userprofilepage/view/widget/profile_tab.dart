import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  Function(int) onchange;
  int currentidx;

  ProfileTab({super.key, required this.currentidx, required this.onchange});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        tab(Title: 'Donation', idx: 0),
        tab(Title: 'Volunter', idx: 1)
      ],
    );
  }

  Widget tab({required String Title, required int idx}) {
    final isactive = currentidx == idx;
    return GestureDetector(
      onTap:()=> onchange(idx),
      child: Container(
        alignment: Alignment.center,
        width: 100,
        height: 40,
        child: Text(
          Title,
          style: TextStyle(
              color: isactive ? Colors.indigoAccent : Colors.black,
              fontSize: isactive ? 25 : 18),
        ),
      ),
    );
  }
}
