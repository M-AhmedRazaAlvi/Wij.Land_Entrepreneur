import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:wij_land/utils/hex_color.dart';

import '../../../../../utils/styles.dart';

class ProjectActionSearchWidget extends StatelessWidget {
  final String hintText;

  const ProjectActionSearchWidget({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getWidth(context) * 0.135,
      height: 35,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
              fontFamily: Montserrat_Medium
          ),
          suffixIcon: Icon(Icons.search),
          border: InputBorder.none,
          fillColor: HexColor("#FAFAFA"),
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black26, width: 0.1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black26, width: 0.1),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black26, width: 0.1),
          ),
          //  errorText: _errorText
        ),
      ),
    );
  }
}
