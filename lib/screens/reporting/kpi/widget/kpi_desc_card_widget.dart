import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wij_land/screens/reporting/kpi/widget/kpi_delete_dialog_widget.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../app_common_widgets/icons_hover_buttons.dart';
import '../../../../utils/responsive.dart';
import '../../../../utils/styles.dart';
import 'kpi_edit_dialog_widget.dart';
class KpiDescriptionCardWidget extends StatefulWidget {
  final String? title,counts;

    const KpiDescriptionCardWidget(this.title, this.counts,  {Key? key,}) : super(key: key);

  @override
  State<KpiDescriptionCardWidget> createState() => _KpiDescriptionCardWidgetState();
}

class _KpiDescriptionCardWidgetState extends State<KpiDescriptionCardWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 300,
        padding: EdgeInsets.only(top: 8.0,right: 12,left: 12),
          child: Card(
            elevation: 2.0,
            color:Colors.white,
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 4.0,left: 20.0,right: 20.0,bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomText(
                      text: 'Description',
                      size: !Responsive.isDesktop(context)?18:28,color:darkBlue,weight: FontWeight.w300,),
                  ),
                  SizedBox(width: 4,),
                  IconHoverButton(icons: FontAwesomeIcons.pen,onPress: () {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return EditKpiDialogWidget();
                        });
                  }),
                  SizedBox(width: 4,),
                  IconHoverButton(icons: FontAwesomeIcons.ellipsisV,  onPress: () {
                    showPopupMenu();
                  }),
                ],
              ),
               CustomText(text: 'Sum of farmers that are active in a pilot projects. This is the sum of people marked to be a farmers who are mentioned as **project responsible** of that farm in at least 1 project that the farm is actively participating in',size:14,color:ivoryBlack,weight: FontWeight.w300,),
           SizedBox(),
            Align(
              alignment: Alignment.topLeft,
              child: CustomText(
                text: 'EXPRESSION',
                size:!Responsive.isDesktop(context)?18:28,color:darkBlue,weight: FontWeight.w300,),
            ),
                SizedBox(),

                CustomText(text: 'Sum of persons for which (1) the checkbox Farmer is checked, and (2) who are marked **project responsible** for at least one project that their farm is actively participating in.',size: 14,color:ivoryBlack,weight: FontWeight.w300,),
            ],
            ),
          ),
        ),
      ),
    );
  }
  showPopupMenu(){
    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(25.0,!Responsive.isDesktop(context)?380: 80.0, 20.0, 0.0),  //position where you want to show the menu on screen
      items: [
        PopupMenuItem<String>(
            child: const Text('Delete'), value: '1'),

      ],
      elevation: 8.0,
    ).then((String? itemSelected) {

      if (itemSelected == null) return;

      if(itemSelected == "1"){
        //code here
        showDialog(
            context: context,
            builder: (_) {
              return DeleteKpiDialogWidget();
            });
      }
    });
  }
}
