import 'package:flutter/material.dart';
import 'package:travel/Event/Model/ticket_option.dart';
import 'package:travel/base_Data/customize.dart';

class Ticketwidegt extends StatelessWidget {
  int selectedidx;
  Function onchange;
  Ticketwidegt({super.key, required this.selectedidx, required this.onchange});

  @override
  Widget build(BuildContext context) {
    Customize app = Customize();

    List<TicketOption> ticketOptions = [
      TicketOption(
        ticketOptionName: 'VIP',
        ticketOptionPrice: 100.0,
      ),
      TicketOption(
        ticketOptionName: 'Regular',
        ticketOptionPrice: 50.0,
      ),
    ];

    return Column(
      children: [
        Text(
          'Choose your ticket',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Column(
          children: List.generate(ticketOptions.length, (idx) {
            return GestureDetector(
              onTap: onchange(),
              child: ticketoption(ticketOptions[idx].ticketOptionName,
                  ticketOptions[idx].ticketOptionPrice, idx),
            );
          }),
        ),
        SizedBox(
          height: 6,
        ),
        Row(
          children: [
            Column(
              children: [
                Text(
                  'Tickt Quantity',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        border: Border.all(color: app.basecolor, width: 1),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Center(
                      child: Text(
                        '-',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(width: 30,),
                  Text('1' , style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                   SizedBox(width: 30,),
                    Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        border: Border.all(color: app.basecolor, width: 1),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Center(
                      child: Text(
                        '+',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  
                ])
              ],
            ),

             Column(
              children: [
                Text(
                  'Tickt Price',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 20,
                    width: 80,
                    decoration: BoxDecoration(
                        border: Border.all(color: app.basecolor, width: 1),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Center(
                      child: Text(
                        '1000',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
              ],
            )
          ],
        )
      ],
    );
  }

  Widget ticketoption(ticketOptionName, ticketOptionPrice, idx) {
    Customize app = Customize();

    final isselected = idx == selectedidx;

    return Container(
        height: 50,
        width: 300,
        decoration: BoxDecoration(
          color: isselected ? app.basecolor : Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(4, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                ticketOptionName,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isselected ? Colors.white : Colors.black),
              ),
              Text(
                ticketOptionPrice,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isselected ? Colors.white : Colors.black),
              ),
            ],
          ),
        ));
  }
}
