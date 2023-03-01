import 'package:flutter/material.dart';

import '../../../../../../app_common_widgets/custom_text.dart';
import '../../../../../../utils/styles.dart';

class PhoneLibraryScreen extends StatefulWidget {
  const PhoneLibraryScreen({Key? key}) : super(key: key);

  @override
  _PhoneLibraryScreenState createState() => _PhoneLibraryScreenState();
}

class _PhoneLibraryScreenState extends State<PhoneLibraryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back, color: darkBlack, size: 20)),
        title: CustomText(text: "Phone Library", weight: FontWeight.bold),
      ),
    );
  }
}
