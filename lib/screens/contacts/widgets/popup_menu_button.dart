import 'package:flutter/material.dart';
import 'package:wij_land/utils/styles.dart';

import '../../../app_common_widgets/custom_text.dart';
import '../../../app_common_widgets/on_hover.dart';
import '../../../utils/responsive.dart';
import '../../../utils/styles.dart';

class PopUpMenuButtonWidget extends StatelessWidget {
  final Function()? mOnDeleteTap, mOnEditTap, mOnTapDownloadCSV;
  final bool? isEntrepreneur;

  const PopUpMenuButtonWidget({
    Key? key,
    required this.mOnDeleteTap,
    this.mOnEditTap,
    this.isEntrepreneur = false,
    this.mOnTapDownloadCSV,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      // color: Colors.black,

      child: OnHover(
        builder: (hover) => SizedBox(
          height: !Responsive.isDesktop(context) ? 30 : 50,
          width: !Responsive.isDesktop(context) ? 30 : 50,
          child: Card(
            color: hover ? hoverColor : Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Icon(
              Icons.more_vert,
              color: hover ? Colors.white : Colors.black,
              size: !Responsive.isDesktop(context) ? 15 : 20,
            ),
          ),
        ),
      ),
      onSelected: (value) async {},
      itemBuilder: (context) => [
        PopupMenuItem(
            value: 1,
            onTap: mOnDeleteTap,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 2, 8, 2),
                  child: Icon(
                    Icons.delete,
                    color: Colors.greenAccent,
                  ),
                ),
                CustomText(text: isEntrepreneur! ? "Delete" : 'Remove Member')
              ],
            )),
        PopupMenuItem(
            value: 2,
            onTap: mOnTapDownloadCSV,
            child: Row(
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 2, 8, 2),
                  child: Icon(
                    Icons.download,
                    color: Colors.greenAccent,
                  ),
                ),
                CustomText(text: 'Download CSV')
              ],
            )),
        PopupMenuItem(
          value: 3,
          onTap: mOnEditTap,
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(2, 2, 8, 2),
                child: Icon(
                  Icons.edit,
                  color: Colors.greenAccent,
                ),
              ),
              CustomText(text: isEntrepreneur! ? "Bulk Edit" : 'Edit Role')
            ],
          ),
        ),
      ],
    );
  }
}

class PopUpMenuEntreprenuerButtonWidget extends StatelessWidget {
  final Function()? mOnDeleteTap, mOnEditTap;

  const PopUpMenuEntreprenuerButtonWidget({
    Key? key,
    required this.mOnDeleteTap,
    this.mOnEditTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      // color: Colors.black,

      child: OnHover(
        builder: (hover) => SizedBox(
          height: !Responsive.isDesktop(context) ? 30 : 50,
          width: !Responsive.isDesktop(context) ? 30 : 50,
          child: Card(
            color: hover ? hoverColor : Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Icon(
              Icons.more_vert,
              color: hover ? Colors.white : Colors.black,
              size: !Responsive.isDesktop(context) ? 15 : 20,
            ),
          ),
        ),
      ),
      onSelected: (value) async {},
      itemBuilder: (context) => [
        /*  PopupMenuItem(
            value: 1,
            onTap: mOnDeleteTap,
            child: Row(
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 2, 8, 2),
                  child: Icon(
                    Icons.delete,
                    color: Colors.greenAccent,
                  ),
                ),
                CustomText(text: "Delete")
              ],
            )),*/
        PopupMenuItem(
            value: 2,
            onTap: mOnEditTap,
            child: Row(
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 2, 8, 2),
                  child: Icon(
                    Icons.download,
                    color: Colors.greenAccent,
                  ),
                ),
                CustomText(text: 'Download CSV')
              ],
            )),
      ],
    );
  }
}

class PopUpMenuFarmSupplierButtonWidget extends StatelessWidget {
  final Function()? mOnEmailTap, mOnDownloadTap;

  const PopUpMenuFarmSupplierButtonWidget({
    Key? key,
    required this.mOnEmailTap,
    this.mOnDownloadTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      // color: Colors.black,

      child: OnHover(
        builder: (hover) => SizedBox(
          height: !Responsive.isDesktop(context) ? 30 : 50,
          width: !Responsive.isDesktop(context) ? 30 : 50,
          child: Card(
            color: hover ? hoverColor : Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Icon(
              Icons.more_vert,
              color: hover ? Colors.white : Colors.black,
              size: !Responsive.isDesktop(context) ? 15 : 20,
            ),
          ),
        ),
      ),
      onSelected: (value) async {},
      itemBuilder: (context) => [
        PopupMenuItem(
            value: 1,
            onTap: mOnEmailTap,
            child: Row(
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 2, 8, 2),
                  child: Icon(
                    Icons.delete,
                    color: Colors.greenAccent,
                  ),
                ),
                CustomText(text: "Email")
              ],
            )),
        PopupMenuItem(
            value: 2,
            onTap: mOnDownloadTap,
            child: Row(
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 2, 8, 2),
                  child: Icon(
                    Icons.download,
                    color: Colors.greenAccent,
                  ),
                ),
                CustomText(text: 'Download CSV')
              ],
            )),
      ],
    );
  }
}
