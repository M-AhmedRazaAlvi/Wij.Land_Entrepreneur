import 'package:flutter/material.dart';

import '../../../../../../../../../utils/styles.dart';
import '../../../../../../app_common_widgets/on_hover.dart';

class ChangeIconTextButton extends StatelessWidget {
  final String text;
  final Color colors;
  final onPress;
  final IconData icon;
  const ChangeIconTextButton({
    Key? key,
    required this.text,
    required this.colors,
    this.onPress,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: OnHover(
        builder: (hover) => ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: colors,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          ),
          onPressed: onPress,
          child: Row(
            children: [
              Icon(icon),
              Text(
                text,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
