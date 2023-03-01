import 'package:flutter/material.dart';
import 'package:wij_land/app_common_widgets/text_widget.dart';

class RealDatePickerWidget extends StatefulWidget {
  const RealDatePickerWidget({
    Key? key,
    required this.dateController,
  }) : super(key: key);

  final TextEditingController dateController;

  @override
  State<RealDatePickerWidget> createState() => _RealDatePickerWidgetState();
}

class _RealDatePickerWidgetState extends State<RealDatePickerWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2001),
                lastDate: DateTime(2023))
            .then((d) {
          debugPrint("$d");
          if (d != null) {
            setState(() {
              widget.dateController.text = d.toString().split(" ")[0];
            });
          }
        });
      },
      child: SizedBox(
        height: 50,
        child: TextWidgetField(
          controller: widget.dateController,
          enabled: false,
          suffixIcon: Icon(Icons.calendar_today),
        ),
      ),
    );
  }
}
