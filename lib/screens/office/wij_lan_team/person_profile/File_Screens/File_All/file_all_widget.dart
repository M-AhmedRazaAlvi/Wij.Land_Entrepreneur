import 'package:flutter/material.dart';

import '../../../../../../app_common_widgets/custom_text.dart';
import '../Widgets/dialog_all_widget.dart';

class FileAllWidget extends StatefulWidget {
  const FileAllWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<FileAllWidget> createState() => _FileAllWidgetState();
}

class _FileAllWidgetState extends State<FileAllWidget> {
  bool ischecked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black12))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 20),
          Checkbox(
            checkColor: Colors.white,
            activeColor: Colors.green,
            shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(5)),
            value: ischecked,
            onChanged: (val) {
              setState(
                () {
                  ischecked = !ischecked;
                },
              );
            },
          ),
          const SizedBox(width: 20),
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.file_present,
            ),
          ),
          const SizedBox(width: 10),
          const Expanded(flex: 1, child: CustomText(text: "test-10mb.bin")),
          const Expanded(flex: 1, child: CustomText(text: "Julie Solano")),
          const Expanded(flex: 1, child: CustomText(text: "Julie Solano")),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const DialogAllWidget();
                          });
                    },
                    icon: const Icon(Icons.info_outline)),
                const SizedBox(
                  width: 10,
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
