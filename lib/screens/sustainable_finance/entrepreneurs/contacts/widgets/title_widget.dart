import 'package:flutter/material.dart';
import '../../../../../utils/hex_color.dart';
import '../../../../../utils/responsive.dart';
import '../../../../../utils/styles.dart';

class ContactMomentUpdateTitlesWidget extends StatelessWidget {
  final bool mIsMandatory;
  final String mKeyText;

  const ContactMomentUpdateTitlesWidget({
    Key? key,
    required this.mIsMandatory,
    required this.mKeyText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
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
    );
  }
}
