import 'package:flutter/material.dart';

import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../app_common_widgets/text_widget.dart';
import '../../../../widgets/add_text_button_widget.dart';

class DialogAllWidget extends StatefulWidget {
  const DialogAllWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<DialogAllWidget> createState() => _DialogAllWidgetState();
}

class _DialogAllWidgetState extends State<DialogAllWidget> {
  final TextEditingController fName = TextEditingController(),
      lName = TextEditingController(),
      email = TextEditingController(),
      address = TextEditingController(),
      date = TextEditingController(),
      comment = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    fName.dispose();
    lName.dispose();
    email.dispose();
    address.dispose();
    date.dispose();
    comment.dispose();
  }

  double value = 0;
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
                    const CustomText(
                      text: "Edit MediaFiles",
                      size: 40,
                      weight: FontWeight.bold,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.close,
                        size: 40,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.file_present,
                      size: 80,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: CustomText(text: "test-10mb.bin"),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            margin: const EdgeInsets.all(20),
                            child: LinearProgressIndicator(
                              backgroundColor: Colors.grey,
                              color: Colors.green,
                              minHeight: 5,
                              value: value,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustomText(
                  text: "Date",
                ),
                const SizedBox(height: 10),
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
              ],
            ),
          ),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
                  text: "Add Tags",
                  size: 40,
                  weight: FontWeight.bold,
                ),
                const SizedBox(height: 10),
                const CustomText(
                  text: "These tags will apply to all files",
                ),
                const SizedBox(height: 15),
                const CustomText(text: "Farm"),
                const SizedBox(
                  height: 10,
                ),
                TextWidgetField(
                  controller: fName,
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustomText(text: "Project"),
                const SizedBox(
                  height: 10,
                ),
                TextWidgetField(
                  controller: lName,
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustomText(text: "Organization"),
                const SizedBox(
                  height: 10,
                ),
                TextWidgetField(
                  controller: email,
                ),
                const CustomText(text: "Event"),
                const SizedBox(
                  height: 10,
                ),
                TextWidgetField(
                  controller: address,
                ),
                const SizedBox(height: 15),
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
                    colors: Colors.black12,
                    onPress: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  AddTextButtonWidget(
                    text: "UpDate",
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
