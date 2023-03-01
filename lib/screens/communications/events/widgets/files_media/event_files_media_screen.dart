import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wij_land/screens/communications/events/widgets/events_constants.dart';
import 'package:wij_land/screens/communications/events/widgets/files_media/add_event_file_dialog_widget.dart';
import 'package:wij_land/screens/communications/events/widgets/files_media/all_file_list_screen.dart';
import 'package:wij_land/screens/communications/events/widgets/files_media/all_files_cube_screen.dart';
import 'package:wij_land/screens/communications/events/widgets/files_media/media_document_list_screen.dart';
import 'package:wij_land/screens/communications/events/widgets/files_media/media_file_cube_screen.dart';
import 'package:wij_land/screens/communications/events/widgets/files_media/media_file_list_screen.dart';

import '../../../../../app_common_widgets/custom_text.dart';
import '../../../../../app_common_widgets/icons_hover_buttons.dart';
import '../../../../office/widgets/add_button.dart';
import 'media_document_cube_screen.dart';

class EventFileMediaScreen extends StatefulWidget {
  const EventFileMediaScreen({Key? key}) : super(key: key);

  @override
  State<EventFileMediaScreen> createState() => _EventFileMediaScreenState();
}

class _EventFileMediaScreenState extends State<EventFileMediaScreen> {
  bool isAll = true,
      isMedia = false,
      isDocument = false,
      isCube = true,
      isList = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                    child: CustomText(
                  text: 'Files',
                  color: Color(0xff48883E),
                  size: 30,
                  weight: FontWeight.bold,
                )),
                IconHoverButton(icons: FontAwesomeIcons.search, onPress: () {}),
                IconHoverButton(
                    icons: FontAwesomeIcons.filter,
                    onPress: () {
                      setState(() {
                        //  _isFilter = !_isFilter;
                      });
                    }),
                SizedBox(
                  width: 4,
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: ButtonWithAddIcon(
                    text: 'File',
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return AddEventFileDialogWidget();
                          });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 0.2))),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: isAll
                                      ? Colors.black87
                                      : Colors.transparent,
                                  width: 1))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                if (!isAll) {
                                  isAll = true;
                                  isMedia = false;
                                  isDocument = false;
                                }
                              });
                            },
                            child: Text(
                              'All',
                              style: TextStyle(
                                  color: isAll ? Colors.black : Colors.grey,
                                  fontWeight: isAll
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  fontSize: isAll ? 16 : 14),
                            )),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: isMedia
                                      ? Colors.black87
                                      : Colors.transparent,
                                  width: 1))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                if (!isMedia) {
                                  isAll = false;
                                  isMedia = true;
                                  isDocument = false;
                                }
                              });
                            },
                            child: Text(
                              'Media',
                              style: TextStyle(
                                  color: isMedia ? Colors.black : Colors.grey,
                                  fontWeight: isMedia
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  fontSize: isMedia ? 16 : 14),
                            )),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: isDocument
                                      ? Colors.black87
                                      : Colors.transparent,
                                  width: 1))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                if (!isDocument) {
                                  isAll = false;
                                  isMedia = false;
                                  isDocument = true;
                                }
                              });
                            },
                            child: Text(
                              'Documents',
                              style: TextStyle(
                                  color:
                                      isDocument ? Colors.black : Colors.grey,
                                  fontWeight: isDocument
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  fontSize: isDocument ? 16 : 14),
                            )),
                      ),
                    ),
                    Expanded(child: Container()),
                    IconHoverButton(
                        icons: FontAwesomeIcons.thLarge,
                        isClick: isCube,
                        onPress: () {
                          setState(() {
                            if (!isCube) {
                              isCube = true;
                              isList = false;
                            }
                          });
                        }),
                    IconHoverButton(
                        icons: FontAwesomeIcons.list,
                        isClick: isList,
                        onPress: () {
                          setState(() {
                            if (!isList) {
                              isCube = false;
                              isList = true;
                            }
                          });
                        }),
                    IconHoverButton(
                        icons: FontAwesomeIcons.ellipsisV,
                        onPress: () {
                          showPopupFileMenu(context);
                        }),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            isCube
                ? isAll
                    ? AllFileCubeScreen()
                    : isMedia
                        ? MediaFileCubeScreen()
                        : MediaDocumentCubeScreen()
                : isAll
                    ? AllFileListScreen()
                    : isMedia
                        ? MediaFileListScreen()
                        : MediaDocumentListScreen(),
          ],
        ),
      ),
    );
  }
}
