import 'package:flutter/material.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../app_common_widgets/real_dropdown_widget.dart';
import '../../../../utils/functions.dart';
import '../../../../utils/styles.dart';
import '../../../office/widgets/add_text_button_widget.dart';

class AddVisualizeFarmDialogWidget extends StatefulWidget {
  const AddVisualizeFarmDialogWidget({Key? key}) : super(key: key);

  @override
  State<AddVisualizeFarmDialogWidget> createState() =>
      _AddVisualizeFarmDialogWidgetState();
}

class _AddVisualizeFarmDialogWidgetState
    extends State<AddVisualizeFarmDialogWidget> {

  var farmType = 'Select Farm',
      farmList = [
        'Select Farm',
        'Farm of Ajay Jadeja',
        'Farm of Donald Roa,Zevenbergen',
        'Farm of Elliot Mass',
        'Farm of FLeurette Goode',
        'Farm of Freya Fionannian'
      ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getWidth(context),
      child: SingleChildScrollView(
        child: AlertDialog(
          title: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Chose",
                      size: 26,
                      weight: FontWeight.w600,
                      color: ivoryBlack,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.close,
                        size: 21,
                        color: dimGrey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Farm",
                  size: 15,
                  color: ivoryBlack,
                  weight: FontWeight.w400,
                ),
                SizedBox(height: 6),

                    RealDropDownWidget(value: farmType,onChanged: (va){
                      setState(() {farmType=va;});
                    },items:farmList.map<DropdownMenuItem<String>>((String values){
                      return DropdownMenuItem<String>(value:values,child:CustomText(text:values,size: 15,weight: FontWeight.w300,color: mediumGrey,)); }).toList(),

                ),
              ],
            ),
          ),
          actions:  [
            Padding(
              padding: EdgeInsets.only(left: 30,right: 30, bottom: 30),
              child: AddTextButtonWidget(text: 'Add', colors: Colors.yellow,onPress: (){
                Navigator.of(context).pop(farmType);

              },),
            ),
          ],
        ),
      ),
    );
  }
}
