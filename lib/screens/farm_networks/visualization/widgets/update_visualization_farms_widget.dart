import 'package:flutter/material.dart';
import 'package:wij_land/screens/farm_networks/visualization/widgets/left_update_widget.dart';
import 'package:wij_land/screens/farm_networks/visualization/widgets/right_update_widget.dart';

import '../../../../utils/responsive.dart';


class UpdateVisualizeFarmWidget extends StatefulWidget {
  const UpdateVisualizeFarmWidget({Key? key}) : super(key: key);

  @override
  State<UpdateVisualizeFarmWidget> createState() => _UpdateVisualizeFarmWidgetState();
}

class _UpdateVisualizeFarmWidgetState extends State<UpdateVisualizeFarmWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Flex(
        crossAxisAlignment: CrossAxisAlignment.start,
        direction: !Responsive.isDesktop(context)?Axis.vertical:Axis.horizontal,
        mainAxisSize: MainAxisSize.min,
        children: const [
          LeftUpdateWidget(),
          SizedBox(width: 12,),
          RightUpdateWidget(),
        ],
      ),
    );
  }
}
