import 'package:flutter/material.dart';
import 'package:wij_land/screens/farm_networks/projects/widgets/external_add_project_widget.dart';
import 'package:wij_land/screens/farm_networks/projects/widgets/wijLand_add_proj_widget.dart';

import '../../../../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../../../../utils/functions.dart';
import '../../../../app_common_widgets/real_check_box_widget.dart';
import '../../../office/widgets/add_text_button_widget.dart';
class AddProjectDialog extends StatefulWidget {
  const AddProjectDialog({ Key? key }) : super(key: key);

  @override
  State<AddProjectDialog> createState() => _AddProjectDialogState();
}

class _AddProjectDialogState extends State<AddProjectDialog> {
  bool first = true, second=false;

  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getWidth(context),
      child: SingleChildScrollView(
        child: AlertDialog(
          title:Container(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
               [
                 Padding(
                   padding: const EdgeInsets.only(left: 40),
                   child: Row(
                     
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children:  [
                       CustomText(
                         text: "Add project",
                         size: 20,
                         weight: FontWeight.bold,
                         color: Colors.black,
                         ),
                         InkWell(
                           onTap:(){},
                           child: IconButton(onPressed: (){}, icon: Icon(Icons.close,size: 20,)))
                     ],
                   ),
                 ),
                 Wrap(
                   children: [
                     RealCheckBoxWidget(
                       value: first,
                        onChanged: (value){
                          setState(() {
                            first = true;
                            second = false;
                          });
                        }, 
                        Labeltext: "Wij.land Project"),
                        RealCheckBoxWidget(
                       value: second,
                        onChanged: (value){
                          setState(() {
                            first = false;
                            second = true;
                          });
                        }, 
                        Labeltext: "External Project"),
                   ],
                 ),
               
               ],
               ) ),
               content: Container(
                 width: MediaQuery.of(context).size.width*0.6,
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    first? WijLandAddProjWidget(): Container(),
                    second?ExternalAddProject():Container()
                  ],
                  ),
 ),
   actions: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AddTextButtonWidget(
                    text: "Cancel",
                    colors: Colors.white60,
                    onPress: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  AddTextButtonWidget(
                    text: "Save",
                    colors: Colors.yellow,
                    onPress: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          ],
        )
      ),
      
    );
  }
}