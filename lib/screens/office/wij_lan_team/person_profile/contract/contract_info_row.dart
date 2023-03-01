import 'package:flutter/material.dart';

import '../../../../../app_common_widgets/real_check_box_widget.dart';
import '../../../../../app_common_widgets/real_dropdown_widget.dart';

class ContractInfoWidget extends StatelessWidget {
  const ContractInfoWidget({
    Key? key,
    required this.first,
    required this.size,
    required this.check,
    required this.status,
    required this.description,
    required this.contractDate,
    required this.expirationDate,
  }) : super(key: key);
  final bool first, check;
  final String description, contractDate, expirationDate, status;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black26))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (first)
            SizedBox(
                width: size / 6, child: ContractCheckBoxWidget(check: check))
          else
            SizedBox(
                width: size / 6, child: ContractCheckBoxWidget(check: check)),
          SizedBox(
            width: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children: [
                SizedBox(
                  width: size,
                  child: Text(
                    description,
                    style: TextStyle(
                      fontWeight: first ? FontWeight.bold : FontWeight.normal,
                      fontSize: first ? 18 : 14,
                    ),
                  ),
                ),
                SizedBox(
                  width: size,
                  child: Text(
                    contractDate,
                    style: TextStyle(
                      fontWeight: first ? FontWeight.bold : FontWeight.normal,
                      fontSize: first ? 18 : 14,
                    ),
                  ),
                ),
                SizedBox(
                  width: size,
                  child: Text(
                    expirationDate,
                    style: TextStyle(
                      fontWeight: first ? FontWeight.bold : FontWeight.normal,
                      fontSize: first ? 18 : 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
              width: size,
              child: first
                  ? Text(
                      status,
                      style: TextStyle(
                        fontWeight: first ? FontWeight.bold : FontWeight.normal,
                        fontSize: first ? 18 : 14,
                      ),
                    )
                  : ContarctSignedDropdown()),
          SizedBox(
            width: size,
            child: first
                ? Center(
                    child: Text(
                      "File",
                      style: TextStyle(
                        fontWeight: first ? FontWeight.bold : FontWeight.normal,
                        fontSize: first ? 18 : 14,
                      ),
                    ),
                  )
                : Container(
                    child: Icon(Icons.file_present),
                  ),
          ),
        ],
      ),
    );
  }
}

class ContractCheckBoxWidget extends StatefulWidget {
  const ContractCheckBoxWidget({
    Key? key,
    required this.check,
  }) : super(key: key);

  final bool check;

  @override
  State<ContractCheckBoxWidget> createState() => _ContractCheckBoxWidgetState();
}

class _ContractCheckBoxWidgetState extends State<ContractCheckBoxWidget> {
  late bool checkContactInfo = false;
  @override
  Widget build(BuildContext context) {
    return RealCheckBoxWidget(
        value: checkContactInfo, onChanged: (value) {}, Labeltext: "");
  }
}

class ContarctSignedDropdown extends StatefulWidget {
  const ContarctSignedDropdown({
    Key? key,
  }) : super(key: key);

  @override
  State<ContarctSignedDropdown> createState() => _ContarctSignedDropdownState();
}

class _ContarctSignedDropdownState extends State<ContarctSignedDropdown> {
  String? status = 'Signed';
  List<String> statusList = <String>[
    'Signed',
    'Not Signed',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10, right: 20),
      child: RealDropDownWidget(
        value: status,
        onChanged: (newValue) {
          setState(() {
            status = newValue;
          });
        },
        items: statusList.map<DropdownMenuItem<String>>(
          (String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          },
        ).toList(),
      ),
    );
  }
}
