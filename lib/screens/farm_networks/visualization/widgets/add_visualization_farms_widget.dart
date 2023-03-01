import 'package:flutter/material.dart';
import 'package:wij_land/screens/farm_networks/visualization/widgets/right_side_widget.dart';

import '../../../../utils/responsive.dart';
import 'left_side_widget.dart';

class AddVisualizeFarmWidget extends StatefulWidget {
  const AddVisualizeFarmWidget({Key? key}) : super(key: key);

  @override
  State<AddVisualizeFarmWidget> createState() => _AddVisualizeFarmWidgetState();
}

class _AddVisualizeFarmWidgetState extends State<AddVisualizeFarmWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Flex(
        crossAxisAlignment: CrossAxisAlignment.start,
        direction: !Responsive.isDesktop(context)?Axis.vertical:Axis.horizontal,
        mainAxisSize: MainAxisSize.min,
        children: const [
          LeftSideWidget(),
          SizedBox(width: 12,),
          RightSideWidget(),
        ],
      ),
    );
  }
}
