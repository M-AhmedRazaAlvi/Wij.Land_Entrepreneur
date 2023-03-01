import 'package:flutter/material.dart';
import 'package:wij_land/utils/hex_color.dart';

import '../../../utils/styles.dart';

class TitleTextWidget extends StatefulWidget {
  final String mTitle;
  final String? mSubTitle;

  const TitleTextWidget({
    Key? key,
    required this.mTitle,
    this.mSubTitle,
  }) : super(key: key);

  @override
  State<TitleTextWidget> createState() => _TitleTextWidgetState();
}

class _TitleTextWidgetState extends State<TitleTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 561,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: HexColor("#FFFFFF"),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 31, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.mTitle,
                  style: TextStyle(
                    color: HexColor("#000000"),
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontFamily: Montserrat_Medium,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close),
                )
              ],
            ),
            SizedBox(height: 9),
            Text(
              widget.mSubTitle!,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: HexColor("#000000"),
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontFamily: Montserrat_Medium,
              ),
            ),
            SizedBox(height: 9),
          ],
        ),
      ),
    );
  }
}
