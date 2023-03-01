import 'package:flutter/material.dart';

class OrganizationMemberInfoRow extends StatelessWidget {
  const OrganizationMemberInfoRow({
    Key? key,
    required this.first,
    required this.name,
    required this.role,
    required this.lastContactMoment,
    required this.email,
    required this.phone,
    required this.size,
  }) : super(key: key);
  final bool first;
  final String name, role, lastContactMoment, email, phone;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
            width: size / 2, child: Checkbox(value: false, onChanged: (_) {})),
        SizedBox(
          width: size,
          child: Text(
            name,
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
              role,
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
            lastContactMoment,
            style: TextStyle(
              fontWeight: first ? FontWeight.bold : FontWeight.normal,
              fontSize: 14,
            ),
          ),
        ),
        SizedBox(
          width: size,
          child: Text(
            email,
            style: TextStyle(
              fontWeight: first ? FontWeight.bold : FontWeight.normal,
              fontSize: 14,
            ),
          ),
        ),
        SizedBox(
          width: size,
          child: Text(
            phone,
            style: TextStyle(
              fontWeight: first ? FontWeight.bold : FontWeight.normal,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
