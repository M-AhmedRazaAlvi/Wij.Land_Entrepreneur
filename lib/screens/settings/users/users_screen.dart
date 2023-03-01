
import 'package:flutter/material.dart';
import 'package:wij_land/screens/settings/users/widgets/user_data_table_card.dart';
import 'package:wij_land/screens/settings/users/widgets/user_screen_button.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        children: [

          Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: UserScreenButton(),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: UserDataTableCard(),
          )
        ],
      ),
    );
  }
}


