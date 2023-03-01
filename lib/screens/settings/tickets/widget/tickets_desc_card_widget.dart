import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../app_common_widgets/on_hover.dart';
import '../../../../routes/routes.dart';
import '../../../../utils/controller.dart';
import '../../../../utils/responsive.dart';
import '../../../../utils/styles.dart';
import '../../../reporting/kpi/widget/kpi_delete_dialog_widget.dart';

class TicketsDescriptionCardWidget extends StatefulWidget {
  final String? title,counts;

    const TicketsDescriptionCardWidget(this.title, this.counts,  {Key? key,}) : super(key: key);

  @override
  State<TicketsDescriptionCardWidget> createState() => _TicketsDescriptionCardWidgetState();
}

class _TicketsDescriptionCardWidgetState extends State<TicketsDescriptionCardWidget> {

  @override
  Widget build(BuildContext context) {
    return
       Container(
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomText(
                      text: 'User Info'.tr(),
                      size: !Responsive.isDesktop(context)?18:28,color:darkBlue,weight: FontWeight.w300,),
                  ),
                  SizedBox(width: 4,),
                  OnHover(
                    builder: (hover) {
                      return Card(
                        elevation: 1,
                        color: hover?Colors.green:Colors.white,
                        shape:  RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: IconButton(
                          onPressed: () {
                            navigationController.navigateTo(updateTicketsDetailsPageRoute);

                          }, icon: FaIcon(
                          FontAwesomeIcons.pen,
                          color:hover?Colors.white: Colors.black45,
                          size: 16,
                        ),

                        ),
                      );
                    }
                  ),

                ],
              ),
               CustomText(text: 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36'.tr(),size:14,color:ivoryBlack,weight: FontWeight.w300,),
           SizedBox(),
            Align(
              alignment: Alignment.topLeft,
              child: CustomText(
                text: 'Description'.tr(),
                size:!Responsive.isDesktop(context)?18:28,color:darkBlue,weight: FontWeight.w300,),
            ),

                CustomText(text: 'Test Ticket issue for demo purposes'.tr(),size:14,color:ivoryBlack,weight: FontWeight.w300,),
            ],
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
            child:  Text('Delete'.tr()), value: '1'),

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
