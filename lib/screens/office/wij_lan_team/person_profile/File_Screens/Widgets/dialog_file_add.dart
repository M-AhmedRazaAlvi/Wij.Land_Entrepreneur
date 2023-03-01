import 'package:flutter/material.dart';
import 'package:wij_land/screens/office/wij_lan_team/person_profile/File_Screens/Widgets/add_media_file_dialog.dart';

import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../widgets/add_text_button_widget.dart';

class DialogAddFile extends StatelessWidget {
  const DialogAddFile({
    Key? key,
  }) : super(key: key);

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
                      text: "Select a file type",
                      size: 30,
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
                  text: "Files",
                  size: 20,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AddMediaFileDialog(text: "Add MediaFiles");
                            });
                      },
                      child: Row(
                        children: const [
                          Icon(Icons.camera_alt),
                          Text(
                            "Media",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    AddTextButtonWidget(
                      text: "Other",
                      colors: Colors.white,
                      onPress: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AddMediaFileDialog(text: "Add OtherFiles");
                            });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: const [
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
