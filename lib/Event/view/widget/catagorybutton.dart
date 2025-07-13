import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/Event/viewmodel/Bloc/eventBloc.dart';
import 'package:travel/Event/viewmodel/Event/eventsevent.dart';

class Catagorybutton extends StatefulWidget {
  List<String> catagory;
   Catagorybutton({super.key,required this.catagory});

  @override
  State<Catagorybutton> createState() => _CatagorybuttonState();
}

class _CatagorybuttonState extends State<Catagorybutton> {
  int currentidx = 0;



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            widget.catagory.length,
            (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: _actionButton(
                  context,
                  widget.catagory[index],
                  index,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _actionButton(BuildContext context, String label, int idx) {
    final isactive = currentidx == idx;
    return GestureDetector(
      onTap: () {
        setState(() {
          currentidx = idx;
        });
        context.read<Eventbloc>().add(GetEvents(
              category: label == 'All' ? null : label,
            ));
      },
      child: Chip(
        label: Text(
          label,
          style: TextStyle(color: isactive ? Colors.white : Colors.black),
        ),
        backgroundColor: isactive ? Colors.black : Colors.grey[200],
      ),
    );
  }
}
