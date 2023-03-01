
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../app_common_widgets/animated_search.dart';
import '../../../../app_common_widgets/custom_text.dart';
import '../../../../app_common_widgets/on_hover.dart';
import '../../../../utils/styles.dart';
import '../../../office/widgets/add_button.dart';

class UserScreenButton extends StatelessWidget {
  const UserScreenButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomText(
          text: 'Users'.tr(),
          color: third,
          size: 40,
          weight: FontWeight.w600,
        ),
        Expanded(child: Container()),
        AnimatedSearchWidget(),
        SizedBox(
          width: 4,
        ),
        OnHover(
          builder: (hover) => Card(
            elevation: 2.0,
            color: hover ? Colors.green : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: IconButton(
              onPressed: () {
                //  showPopupMenu();
              },
              icon: FaIcon(
                //Icons.filter_alt_rounded,
                FontAwesomeIcons.filter,
                color: hover ? Colors.white : Colors.black54,
                size: 16,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 4,
        ),
        ButtonWithAddIcon(
          text: 'Add User'.tr(),
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) {
                  return Text("");
                 // return AddUsedrDialogWidget();
                });
          },
        ),
      ],
    );
  }
}
