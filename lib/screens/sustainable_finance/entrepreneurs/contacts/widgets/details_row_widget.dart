import 'package:flutter/material.dart';
import 'package:wij_land/utils/functions.dart';

import '../../../../../utils/hex_color.dart';
import '../../../../../utils/responsive.dart';
import '../../../../../utils/styles.dart';

class DetailsRowWidget extends StatelessWidget {
  final String mKeyText, mValueText;
  final bool mIsMandatory;

  const DetailsRowWidget({
    Key? key,
    required this.mIsMandatory,
    required this.mKeyText,
    required this.mValueText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: !Responsive.isMobile(context) ? getWidth(context) * 0.2 : getWidth(context) * 0.4,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: mKeyText,
                  style: TextStyle(
                    color: HexColor('#231F20'),
                    fontSize: Responsive.isMobile(context) ? 12 : 18.0,
                    fontFamily: Montserrat_Medium,
                  ),
                ),
                TextSpan(
                  text: mIsMandatory ? "*" : "",
                  style: TextStyle(
                    color: Colors.red,
                    fontFamily: Montserrat_Medium,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: mValueText,
                  style: TextStyle(
                    color: HexColor('#231F20'),
                    fontSize: Responsive.isMobile(context) ? 12 : 18.0,
                    fontFamily: Montserrat_Medium,
                  ),
                ),
                TextSpan(
                  text: mIsMandatory ? "*" : "",
                  style: TextStyle(
                    color: Colors.red,
                    fontFamily: Montserrat_Medium,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
