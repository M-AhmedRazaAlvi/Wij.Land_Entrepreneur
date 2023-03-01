import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/anacdots_mobile/providers/auth_provider/auth_provider.dart';
import 'package:wij_land/anacdots_mobile/screens/dashboard/anacdot_directory/report/my_anecdotes_screen.dart';
import 'package:wij_land/anacdots_mobile/screens/dashboard/home/meeting/meeting_screen.dart';
import 'package:wij_land/app_common_widgets/custom_text.dart';
import '../../../../utils/functions.dart';
import '../../../app_common_widgets/styles.dart';
import '../../authentication/reset_password_page.dart';
import '../widgets/dashboard_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime now = DateTime.now();
  String? date;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeDateFormatting();
    var formatterDate = DateFormat('dd . MM . yyyy');
    date = formatterDate.format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, child) {
      return Scaffold(
        body: ListView(
          padding: EdgeInsets.all(12),
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 12.0),
                  child: CircularProfileAvatar(
                    '',
                    imageFit: BoxFit.cover,
                    child: CachedNetworkImage(
                        alignment: Alignment.centerLeft,
                        // placeholder: (context, url) => Center(
                        //       child: CircularProgressIndicator(),
                        //     ),
                        // errorWidget: (context, url, error) => Icon(Icons.error),
                        fit: BoxFit.cover,
                        imageUrl: provider
                                    .myUser.value.data!.person!.personImage !=
                                null
                            ? provider
                                .myUser.value.data!.person!.personImage!.path!
                            : "https://cdn.pixabay"
                                ".com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      width: getWidth(context) * 0.6,
                      child: CustomText(
                          text:
                              "${provider.myUser.value.data!.person!.firstName} ${provider.myUser.value.data!.person!.lastName}",
                          size: 20,
                          color: anecBlack,
                          lines: 2,
                          textAligns: TextAlign.start,
                          overflows: TextOverflow.ellipsis,
                          weight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: CustomText(
                          text: "Today  $date",
                          size: 14,
                          color: anecBlack,
                          textAligns: TextAlign.center,
                          weight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                    child: DashboardIconWidgets(
                  icons: FontAwesomeIcons.fileAlt,
                  title: 'Anecdots',
                  onPress: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => MyAnecdotesScreen()));
                    directoriesNavigation("Anecdots");
                  },
                )),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                    child: DashboardIconWidgets(
                  icons: FontAwesomeIcons.list,
                  title: 'Directories',
                  onPress: () {},
                )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                    child: DashboardIconWidgets(
                  icons: FontAwesomeIcons.bolt,
                  title: 'Action',
                  onPress: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => ResetPasswordPage()));
                  },
                )),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                    child: DashboardIconWidgets(
                  icons: FontAwesomeIcons.signal,
                  title: 'KPIs',
                  onPress: () {},
                )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                    child: DashboardIconWidgets(
                  icons: FontAwesomeIcons.calendar,
                  title: 'Events',
                  onPress: () {},
                )),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                    child: DashboardIconWidgets(
                  icons: FontAwesomeIcons.clock,
                  title: 'Meetings',
                  onPress: () {
                    // Navigator.pushNamed(context, Routes.meetings);
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => MeetingScreen()));
                  },
                )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                    child: DashboardIconWidgets(
                  icons: FontAwesomeIcons.checkCircle,
                  title: 'Survey',
                  onPress: () {},
                )),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                    child: DashboardIconWidgets(
                  icons: FontAwesomeIcons.questionCircle,
                  title: 'Tasks',
                  onPress: () {},
                )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                    child: DashboardIconWidgets(
                  icons: FontAwesomeIcons.fileAlt,
                  title: 'Files',
                  onPress: () {},
                )),
                SizedBox(
                  width: 12,
                ),
                Expanded(child: SizedBox()),
                /*  Expanded(
                      child: DashboardIconWidgets(
                        icons: FontAwesomeIcons.signal,
                        title: 'KPIs',
                        onPress: () {},
                      )),*/
              ],
            ),
          ],
        ),
      );
    });
  }

  directoriesNavigation(String title) {
    return title == 'Anecdots'
        ? Navigator.push(context,
            MaterialPageRoute(builder: (context) => MyAnecdotesScreen()))
        : print("object");
  }
}
