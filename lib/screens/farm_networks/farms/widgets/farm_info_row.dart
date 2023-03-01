import 'package:flutter/material.dart';

class FarmInfoRow extends StatelessWidget {
  const FarmInfoRow({
    Key? key,
    required this.first,
    required this.firstName,
    required this.farmRepresentative,
    required this.lastFarmVisit,
    required this.lastContact,
    required this.lastContactType,
    required this.dateAdded,
    required this.size,
  }) : super(key: key);
  final bool first;
  final String firstName,
      farmRepresentative,
      lastFarmVisit,
      lastContact,
      lastContactType,
      dateAdded;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black12))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              width: size / 2,
              child: Checkbox(value: false, onChanged: (_) {})),
          SizedBox(
            width: size,
            child: Text(
              firstName,
              style: TextStyle(
                fontWeight: first ? FontWeight.bold : FontWeight.normal,
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(
            width: size,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                farmRepresentative,
                style: TextStyle(
                  fontWeight: first ? FontWeight.bold : FontWeight.normal,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          SizedBox(
            width: size,
            child: Text(
              lastFarmVisit,
              style: TextStyle(
                fontWeight: first ? FontWeight.bold : FontWeight.normal,
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(
            width: size,
            child: Text(
              lastContact,
              style: TextStyle(
                fontWeight: first ? FontWeight.bold : FontWeight.normal,
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(
            width: size,
            child: Text(
              lastContactType,
              style: TextStyle(
                fontWeight: first ? FontWeight.bold : FontWeight.normal,
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(
            width: size,
            child: Text(
              dateAdded,
              style: TextStyle(
                fontWeight: first ? FontWeight.bold : FontWeight.normal,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
