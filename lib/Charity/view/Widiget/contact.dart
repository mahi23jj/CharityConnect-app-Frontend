import 'package:flutter/material.dart';

class buildSocialItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const buildSocialItem({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(50),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.white10,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(title, style: const TextStyle(color: Colors.white)),
        trailing: const Icon(Icons.more_vert, color: Colors.white54),
        onTap: () {
          // TODO: handle tap actions like opening links or calling
        },
      ),
    );
  }
}
