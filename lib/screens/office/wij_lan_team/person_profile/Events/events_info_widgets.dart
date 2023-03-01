import 'package:flutter/material.dart';

import '../contract/contract_info_row.dart';

class EventsInfoWidget extends StatelessWidget {
  const EventsInfoWidget({
    Key? key,
    required this.first,
    required this.size,
    required this.check,
    required this.eventName,
    required this.eventDate,
    required this.rSVP,
    required this.attendance,
    required this.invitation,
  }) : super(key: key);
  final bool first, check;
  final String eventName, eventDate, rSVP, attendance, invitation;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: size,
              child: Text(
                eventName,
                style: TextStyle(
                  fontWeight: first ? FontWeight.bold : FontWeight.normal,
                  fontSize: first ? 18 : 14,
                ),
              ),
            ),
            SizedBox(
              width: size,
              child: Text(
                eventDate,
                style: TextStyle(
                  fontWeight: first ? FontWeight.bold : FontWeight.normal,
                  fontSize: first ? 18 : 14,
                ),
              ),
            ),
            SizedBox(
              width: size,
              child: Text(
                rSVP,
                style: TextStyle(
                  fontWeight: first ? FontWeight.bold : FontWeight.normal,
                  fontSize: first ? 18 : 14,
                ),
              ),
            ),
            if (first)
              SizedBox(
                width: size,
                child: Text(
                  attendance,
                  style: TextStyle(
                    fontWeight: first ? FontWeight.bold : FontWeight.normal,
                    fontSize: 18,
                  ),
                ),
              )
            else
              SizedBox(
                  width: size, child: ContractCheckBoxWidget(check: check)),
            SizedBox(
                width: size,
                child: Text(
                  invitation,
                  style: TextStyle(
                    fontWeight: first ? FontWeight.bold : FontWeight.normal,
                    fontSize: first ? 18 : 14,
                  ),
                )),
          ],
        ),
        Divider(
          color: Colors.black12,
          thickness: 1,
        )
      ],
    );
  }
}
