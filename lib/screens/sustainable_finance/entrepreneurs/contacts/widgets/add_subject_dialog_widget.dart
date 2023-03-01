import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:provider/provider.dart';

import '../../../../../providers/entrepreneur/entrepreneur_contact_moment_provider.dart';
import '../../../../../utils/functions.dart';
import '../../../../../utils/styles.dart';

class AddNewSubjectDialogWidget extends StatefulWidget {
  const AddNewSubjectDialogWidget({Key? key}) : super(key: key);

  @override
  State<AddNewSubjectDialogWidget> createState() => _AddNewSubjectDialogWidgetState();
}

class _AddNewSubjectDialogWidgetState extends State<AddNewSubjectDialogWidget> {
  // @override
  // void initState() {
  //   super.initState();
  //   final provider = Provider.of<EntrepreneurContactMomentScreenProvider>(context, listen: false);
  //
  //   provider.mSubjectSearchController.addListener(() {
  //     print("Listener Calls");
  //     if (provider.mSubjectSearchController.text.isNotEmpty) {
  //       provider.searchSubject(value: provider.mSubjectSearchController.text);
  //       setState(() {
  //         provider.mShowSubjectWidget = true;
  //       });
  //     } else {
  //       setState(() {
  //         provider.mShowSubjectWidget = false;
  //       });
  //     }
  //   });
  // }
  //
  // @override
  // void dispose() {
  //   final provider = Provider.of<EntrepreneurContactMomentScreenProvider>(context, listen: false);
  //   provider.mSubjectSearchController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<EntrepreneurContactMomentScreenProvider>(
      builder: (
        context,
        _provider,
        widget,
      ) {
        return Container(
          width: getWidth(context) * 0.5,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Colors.black,
                        width: 0.1,
                      ),
                    ),
                    child: HtmlEditor(
                      controller: _provider.subjectController, //required
                      htmlEditorOptions: HtmlEditorOptions(
                        hint: "Your text here...".tr(),
                        autoAdjustHeight: true,
                        initialText: _provider.subjectDescriptionInitialText,
                      ),
                      otherOptions: OtherOptions(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                      ),
                      htmlToolbarOptions: HtmlToolbarOptions(
                        textStyle: TextStyle(
                          fontFamily: Montserrat_Medium,
                        ),
                        buttonBorderWidth: 1,
                      ),
                    ),
                    height: 180,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Expanded(
                flex: 2,
                child: SizedBox(
                  height: 180,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12, right: 12, top: 10),
                        child: TextFormField(
                          controller: _provider.mSubjectSearchController,
                          cursorColor: Colors.black,
                          cursorWidth: 1,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          onChanged: (text) {
                            if (_provider.mSubjectSearchController.text.isNotEmpty) {
                              _provider.searchSubject(value: _provider.mSubjectSearchController.text);
                              setState(() {
                                _provider.mShowSubjectWidget = true;
                                _provider.mSelectedSubjectByUser = "";
                              });
                            } else {
                              setState(() {
                                _provider.mShowSubjectWidget = false;
                                _provider.mSelectedSubjectByUser = "";
                              });
                            }
                          },
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Colors.black26,
                                  width: 1,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  color: Colors.black26,
                                  width: 0.5,
                                ),
                              ),
                              suffixIcon: Icon(Icons.search)),
                        ),
                      ),
                      _provider.mShowSubjectWidget
                          ? Padding(
                              padding: const EdgeInsets.only(top: 60, left: 12, right: 12),
                              child: Material(
                                color: Colors.white,
                                elevation: 4,
                                child: SizedBox(
                                  height: 120,
                                  width: double.infinity,
                                  child: ListView.builder(
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          title: Text(
                                            _provider.mSearchedSubjectList[index].title,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: Montserrat_Medium,
                                            ),
                                          ),
                                          onTap: () {
                                            _provider.mSubjectSearchController.text = _provider.mSearchedSubjectList[index].title;
                                            setState(() {
                                              _provider.mSelectedSubjectByUser = _provider.mSearchedSubjectList[index].title;
                                              _provider.mShowSubjectWidget = false;
                                            });
                                          },
                                        );
                                      },
                                      itemCount: _provider.mSearchedSubjectList.length),
                                ),
                              ),
                            )
                          : SizedBox.shrink()
                    ],
                  ),
                  //     SingleChildScrollView(
                  //   child: Wrap(
                  //     spacing: 8,
                  //     runSpacing: 8,
                  //     children: _provider.mCheckBoxDataList.map((chipValue) {
                  //       return InkWell(
                  //         onTap: () {
                  //           for (var i = 0; i < _provider.mCheckBoxDataList.length; i++) {
                  //             setState(() {
                  //               _provider.mCheckBoxDataList[i].status = false;
                  //             });
                  //           }
                  //           setState(() {
                  //             var index = _provider.mCheckBoxDataList.indexOf(chipValue);
                  //             _provider.mCheckBoxDataList[index].status = true;
                  //           });
                  //         },
                  //         borderRadius: BorderRadius.circular(100),
                  //         child: Chip(
                  //           label: SizedBox(
                  //             height: 44,
                  //             width: 120,
                  //             child: Center(
                  //               child: chipValue.status
                  //                   ? Padding(
                  //                       padding: const EdgeInsets.only(left: 5, right: 5),
                  //                       child: Row(
                  //                         mainAxisAlignment: MainAxisAlignment.center,
                  //                         children: [
                  //                           Expanded(
                  //                             child: Icon(
                  //                               Icons.check,
                  //                               color: Colors.white,
                  //                               size: 15,
                  //                             ),
                  //                           ),
                  //                           SizedBox(width: 5),
                  //                           Expanded(
                  //                             flex: 2,
                  //                             child: Text(
                  //                               chipValue.title,
                  //                               maxLines: 1,
                  //                               overflow: TextOverflow.ellipsis,
                  //                               textAlign: TextAlign.center,
                  //                               style: TextStyle(
                  //                                 color: Colors.white,
                  //                                 fontSize: 16,
                  //                               ),
                  //                             ),
                  //                           ),
                  //                         ],
                  //                       ),
                  //                     )
                  //                   : Text(
                  //                       chipValue.title,
                  //                       textAlign: TextAlign.center,
                  //                       maxLines: 1,
                  //                       overflow: TextOverflow.ellipsis,
                  //                       style: TextStyle(
                  //                         color: HexColor('#231F20'),
                  //                         fontSize: 16,
                  //                       ),
                  //                     ),
                  //             ),
                  //           ),
                  //           backgroundColor: chipValue.status ? lightGreen : HexColor('#F9F9F9'),
                  //         ),
                  //       );
                  //     }).toList(),
                  //   ),
                  // ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
