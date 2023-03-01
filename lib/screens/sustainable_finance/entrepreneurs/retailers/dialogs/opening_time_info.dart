import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wij_land/utils/styles.dart';

import '../../../../../app_common_widgets/custom_text.dart';
import '../../../../../utils/functions.dart';
import '../../../../../utils/responsive.dart';

class OpeningTimeInfo extends StatefulWidget {
  final String dayText;
  final onTapStart;
  final onTapEnd;
  final String textStart;
  final String textEnd;

  const OpeningTimeInfo({
    Key? key,
    required this.dayText,
    this.onTapStart,
    this.onTapEnd,
    required this.textStart,
    required this.textEnd,
  }) : super(key: key);

  @override
  State<OpeningTimeInfo> createState() => _OpeningTimeInfoState();
}

class _OpeningTimeInfoState extends State<OpeningTimeInfo> {
  List<TimeOfDay> _timeBegin = [];
  List<TimeOfDay> _timeEnd = [];
  List<String> _timeStart = [];
  List<String> _timeFinish = [];

  void _selectBeginTime(int i) async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _timeBegin[i],
    );
    if (newTime != null) {
      setState(() {
        _timeStart[i] = newTime.format(context);
      });
    }
  }

  void _selectEndTime(int i) async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _timeEnd[i],
    );
    if (newTime != null) {
      setState(() {
        _timeFinish[i] = newTime.format(context);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 6; i++) {
      _timeBegin.add(TimeOfDay(hour: 7, minute: 15));
      _timeEnd.add(TimeOfDay(hour: 7, minute: 15));
    }
    _timeStart = List.filled(6, '');
    _timeFinish = List.filled(6, '');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    for (int i = 0; i < 6; i++) {
      _timeStart[i] = _timeBegin[i].format(context);
      _timeFinish[i] = _timeEnd[i].format(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: !Responsive.isDesktop(context)
          ? getWidth(context)
          : getWidth(context) / 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(flex: 2, child: CustomText(text: widget.dayText)),
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: widget.onTapStart,
              child: TimeStartWidget(
                text: widget.textStart,
              ),
            ),
          ),
          SizedBox(
            width: !Responsive.isDesktop(context) ? 10 : 20,
          ),
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: widget.onTapEnd,
              child: TimeStartWidget(
                text: widget.textEnd,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TimeStartWidget extends StatelessWidget {
  final String text;
  const TimeStartWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(color: realGreyColor),
          borderRadius: BorderRadius.circular(6)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
           text: text,
          size: 12,
          ),
          Icon(
            CupertinoIcons.clock,
            size: !Responsive.isDesktop(context) ? 12 : 14,
          ),
        ],
      ),
    );
  }
}
