import 'package:flutter/material.dart';

import '../../../app_common_widgets/custom_text.dart';

class ContactsInfoRow extends StatelessWidget {
  final String firstName,
      lastName,
      email,
      phoneNumber,
      farm,
      organizationType,
      role;
  final bool first;
  final double size;

  const ContactsInfoRow(
      {Key? key,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.phoneNumber,
      required this.farm,
      required this.organizationType,
      required this.role,
      required this.first,
      required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
        child: Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.black12))),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    // width: size / 2,
                    child: Checkbox(value: false, onChanged: (_) {})),
                // SizedBox(
                //   width: size,
                // ),
                first
                    ? SizedBox(width: size, child: CustomText(text: firstName))
                    : SizedBox(
                        width: size,
                        child: Text(
                          firstName,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                SizedBox(
                  width: size,
                  child: Text(lastName,
                      style: first
                          ? TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            )
                          : TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                ),
                SizedBox(
                  width: size,
                  child: Text(email,
                      style: first
                          ? TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            )
                          : TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                ),
                SizedBox(
                  width: size,
                  child: Text(phoneNumber,
                      style: first
                          ? TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            )
                          : TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                ),
                SizedBox(
                  width: size,
                  child: Text(organizationType,
                      style: first
                          ? TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            )
                          : TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                ),
                SizedBox(
                  width: size,
                  child: Text(role,
                      style: first
                          ? TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            )
                          : TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
