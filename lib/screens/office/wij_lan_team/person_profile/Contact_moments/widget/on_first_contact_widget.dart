import 'package:flutter/material.dart';

import '../../../../widgets/information_text_widget.dart';

class OnFirstContactWidget extends StatelessWidget {
  const OnFirstContactWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Wrap(
        spacing: 200,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              InformativeTextWidget(
                textFirst: "Attendess:\t\t",
                textSecond: "Gred McAlister",
              ),
              InformativeTextWidget(
                textFirst: "Subject:\t\t",
                textSecond: "928798379",
              ),
              InformativeTextWidget(
                textFirst: "Kind of contact:\t\t",
                textSecond: "98327863379",
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              InformativeTextWidget(
                textFirst: "Name:\t\t",
                textSecond: "Gerd McAlister",
              ),
              InformativeTextWidget(
                textFirst: "Farm name:\t\t",
                textSecond: "928798379",
              ),
              InformativeTextWidget(
                textFirst: "Project name:\t\t",
                textSecond: "98327863379",
              ),
              InformativeTextWidget(
                textFirst: "Organization name:\t\t",
                textSecond: 'Limburg',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
