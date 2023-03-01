import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Member/dialogs/advisor_member.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Member/dialogs/contractor_member.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Member/dialogs/employee_member.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Member/dialogs/farmer_widget.dart';

import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../app_common_widgets/real_check_box_widget.dart';
import '../../../../../../app_common_widgets/text_widget.dart';
import '../../../../../office/widgets/add_text_button_widget.dart';

class AddMembersDialog extends StatefulWidget {
  const AddMembersDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<AddMembersDialog> createState() => _AddMembersDialogState();
}

class _AddMembersDialogState extends State<AddMembersDialog> {
  final TextEditingController fName = TextEditingController(),
      lName = TextEditingController(),
      email = TextEditingController(),
      phone = TextEditingController(),
      phoneHome = TextEditingController(),
      mailAddress = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    fName.dispose();
    lName.dispose();
    email.dispose();
    phone.dispose();
    phoneHome.dispose();
    mailAddress.dispose();
  }

  bool checkedAddress = false;

  bool first = true, second = false, third = false, fourth = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
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
                      text: "Add Person",
                      size: 30,
                      weight: FontWeight.bold,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.close,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                CustomText(
                  text: "Basic Information",
                  size: 20,
                  weight: FontWeight.bold,
                ),
                SizedBox(
                  height: 25,
                ),
                DottedBorder(
                  padding: EdgeInsets.all(25),
                  child: Icon(Icons.add),
                )
              ],
            ),
          ),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                const CustomText(text: "First Name"),
                const SizedBox(
                  height: 15,
                ),
                TextWidgetField(
                  controller: fName,
                ),
                const SizedBox(
                  height: 15,
                ),
                const CustomText(text: "Last Name"),
                const SizedBox(
                  height: 15,
                ),
                TextWidgetField(
                  controller: lName,
                ),
                const SizedBox(
                  height: 15,
                ),
                const CustomText(text: "Email Address"),
                const SizedBox(
                  height: 15,
                ),
                TextWidgetField(controller: email),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(text: "Phone No(Mobile)"),
                          SizedBox(
                            height: 15,
                          ),
                          TextWidgetField(
                            controller: phone,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(text: "Phone No(Home)"),
                          SizedBox(
                            height: 15,
                          ),
                          TextWidgetField(controller: phoneHome),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const CustomText(text: "Mailing Address"),
                const SizedBox(
                  height: 15,
                ),
                TextWidgetField(controller: mailAddress),
                const SizedBox(
                  height: 15,
                ),
                RealCheckBoxWidget(
                  value: checkedAddress,
                  onChanged: (value) {
                    setState(() {
                      checkedAddress = value ?? false;
                    });
                  },
                  Labeltext: 'Use Farm address as post address for this person',
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomText(text: "Roles", weight: FontWeight.bold),
                const SizedBox(
                  height: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RealCheckBoxWidget(
                        value: first,
                        onChanged: (value) {
                          setState(() {
                            first = true;
                          });
                        },
                        Labeltext: "Farmer"),
                    RealCheckBoxWidget(
                        value: second,
                        onChanged: (value) {
                          setState(() {
                            second = !second;
                          });
                        },
                        Labeltext: "Contractor"),
                    RealCheckBoxWidget(
                        value: third,
                        onChanged: (value) {
                          setState(() {
                            third = !third;
                          });
                        },
                        Labeltext: "Employee"),
                    RealCheckBoxWidget(
                        value: fourth,
                        onChanged: (value) {
                          setState(() {
                            fourth = !fourth;
                          });
                        },
                        Labeltext: "Advisor"),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                if (first) FarmMemberWidget(),
                second ? ContractorMemberWidget() : Container(),
                third ? EmployeeMemberWidget() : Container(),
                fourth ? AdvisorMemberWidget() : Container(),
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
                    text: "Add Person",
                    colors: Colors.yellow,
                    onPress: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
