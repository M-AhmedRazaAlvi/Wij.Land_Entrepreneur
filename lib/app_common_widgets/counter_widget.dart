import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wij_land/app_common_widgets/on_hover.dart';

import '../utils/styles.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({
    Key? key,
    required this.count,
    required this.onAddTap,
    required this.onCloseTap,
  }) : super(key: key);

  final count;
  final dynamic onAddTap;
  final dynamic onCloseTap;

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.black26)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("${widget.count}", style: TextStyle(fontFamily: Montserrat_Medium),),
          Column(
            children: [
              OnHover(
                builder: (hover) => InkWell(
                  onTap: widget.onAddTap,
                  child: Icon(
                    Icons.arrow_drop_up_sharp,
                    size: 18,
                  ),
                ),
              ),
              OnHover(
                builder: (hover) => InkWell(
                  onTap: widget.onCloseTap,
                  child: Icon(
                    Icons.arrow_drop_down_sharp,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
