

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AllFileCubeScreen extends StatelessWidget {
  const AllFileCubeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        for(int i=0;i<6;i++)
      Padding(
        padding: const EdgeInsets.all( 8.0),
        child: InkWell(
          onTap: (){},
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Container(
                width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff9E9E9E),width: 1.3),
                    borderRadius: BorderRadius.circular(4),

                  ),
                  child: Icon(FontAwesomeIcons.filePdf,size: 20,)),
              Text('textFile$i.pdf',softWrap: true,maxLines:2,overflow: TextOverflow.ellipsis,),
            ],
          ),
        ),
      ),
      ],
    );
  }
}
