import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../app_common_widgets/text_widget.dart';
import '../../../widgets/add_text_button_widget.dart';
import '../../../widgets/comment_text.dart';

class AddPersolDialogWidget extends StatefulWidget {
  const AddPersolDialogWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<AddPersolDialogWidget> createState() => _AddPersolDialogWidgetState();
}

class _AddPersolDialogWidgetState extends State<AddPersolDialogWidget> {
  bool _sampler = false;
  final TextEditingController fName = TextEditingController(),
      lName = TextEditingController(),
      email = TextEditingController(),
      phone = TextEditingController(),
      phoneHome = TextEditingController(),
      address = TextEditingController(),
      date = TextEditingController(),
      comment = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    fName.dispose();
    lName.dispose();
    email.dispose();
    phone.dispose();
    phoneHome.dispose();
    address.dispose();
    date.dispose();
    comment.dispose();
  }

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
                    Expanded(
                      child: CustomText(
                        text: "Add Person",
                        size: 40,
                        weight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.close,
                        size: 40,
                      ),
                    ),
                  ],
                ),
                CustomText(
                  text: "Basic Information",
                  size: 30,
                  weight: FontWeight.bold,
                ),
              ],
            ),
          ),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 40),
                  child: DottedBorder(
                    color: Colors.black38,
                    strokeWidth: 2,
                    padding: const EdgeInsets.all(25),
                    child: const Icon(
                      Icons.add,
                      size: 40,
                      color: Colors.black38,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
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
                SizedBox(
                  height: 15,
                ),
                TextWidgetField(
                  controller: email,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomText(text: "Phone No(Mobile)"),
                            const SizedBox(
                              height: 15,
                            ),
                            TextWidgetField(
                              controller: phone,
                            ),
                          ],
                        )),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomText(text: "Phone No(Home)"),
                            const SizedBox(
                              height: 15,
                            ),
                            TextWidgetField(
                              controller: phoneHome,
                            ),
                          ],
                        )),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const CustomText(text: "Mailing Address"),
                const SizedBox(
                  height: 15,
                ),
                TextWidgetField(
                  controller: address,
                ),
                const SizedBox(height: 15),
                const CustomText(
                  text: "Employee Details",
                  weight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 15,
                ),
                const CustomText(
                  text: "Organization Name",
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(5)),
                  child: const CustomText(text: "Wij.land"),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      activeColor: Colors.green,
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(5)),
                      value: _sampler,
                      onChanged: (value) {
                        setState(() {
                          _sampler = value ?? false;
                        });
                      },
                    ),
                    const CustomText(text: "Sampler"),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const CustomText(
                  text: "Conneted to WijLand Since",
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2001),
                            lastDate: DateTime(2023))
                        .then((d) {
                      debugPrint("$d");
                      if (d != null) {
                        setState(() {
                          date.text = d.toString().split(" ")[0];
                        });
                      }
                    });
                  },
                  child: TextWidgetField(
                    controller: date,
                    enabled: false,
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const CustomText(
                  text: "Comments",
                ),
                const SizedBox(
                  height: 15,
                ),
                CommentTextField(
                  controller: comment,
                )
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
                    colors: Colors.white,
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
