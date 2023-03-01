


import 'package:flutter/material.dart';


class TicketCellsWidget extends StatelessWidget {
  final listData;
  const TicketCellsWidget({Key? key,this.listData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
        width:  200,
      child: Text(
        listData,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 13,
        ),
      ),
    );
  }
}
