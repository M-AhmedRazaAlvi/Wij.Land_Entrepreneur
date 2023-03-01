
import 'package:flutter/material.dart';
import 'package:wij_land/screens/office/wij_lan_team/person_profile/File_Screens/profile_filescreen.dart';
import 'package:wij_land/screens/office/wij_lan_team/person_profile/Role_Screens/first_role_container.dart';

import '../../../../../../utils/functions.dart';
import '../../../widgets/elevated_button.dart';
import '../Contact_moments/contact_screens/profile_contact_moments.dart';
import '../Events/profile_events_screens.dart';
import '../contract/profile_contract_screens.dart';

class ProfileRolesWidget extends StatefulWidget {
  const ProfileRolesWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileRolesWidget> createState() => _ProfileRolesWidgetState();
}

class _ProfileRolesWidgetState extends State<ProfileRolesWidget> {
  bool selected = true;
  bool roles = true,
      contactMoment = false,
      events = false,
      file = false,
      contract = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))),
        child: Column(
          children: [
            Container(
              width: getWidth(context),
              padding: const EdgeInsets.only(left: 20, top: 20),
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10))),
              child: Wrap(
                children: [
                  ElevatedButtonWidget(
                    primary: roles ? Colors.black : Colors.white,
                    bgColor: roles ? Colors.white : Colors.black,
                    text: "Role",
                    onPressed: () {
                      setState(() {
                        roles = true;
                        contactMoment = false;
                        events = false;
                        file = false;
                        contract = false;
                      });
                    },
                  ),
                  ElevatedButtonWidget(
                    primary: contactMoment ? Colors.black : Colors.white,
                    bgColor: contactMoment ? Colors.white : Colors.black,
                    text: "Contant Moments",
                    onPressed: () {
                      setState(() {
                        roles = false;
                        contactMoment = true;
                        events = false;
                        file = false;
                        contract = false;
                      });
                    },
                  ),
                  ElevatedButtonWidget(
                    primary: events ? Colors.black : Colors.white,
                    bgColor: events ? Colors.white : Colors.black,
                    text: "Events",
                    onPressed: () {
                      setState(() {
                        roles = false;
                        contactMoment = false;
                        events = true;
                        file = false;
                        contract = false;
                      });
                    },
                  ),
                  ElevatedButtonWidget(
                    primary: file ? Colors.black : Colors.white,
                    bgColor: file ? Colors.white : Colors.black,
                    text: "Files",
                    onPressed: () {
                      setState(() {
                        roles = false;
                        contactMoment = false;
                        events = false;
                        file = true;
                        contract = false;
                      });
                    },
                  ),
                  ElevatedButtonWidget(
                    primary: contract ? Colors.black : Colors.white,
                    bgColor: contract ? Colors.white : Colors.black,
                    text: "Contracts(8)",
                    onPressed: () {
                      setState(() {
                        roles = false;
                        contactMoment = false;
                        events = false;
                        file = false;
                        contract = true;
                      });
                    },
                  ),
                ],
              ),
            ),
            roles ? const ProfileRoleContainer() : Container(),
            contactMoment ? const ProfileContactMoments() : Container(),
            events ? const ProfileEventsScreen() : Container(),
            file ? ProfileFileScreens(text: "People") : Container(),
            contract ? ProfileContractScreens() : Container(),
          ],
        ),
      ),
    );
  }
}
