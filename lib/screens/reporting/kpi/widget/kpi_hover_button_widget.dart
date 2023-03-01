

import 'package:flutter/material.dart';

import '../../../../app_common_widgets/on_hover.dart';

class KpiHoverButtonWidget extends StatelessWidget {
  KpiHoverButtonWidget({
    Key? key,
    required this.icon,
    required this.onPress
  }) : super(key: key);
  IconData icon;
  final onPress;

  @override
  Widget build(BuildContext context) {
    return OnHover(
        builder: (hover) {
          return Card(
            elevation: 0,
            semanticContainer: false,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
                side: BorderSide(
                    width: 0.5, color: Colors.black26)
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              color: Colors.white,
              hoverColor: Colors.green,

              onPressed:onPress,
              icon: Icon(
                icon,
                color: hover ? Colors.white : Colors
                    .black54,
                size: 16,
              ),
            ),
          );
        }
    );
  }
}
