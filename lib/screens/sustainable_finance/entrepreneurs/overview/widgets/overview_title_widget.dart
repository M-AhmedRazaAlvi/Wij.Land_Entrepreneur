import 'package:flutter/material.dart';
import 'package:wij_land/models/entrepreneur/response/get_entrepreneur_detail_response.dart';
import 'package:wij_land/models/entrepreneur/response/get_entrepreneur_overview.dart';

import '../../../../../utils/styles.dart';

class OverviewTitlesWidget extends StatefulWidget {
  final List<bool> titleClicked;
  final List<String> titleList;
  final GetEntrepreneurOverviewResponse model;
  final GetEntrepreneurDetailsResponse detailsResponse;
  final Function(int)? selectedIndex;
  final int? select;

  const OverviewTitlesWidget({
    Key? key,
    required this.titleClicked,
    required this.titleList,
    required this.model,
    this.selectedIndex,
    required this.detailsResponse,
    this.select,
  }) : super(key: key);

  @override
  State<OverviewTitlesWidget> createState() => _OverviewTitlesWidgetState();
}

class _OverviewTitlesWidgetState extends State<OverviewTitlesWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < 4; i++)
          DecoratedBox(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: widget.select == i ? Colors.green : Colors.white,
                  width: 2,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                child: Text(
                  widget.titleList[i],
                  style: TextStyle(
                    color: widget.select == i ? Colors.green : Colors.black87,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: Montserrat_Medium,

                  ),
                ),
                onPressed: () {
                  widget.selectedIndex!.call(i);
                },
              ),
            ),
          )
      ],
    );
  }
}
