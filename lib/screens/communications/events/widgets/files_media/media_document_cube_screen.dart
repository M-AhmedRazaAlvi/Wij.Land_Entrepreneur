import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MediaDocumentCubeScreen extends StatelessWidget {
  MediaDocumentCubeScreen({Key? key}) : super(key: key);

  final List titleList = [
    'Advisory \nReport',
    'Nature \nManagement\n Plan',
    'Analysis/\nResult',
    'Interview \nReport',
    'Other'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Wrap(
          spacing: 9,
          children: [
            for (int i = 0; i < 5; i++)
              InkWell(
                onTap: () {},
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.solidFolder,
                      color: Color(0xff82C454),
                      size: 120.0,
                    ),
                    Text(
                      titleList[i],
                      softWrap: true,
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              )
          ],
        ),
        Wrap(
          spacing: 8,
          runSpacing: 6,
          children: [
            for (int i = 0; i < 6; i++)
              InkWell(
                onTap: () {},
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xff9E9E9E), width: 1.3),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Icon(
                          FontAwesomeIcons.filePdf,
                          size: 20,
                        )),
                    Text(
                      'textFile$i.pdf',
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ],
    );
  }
}
