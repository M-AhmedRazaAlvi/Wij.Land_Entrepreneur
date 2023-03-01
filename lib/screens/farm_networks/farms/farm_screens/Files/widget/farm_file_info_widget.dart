import 'package:flutter/material.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Files/widget/edit_interview_dialogs.dart';

import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../office/wij_lan_team/person_profile/Contact_moments/widget/contact_info_row.dart';

class FarmFileInfoRowWidget extends StatelessWidget {
  const FarmFileInfoRowWidget({
    Key? key,
    required this.first,
    required this.size,
    required this.check,
    required this.fileName,
    required this.addedBy,
    required this.dateBy,
  }) : super(key: key);
  final bool first, check;
  final String fileName, addedBy, dateBy;

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black26))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (first)
            SizedBox(
              width: size / 6,
            )
          else
            SizedBox(
                width: size / 6, child: ContactCheckBoxWidget(check: check)),
          const SizedBox(
            width: 20,
          ),
          if (first)
            SizedBox(
              width: size / 2,
            )
          else
            SizedBox(
              width: size / 2,
              child: InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.file_present,
                ),
              ),
            ),
          SizedBox(
            width: size * 1.5,
            child: CustomText(
              text: fileName,
              size: first ? 18 : 14,
              weight: first ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          SizedBox(
            width: size * 1.5,
            child: CustomText(
              text: addedBy,
              size: first ? 18 : 14,
              weight: first ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          SizedBox(
            width: size * 1.5,
            child: CustomText(
              text: dateBy,
              size: first ? 18 : 14,
              weight: first ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          if (first)
            SizedBox(
              width: size,
            )
          else
            SizedBox(
              width: size,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const EditInterviewDialogBox();
                            });
                      },
                      icon: const Icon(Icons.info_outline)),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
