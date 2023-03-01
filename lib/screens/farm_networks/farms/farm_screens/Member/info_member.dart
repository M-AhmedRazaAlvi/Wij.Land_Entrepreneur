import 'package:flutter/material.dart';

import '../../../../office/wij_lan_team/person_profile/contract/contract_info_row.dart';

class MembersInfoWidget extends StatelessWidget {
  const MembersInfoWidget({
    Key? key,
    required this.first,
    required this.size,
    required this.check,
    required this.joinDate,
    required this.memberName,
    required this.memberEmail,
    required this.memberNumber,
    required this.memberRole,
  }) : super(key: key);
  final bool first, check;
  final String memberName, memberEmail, memberNumber, joinDate, memberRole;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black26))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (first)
            SizedBox(
                width: size / 6, child: ContractCheckBoxWidget(check: check))
          else
            SizedBox(
                width: size / 6, child: ContractCheckBoxWidget(check: check)),
          SizedBox(
            width: 20,
          ),
          SizedBox(
            width: size,
            child: Text(
              memberName,
              style: TextStyle(
                fontWeight: first ? FontWeight.bold : FontWeight.normal,
                fontSize: first ? 18 : 14,
              ),
            ),
          ),
          SizedBox(
            width: size,
            child: Text(
              memberEmail,
              style: TextStyle(
                fontWeight: first ? FontWeight.bold : FontWeight.normal,
                fontSize: first ? 18 : 14,
              ),
            ),
          ),
          SizedBox(
            width: size,
            child: Text(
              memberNumber,
              style: TextStyle(
                fontWeight: first ? FontWeight.bold : FontWeight.normal,
                fontSize: first ? 18 : 14,
              ),
            ),
          ),
          SizedBox(
              width: size,
              child: Text(
                joinDate,
                style: TextStyle(
                  fontWeight: first ? FontWeight.bold : FontWeight.normal,
                  fontSize: first ? 18 : 14,
                ),
              )),
          SizedBox(
              width: size,
              child: Text(
                memberRole,
                style: TextStyle(
                  fontWeight: first ? FontWeight.bold : FontWeight.normal,
                  fontSize: first ? 18 : 14,
                ),
              )),
        ],
      ),
    );
  }
}
