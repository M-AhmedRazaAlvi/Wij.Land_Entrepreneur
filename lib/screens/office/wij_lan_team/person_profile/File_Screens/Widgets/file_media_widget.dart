
import 'package:flutter/material.dart';

import '../../../../../../app_common_widgets/custom_text.dart';

class FileMediaWidget extends StatefulWidget {
  const FileMediaWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<FileMediaWidget> createState() => _FileMediaWidgetState();
}

class _FileMediaWidgetState extends State<FileMediaWidget> {
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
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.horizontal_distribute)),
        ],
      ),
    );
  }
}
