import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  Function(int) onchange;
  int currentidx;

  ProfileTab({super.key, required this.currentidx, required this.onchange});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        tab(Title: Icons.monetization_on, idx: 0),
        tab(Title: Icons.party_mode, idx: 1),
        tab(Title: Icons.shopping_cart, idx: 2),
      ],
    );
  }

  Widget tab({required IconData Title, required int idx}) {
    final isactive = currentidx == idx;
    return GestureDetector(
      onTap: () {},
      // onchange(idx),
      child: Container(
        alignment: Alignment.center,
        width: 100,
        child: Column(
          children: [
            Icon(
              Title,
              size: 20,
              color: isactive ? Colors.indigoAccent : Colors.black,
            ),
            if (isactive)
              Container(
                height: 3,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.indigoAccent,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
