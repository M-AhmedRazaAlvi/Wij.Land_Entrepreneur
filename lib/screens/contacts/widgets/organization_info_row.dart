import 'package:flutter/material.dart';

import '../../../utils/functions.dart';

class OrganizationInfoRow extends StatelessWidget {
  const OrganizationInfoRow({
    Key? key,
    required this.first,
    required this.logo,
    required this.organization,
    required this.organizationType,
    required this.registrationDate,
    required this.size,
    required this.check,
  }) : super(key: key);
  final bool first, check;
  final String logo, organization, organizationType, registrationDate;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getWidth(context),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black26))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (first)
            SizedBox(
                width: size / 6,
                child: Checkbox(value: check, onChanged: (_) {}))
          else
            SizedBox(
                width: size / 6,
                child: Checkbox(value: false, onChanged: (_) {})),
          SizedBox(
            width: size,
            child: first
                ? Center(
                    child: Text(
                      logo,
                      style: TextStyle(
                        fontWeight:
                            first ? FontWeight.bold : FontWeight.normal,
                        fontSize: 14,
                      ),
                    ),
                  )
                : CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(logo),
                  ),
          ),
          SizedBox(
            width: size,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                organization,
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
              organizationType,
              style: TextStyle(
                fontWeight: first ? FontWeight.bold : FontWeight.normal,
                fontSize: 14,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: SizedBox(
              width: size,
              child: Text(
                registrationDate,
                style: TextStyle(
                  fontWeight: first ? FontWeight.bold : FontWeight.normal,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
