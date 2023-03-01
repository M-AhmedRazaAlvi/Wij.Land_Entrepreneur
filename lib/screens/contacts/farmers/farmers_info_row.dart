import 'package:flutter/material.dart';

class FarmerInfoRow extends StatelessWidget {
  final String firstName, lastName, farm, role, email, phoneNumber, joinDate;
  final bool first;
  final double size;
  const FarmerInfoRow(
      {Key? key,
      required this.firstName,
      required this.lastName,
      required this.farm,
      required this.role,
      required this.email,
      required this.phoneNumber,
      required this.joinDate,
      required this.first,
      required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Colors.black.withOpacity(0.1)))),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                width: size, child: Checkbox(value: false, onChanged: (_) {})),
            SizedBox(
                width: size,
                child: Text(firstName,
                    style: first
                        ? TextStyle(color: Colors.black, fontSize: 14)
                        : TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold))),
            SizedBox(
                width: size,
                child: Text(lastName,
                    style: first
                        ? TextStyle(color: Colors.black, fontSize: 14)
                        : TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold))),
            SizedBox(
                width: size,
                child: Text(farm,
                    style: first
                        ? TextStyle(color: Colors.black, fontSize: 14)
                        : TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold))),
            SizedBox(
                width: size,
                child: Text(role,
                    style: first
                        ? TextStyle(color: Colors.black, fontSize: 14)
                        : TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold))),
            SizedBox(
                width: size,
                child: Text(email,
                    style: first
                        ? TextStyle(color: Colors.black, fontSize: 14)
                        : TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold))),
            SizedBox(
                width: size,
                child: Text(phoneNumber,
                    style: first
                        ? TextStyle(color: Colors.black, fontSize: 14)
                        : TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold))),
            SizedBox(
                width: size,
                child: Text(joinDate,
                    style: first
                        ? TextStyle(color: Colors.black, fontSize: 14)
                        : TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)))
          ],
        ),
      ),
    );
  }
}
