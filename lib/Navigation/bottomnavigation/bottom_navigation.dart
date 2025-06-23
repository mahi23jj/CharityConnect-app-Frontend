import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Bottomnavigator extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const Bottomnavigator({super.key,required this.navigationShell});

  void ontap(int index){
    navigationShell.goBranch(index,
    initialLocation: index==navigationShell.currentIndex
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar:
      BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: ontap,
        items: const [
          BottomNavigationBarItem( label: 'Home',icon: Icon(Icons.home)),
          BottomNavigationBarItem( label: 'Search',icon: Icon(Icons.search)),
          BottomNavigationBarItem( label: 'Profile',icon: Icon(Icons.person)), 
        ]
        )
    
      
       ,);
  }
}