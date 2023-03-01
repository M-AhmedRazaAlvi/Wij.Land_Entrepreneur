import 'package:flutter/material.dart';

import '../../../../app_common_widgets/on_hover.dart';
import '../../../../utils/styles.dart';

class OnEditButton extends StatelessWidget {
  final String text;
  final Color colors;
  final onPress;
  const OnEditButton({
    Key? key,
    required this.text,
    required this.colors,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: OnHover(
        builder: (hover) => ButtonTheme(
          minWidth: 80,
          height: 40,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 2,
                backgroundColor: colors,
                padding: EdgeInsets.symmetric(vertical: 2),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            onPressed: onPress,
            child: Text(
              text,
              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
          ),
        ),
      ),
    );
  }
}
