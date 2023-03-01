import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wij_land/screens/farm_networks/projects/widgets/add_project_widget.dart';
import 'package:wij_land/screens/farm_networks/projects/widgets/check_list_proj_widget.dart';
import 'package:wij_land/screens/farm_networks/projects/widgets/check_view_proj_widget.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../app_common_widgets/icons_hover_buttons.dart';
import '../../../utils/responsive.dart';
import '../../../utils/styles.dart';
import '../../communications/anecdotes/widgets/anecdotes_constants.dart';
import '../../office/widgets/add_button.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({Key? key}) : super(key: key);

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  bool _isCubed = true, _isList = false;
  bool _isActive = true, _isInActive = false, _isExternal = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                      child: CustomText(
                    text: 'Projects',
                    color: third,
                    size: 30,
                    weight: FontWeight.bold,
                  )),
                  IconHoverButton(
                      icons: FontAwesomeIcons.search, onPress: () {}),
                  IconHoverButton(
                      icons: FontAwesomeIcons.filter,
                      onPress: () {
                        /*setState(() {
                        _isFilter=!_isFilter;
                      });*/
                      }),
                  SizedBox(
                    width: 4,
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    child: ButtonWithAddIcon(
                      text: 'Add Project',
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AddProjectDialog();
                            });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              SizedBox(
                child: Card(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: !Responsive.isDesktop(context)
                                ? 30
                                : _isList
                                    ? 30
                                    : 10.0,
                            vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Wrap(
                                spacing: 20,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(
                                        () {
                                          // _isActive = true;
                                          // _isInActive = false;
                                          // _isExternal = false;
                                        },
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: _isActive
                                                      ? Colors.black
                                                      : Colors.white,
                                                  width: 1))),
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            _isActive = true;
                                            _isInActive = false;
                                            _isExternal = false;
                                          });
                                        },
                                        child: CustomText(
                                          text: "Active",
                                          size: _isActive ? 16 : 14,
                                          weight: _isActive
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(
                                        () {
                                          _isActive = false;
                                          _isInActive = true;
                                          _isExternal = false;
                                        },
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: _isInActive
                                                      ? Colors.black
                                                      : Colors.white,
                                                  width: 1))),
                                      child: CustomText(
                                        text: "Inactive",
                                        size: _isInActive ? 16 : 14,
                                        weight: _isInActive
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(
                                        () {
                                          _isActive = false;
                                          _isInActive = false;
                                          _isExternal = true;
                                        },
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: _isExternal
                                                      ? Colors.black
                                                      : Colors.white,
                                                  width: 1))),
                                      child: CustomText(
                                        text: "External",
                                        size: _isExternal ? 16 : 14,
                                        weight: _isExternal
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                IconHoverButton(
                                    icons: FontAwesomeIcons.thLarge,
                                    isClick: _isCubed,
                                    onPress: () {
                                      setState(() {
                                        // _isCubed?
                                        if (_isCubed) {
                                          _isCubed = false;
                                        } else {
                                          _isCubed = true;
                                          _isList = false;
                                        }
                                      });
                                    }),
                                IconHoverButton(
                                    icons: FontAwesomeIcons.listUl,
                                    isClick: _isList,
                                    onPress: () {
                                      setState(() {
                                        if (_isList) {
                                          _isList = false;
                                        } else {
                                          _isList = true;
                                          _isCubed = false;
                                        }
                                      });
                                    }),
                                _isList
                                    ? IconHoverButton(
                                        icons: FontAwesomeIcons.ellipsisV,
                                        onPress: () {
                                          setState(() {
                                            showPopupAnecdotesMenu(
                                                context, 170);
                                          });
                                        })
                                    : SizedBox.shrink(),
                              ],
                            ),
                          ],
                        ),
                      ),
                      _isCubed
                          ? _isActive
                              ? Wrap(
                                  children: const [CheckViewProjWidget()],
                                )
                              : ChecklistProjWidget()
                          : ChecklistProjWidget()
                      //  _isList? _isActive?CheckViewProjWidget():_isInActive?CheckViewProjWidget():ChecklistProjWidget():
                      //  _isActive?CheckViewProjWidget():_isInActive?CheckViewProjWidget():ChecklistProjWidget()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//anectode data table card widget == ChecklistProjWidget
