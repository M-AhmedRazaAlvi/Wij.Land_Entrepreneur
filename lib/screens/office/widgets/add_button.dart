import 'package:flutter/material.dart';

import '../../../../utils/responsive.dart';
import '../../../../utils/styles.dart';
import '../../../app_common_widgets/on_hover.dart';

class ButtonWithAddIcon extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color? color;

  const ButtonWithAddIcon({
    Key? key,
    required this.text,
    this.onPressed,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnHover(
      builder: (hover) {
        return SizedBox(
          height: 44,
          child: !Responsive.isDesktop(context)
              ? ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    primary: hover ? lightGreen : yellow,
                    elevation: hover ? 2 : 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Icon(
                    Icons.add,
                    color: hover ? Colors.white : dark,
                    size: 18.0,
                  ),
                )
              : ElevatedButton.icon(
                  icon: Icon(
                    Icons.add,
                    color: hover ? Colors.white : dark,
                    size: 18.0,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: hover ? lightGreen : yellow,
                    elevation: hover ? 2 : 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: onPressed,
                  label: Text(
                    text,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: hover ? Colors.white : dark,
                    ),
                  ),
                ),
        );
      },
    );
  }
}
