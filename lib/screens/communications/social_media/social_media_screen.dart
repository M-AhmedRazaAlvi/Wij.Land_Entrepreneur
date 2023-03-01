import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wij_land/screens/communications/social_media/widgets/add_social_media_dialog_widget.dart';
import 'package:wij_land/screens/communications/social_media/widgets/social_media_card.dart';
import 'package:wij_land/screens/communications/social_media/widgets/social_media_constants.dart';
import 'package:wij_land/screens/communications/social_media/widgets/social_media_expansion_card_widget.dart';

import '../../../app_common_widgets/on_hover.dart';

class SocialMediaScreen extends StatefulWidget {
  const SocialMediaScreen({Key? key}) : super(key: key);

  @override
  State<SocialMediaScreen> createState() => _SocialMediaScreenState();
}

class _SocialMediaScreenState extends State<SocialMediaScreen> {
  bool _isOpen = false, _isClose = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSocialClick = List.filled(7, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Social Media',
                  style: TextStyle(
                      color: Color(0xFFA71832),
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
              ),
              Wrap(
                alignment: WrapAlignment.spaceEvenly,
                children: [
                  for (int i = 0; i < 4; i++)
                    SocialMediaTotalCardWidget(
                        title: titleList[i],
                        counts: countsList[i],
                        colors: colorsList[i]),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    Text(
                      'Statistics',
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                          fontSize: 34),
                    ),
                    SizedBox(
                      width: 230,
                      child: Row(
                        children: [
                          OnHover(builder: (hover) {
                            return Card(
                              color: hover || _isClose
                                  ? Colors.green
                                  : Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextButton.icon(
                                    onPressed: () {
                                      setState(() {
                                        isSocialClick = List.filled(7, false);
                                        _isOpen = false;
                                        _isClose = true;
                                      });
                                    },
                                    icon: FaIcon(
                                      FontAwesomeIcons.angleUp,
                                      size: 14,
                                      color: hover || _isClose
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                    label: Text(
                                      'Close All',
                                      style: TextStyle(
                                          color: hover || _isClose
                                              ? Colors.white
                                              : Colors.black87),
                                    )),
                              ),
                            );
                          }),
                          OnHover(builder: (hover) {
                            return Card(
                              color: hover || _isOpen
                                  ? Colors.green
                                  : Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextButton.icon(
                                    onPressed: () {
                                      setState(() {
                                        isSocialClick = List.filled(7, true);
                                        _isOpen = true;
                                        _isClose = false;
                                      });
                                    },
                                    icon: FaIcon(
                                      FontAwesomeIcons.angleDown,
                                      size: 14,
                                      color: hover || _isOpen
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                    label: Text(
                                      'Open All',
                                      style: TextStyle(
                                          color: hover || _isOpen
                                              ? Colors.white
                                              : Colors.black),
                                    )),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SocialMediaExpansionCardWidget(
                  yearList: yearList,
                  followersCountList: followersCount,
                  tFollowers: '430',
                  engagementCountList: engagementCount,
                  tEngagement: '710',
                  postViewCountList: postViewCount,
                  tPostView: '120',
                  igtvCountList: igtvReachCount,
                  tIgtvReach: '124',
                  titleName: 'Instagram',
                  onAddPress: () {
                    AddSocialMediaDialogWidget();
                  },
                  isClick: isSocialClick[0],
                  onPress: () {
                    setState(() {
                      if (isSocialClick.contains(true)) {
                        isSocialClick[0] = false;
                      } else {
                        isSocialClick[0] = true;
                      }
                    });
                  },
                  icons: FontAwesomeIcons.instagramSquare,
                  iconColor: Colors.redAccent,
                  yearType: yearType,
                  yearChange: (v) {}),
              SocialMediaExpansionCardWidget(
                  yearList: yearList,
                  followersCountList: followersCount,
                  tFollowers: '430',
                  engagementCountList: engagementCount,
                  tEngagement: '710',
                  postViewCountList: postViewCount,
                  tPostView: '120',
                  igtvCountList: igtvReachCount,
                  tIgtvReach: '124',
                  titleName: 'LinkedIn',
                  onAddPress: () {
                    AddSocialMediaDialogWidget();
                  },
                  isClick: isSocialClick[1],
                  onPress: () {
                    setState(() {
                      if (isSocialClick.contains(true)) {
                        isSocialClick[1] = false;
                      } else {
                        isSocialClick[1] = true;
                      }
                    });
                  },
                  icons: FontAwesomeIcons.linkedin,
                  iconColor: Colors.blue,
                  yearType: yearType,
                  yearChange: (v) {}),
              SocialMediaExpansionCardWidget(
                  yearList: yearList,
                  followersCountList: followersCount,
                  tFollowers: '430',
                  engagementCountList: engagementCount,
                  tEngagement: '710',
                  postViewCountList: postViewCount,
                  tPostView: '120',
                  igtvCountList: igtvReachCount,
                  tIgtvReach: '124',
                  titleName: 'Facebook',
                  onAddPress: () {
                    AddSocialMediaDialogWidget();
                  },
                  isClick: isSocialClick[2],
                  onPress: () {
                    setState(() {
                      if (isSocialClick.contains(true)) {
                        isSocialClick[2] = false;
                      } else {
                        isSocialClick[2] = true;
                      }
                    });
                  },
                  icons: FontAwesomeIcons.facebookSquare,
                  iconColor: Color(0xff475993),
                  yearType: yearType,
                  yearChange: (v) {}),
              SocialMediaExpansionCardWidget(
                  yearList: yearList,
                  followersCountList: followersCount,
                  tFollowers: '430',
                  engagementCountList: engagementCount,
                  tEngagement: '710',
                  postViewCountList: postViewCount,
                  tPostView: '120',
                  igtvCountList: igtvReachCount,
                  tIgtvReach: '124',
                  titleName: 'Twitter',
                  onAddPress: () {
                    AddSocialMediaDialogWidget();
                  },
                  isClick: isSocialClick[3],
                  onPress: () {
                    setState(() {
                      if (isSocialClick.contains(true)) {
                        isSocialClick[3] = false;
                      } else {
                        isSocialClick[3] = true;
                      }
                    });
                  },
                  icons: FontAwesomeIcons.twitter,
                  iconColor: Color(0xff76A9EA),
                  yearType: yearType,
                  yearChange: (v) {}),
              SocialMediaExpansionCardWidget(
                  yearList: yearList,
                  followersCountList: followersCount,
                  tFollowers: '430',
                  engagementCountList: engagementCount,
                  tEngagement: '710',
                  postViewCountList: postViewCount,
                  tPostView: '120',
                  igtvCountList: igtvReachCount,
                  tIgtvReach: '124',
                  titleName: 'Youtube',
                  onAddPress: () {
                    AddSocialMediaDialogWidget();
                  },
                  isClick: isSocialClick[4],
                  onPress: () {
                    setState(() {
                      if (isSocialClick.contains(true)) {
                        isSocialClick[4] = false;
                      } else {
                        isSocialClick[4] = true;
                      }
                    });
                  },
                  icons: FontAwesomeIcons.youtubeSquare,
                  iconColor: Colors.red,
                  yearType: yearType,
                  yearChange: (v) {}),
              SocialMediaExpansionCardWidget(
                  yearList: yearList,
                  followersCountList: followersCount,
                  tFollowers: '430',
                  engagementCountList: engagementCount,
                  tEngagement: '710',
                  postViewCountList: postViewCount,
                  tPostView: '120',
                  igtvCountList: igtvReachCount,
                  tIgtvReach: '124',
                  titleName: 'Website',
                  onAddPress: () {
                    AddSocialMediaDialogWidget();
                  },
                  isClick: isSocialClick[5],
                  onPress: () {
                    setState(() {
                      if (isSocialClick.contains(true)) {
                        isSocialClick[5] = false;
                      } else {
                        isSocialClick[5] = true;
                      }
                    });
                  },
                  icons: FontAwesomeIcons.internetExplorer,
                  iconColor: Colors.blueAccent,
                  yearType: yearType,
                  yearChange: (v) {}),
              SocialMediaExpansionCardWidget(
                  yearList: yearList,
                  followersCountList: followersCount,
                  tFollowers: '430',
                  engagementCountList: engagementCount,
                  tEngagement: '710',
                  postViewCountList: postViewCount,
                  tPostView: '120',
                  igtvCountList: igtvReachCount,
                  tIgtvReach: '124',
                  titleName: 'NewsLetter',
                  onAddPress: () {
                    AddSocialMediaDialogWidget();
                  },
                  isClick: isSocialClick[6],
                  onPress: () {
                    setState(() {
                      if (isSocialClick.contains(true)) {
                        isSocialClick[6] = false;
                      } else {
                        isSocialClick[6] = true;
                      }
                    });
                  },
                  icons: FontAwesomeIcons.internetExplorer,
                  iconColor: Colors.blueAccent,
                  yearType: yearType,
                  yearChange: (v) {}),
            ],
          ),
        ),
      ),
    );
  }
}
