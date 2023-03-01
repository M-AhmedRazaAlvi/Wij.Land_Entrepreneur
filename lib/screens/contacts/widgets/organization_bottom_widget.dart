import 'package:flutter/material.dart';
import 'package:wij_land/screens/contacts/widgets/organization_members_widget.dart';

import '../../../utils/functions.dart';
import '../../office/widgets/elevated_button.dart';
import '../../office/wij_lan_team/person_profile/Contact_moments/contact_screens/profile_contact_moments.dart';

class OrganizarionBottomWidget extends StatefulWidget {
  const OrganizarionBottomWidget({Key? key}) : super(key: key);

  @override
  State<OrganizarionBottomWidget> createState() =>
      _OrganizarionBottomWidgetState();
}

class _OrganizarionBottomWidgetState extends State<OrganizarionBottomWidget> {
  bool selected = true;

  bool first = true,
      second = false,
      third = false,
      fourth = false,
      fifth = false;

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
                    primary: first ? Colors.black : Colors.white,
                    bgColor: first ? Colors.white : Colors.black,
                    text: "Members",
                    onPressed: () {
                      setState(() {
                        first = true;
                        second = false;
                        third = false;
                        fourth = false;
                        fifth = false;
                      });
                    },
                  ),
                  ElevatedButtonWidget(
                    primary: second ? Colors.black : Colors.white,
                    bgColor: second ? Colors.white : Colors.black,
                    text: "Contant Moments",
                    onPressed: () {
                      setState(() {
                        first = false;
                        second = true;
                        third = false;
                        fourth = false;
                        fifth = false;
                      });
                    },
                  ),
                  ElevatedButtonWidget(
                    primary: third ? Colors.black : Colors.white,
                    bgColor: third ? Colors.white : Colors.black,
                    text: "Farms",
                    onPressed: () {
                      setState(() {
                        first = false;
                        second = false;
                        third = true;
                        fourth = false;
                        fifth = false;
                      });
                    },
                  ),
                  ElevatedButtonWidget(
                    primary: fourth ? Colors.black : Colors.white,
                    bgColor: fourth ? Colors.white : Colors.black,
                    text: "Parcels",
                    onPressed: () {
                      setState(() {
                        first = false;
                        second = false;
                        third = false;
                        fourth = true;
                        fifth = false;
                      });
                    },
                  ),
                  ElevatedButtonWidget(
                    primary: fifth ? Colors.black : Colors.white,
                    bgColor: fifth ? Colors.white : Colors.black,
                    text: "Contracts(8)",
                    onPressed: () {
                      setState(() {
                        first = false;
                        second = false;
                        third = false;
                        fourth = false;
                        fifth = true;
                      });
                    },
                  ),
                ],
              ),
            ),
            if (first) const OrganizationMembersWidget(),
            if (second) const ProfileContactMoments(),
            if (third)
              Container(
                color: Colors.purple,
                width: getWidth(context),
                height: MediaQuery.of(context).size.height,
                child: const Text("hvcjhdvsjvds"),
              ),
            if (fourth)
              Container(
                color: Colors.deepOrangeAccent,
                width: getWidth(context),
                height: MediaQuery.of(context).size.height,
                child: const Text("hvcjhdvsjvds"),
              ),
            if (fifth)
              Container(
                color: Colors.deepOrangeAccent,
                width: getWidth(context),
                height: MediaQuery.of(context).size.height,
                child: const Text("hvcjhdvsjvds"),
              )
          ],
        ),
      ),
    );
  }
}
