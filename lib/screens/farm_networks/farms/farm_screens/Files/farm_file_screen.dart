import 'package:flutter/material.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Files/widget/add_file_dialogbox.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Files/widget/farm_file_list.dart';
import 'package:wij_land/screens/farm_networks/farms/farm_screens/Files/widget/farm_file_view.dart';

import '../../../../../app_common_widgets/custom_text.dart';
import '../../../../../app_common_widgets/on_hover.dart';
import '../../../../../utils/functions.dart';
import '../../../../../utils/styles.dart';
import '../../../../office/office_programes/Widgets/addicon_and_dialog.dart';
import '../../../../office/widgets/search_widget.dart';

class FarmFilesScreens extends StatefulWidget {
  const FarmFilesScreens({
    Key? key,
  }) : super(key: key);

  @override
  State<FarmFilesScreens> createState() => _FarmFilesScreensState();
}

class _FarmFilesScreensState extends State<FarmFilesScreens> {
  bool checkedView = false, checkedList = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      width: getWidth(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: "Files",
                size: 30,
                weight: FontWeight.bold,
                color: darkGreen,
              ),
              AddIconsAndDialogBox(
                  icons: Icons.filter_alt,
                  onIconTap: () {},
                  addText: "File",
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const AddFileAllMediaDialogBox();
                        });
                  })
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ClickIconButton(
                clickcolors: checkedView ? hoverColor : Colors.white,
                icon: Icons.view_array,
                onPressed: () {
                  setState(
                    () {
                      checkedView = true;
                      checkedList = false;
                    },
                  );
                },
              ),
              const SizedBox(
                width: 6,
              ),
              ClickIconButton(
                clickcolors: checkedList ? hoverColor : Colors.white,
                icon: Icons.list_alt,
                onPressed: () {
                  setState(() {
                    checkedView = false;
                    checkedList = true;
                  });
                },
              ),
              PopupMenuButton(
                child: OnHover(
                    builder: (hover) => SizedBox(
                          height: 50,
                          width: 50,
                          child: Card(
                            color: hover ? Colors.greenAccent : Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            child: const Icon(
                              Icons.more_vert,
                            ),
                          ),
                        )),
                onSelected: (value) async {
                  if (value == 1) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Delete Blog'),
                        content: const Text('Do you want to delete this blog?'),
                        actions: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('No'),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              // showToast(context, "Blog Deleted");
                              // Navigator.pop(context);
                              // await DatabaseService.blogCollection
                              //     .doc(bid)
                              //     .delete();
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Yes'),
                            ),
                          )
                        ],
                      ),
                    );
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                      value: 1,
                      child: Row(
                        children: const <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(2, 2, 8, 2),
                            child: Icon(
                              Icons.delete,
                              color: Colors.greenAccent,
                            ),
                          ),
                          Text('Delete')
                        ],
                      )),
                ],
              ),
            ],
          ),
          Column(
            children: [
              checkedList ? const FarmFileCheckedList() : Container(),
              checkedView ? const FarmFileCheckedView() : Container(),
            ],
          )
        ],
      ),
    );
  }
}
