import 'package:flutter/material.dart';
import 'package:wij_land/screens/office/office_programes/Widgets/on_hover_button_widget.dart';

import '../../../../app_common_widgets/animated_search.dart';
import '../../../../app_common_widgets/icon_text_container.dart';

class AddIconsAndDialogBox extends StatefulWidget {
  const AddIconsAndDialogBox({
    Key? key,
    required this.addText,
    required this.onTap,
    this.icons,
    this.onIconTap,
  }) : super(key: key);
  final String addText;
  final Function()? onTap;
  final icons;
  final Function()? onIconTap;

  @override
  State<AddIconsAndDialogBox> createState() => _AddIconsAndDialogBoxState();
}

class _AddIconsAndDialogBoxState extends State<AddIconsAndDialogBox> {
  List<bool> checks = [];

  bool checkAll = false;
  bool filterTapped = false;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.end,
      children: [
        AnimatedSearchWidget(),
        SizedBox(width: 5),
        OnHoverButtonWidget(
          icons: widget.icons,
          onTap: widget.onIconTap,
        ),
        SizedBox(width: 5),
        IconAndTextContainer(
          onTap: widget.onTap,
          addText: widget.addText,
        )
      ],
    );
  }
}
