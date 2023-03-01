import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../utils/styles.dart';

class MenuPopupWidget extends StatelessWidget {
  const MenuPopupWidget({
    Key? key,
    required this.contents,
  }) : super(key: key);

  final List<String> contents;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 6),
              color: lightGrey.withOpacity(.1),
              blurRadius: 12)
        ],
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            elevation: 2,
            backgroundColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 2),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        child: PopupMenuButton(
          offset: Offset(50, 50),
          itemBuilder: (context) {
            return contents
                .map((e) => PopupMenuItem(
                    value: e,
                    child: Row(
                      children: [
                        Icon(Icons.delete, color: Colors.green),
                        Text(e, style: TextStyle(fontFamily: Montserrat_Medium,
                        ),),
                      ],
                    )))
                .toList();
          },
          onSelected: (value) {
            switch (value) {
              case "Delete":
                print("Delete");

                break;
              case "Download":
                print("Download");
                break;
            }
          },
        ),
      ),
    );
  }
}
