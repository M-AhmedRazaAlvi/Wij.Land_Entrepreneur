import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

int? indexValue;

class ThemeDialog extends StatefulWidget {
  const ThemeDialog({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ThemeDialogState createState() => _ThemeDialogState();
}

class _ThemeDialogState extends State<ThemeDialog> {
  String themeName = "Light";
  // final controller = Get.put(Controller());
  @override
  void initState() {
    // themeName = "Dark" : "Light";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        // backgroundColor:
        //     Colors.grey.shade800 : Colors.white,
        insetPadding: const EdgeInsets.all(10),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                // color: Colors.grey.shade800 : Colors.white,
              ),
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Text("Mode"),
                  const SizedBox(
                    height: 10,
                  ),
                  SimpleBuilder(builder: (_) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 5,
                          child: InkWell(
                            onTap: (() {
                              setState(() {});
                              themeName == "Dark"
                                  ? themeName = "Light"
                                  : themeName = "Dark";
                            }),
                            child: Container(
                              height: 43,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade800,
                                  //: Colors.white,
                                  border: Border.all(
                                      color: themeName == "Light"
                                          ? const Color(0xff5E173C)
                                          : Colors.grey),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              child: Align(
                                alignment: Alignment.center,
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 10,
                                          bottom: 10),
                                      child: Text(
                                        "Light",
                                        textAlign: TextAlign.center,
                                        // style: TextStyle(
                                        //     color: themeName == "Light"
                                        //         ? Color(AppColor.purple)
                                        //         : Color(AppColor.greyText),
                                        //     fontFamily: AppFont.medium),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    themeName == "Light"
                                        ? Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SvgPicture.asset(
                                                "assets/images/tick.svg"),
                                          )
                                        : Container(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          flex: 5,
                          child: InkWell(
                            onTap: (() {
                              setState(() {});
                              // controller.changeTheme(true);

                              themeName == "Light"
                                  ? themeName = "Dark"
                                  : themeName = "Light";
                            }),
                            child: Container(
                                height: 43,
                                decoration: BoxDecoration(
                                  color:
                                      //  controller.isDark
                                      Colors.grey.shade800,
                                  //  : Colors.white,
                                  border: Border.all(
                                    color: themeName == "Dark"
                                        ? const Color(0xff5E173C)
                                        : Colors.grey,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 10,
                                            bottom: 10),
                                        child: Text(
                                          "Dark",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              // fontFamily: AppFont.regular
                                              ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      themeName == "Dark"
                                          ? Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10,
                                                  right: 10,
                                                  top: 10,
                                                  bottom: 10),
                                              child: SvgPicture.asset(
                                                  "assets/images/tick.svg"),
                                            )
                                          : Container()
                                    ],
                                  ),
                                )),
                          ),
                        )
                      ],
                    );
                  }),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Colors",
                    style: TextStyle(
                        // color: Color(AppColor.greyText),
                        ),
                  ),
                  colorTheme(),
                ],
              ),
            ),
          ],
        ));
  }

  Widget colorTheme() {
    var size = MediaQuery.of(context).size;
    // final double itemHeight = (size.height - kToolbarHeight - 14) / 2;
    final double itemWidth = size.width / 2;
    return GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        crossAxisSpacing: 4.0,
        childAspectRatio: 1.2,
        mainAxisSpacing: 6.0,
        children: List.generate(choices.length, (index) {
          return InkWell(
            onTap: (() {
              setState(() {});
              indexValue = index;
            }),
            child:
                Center(child: SelectCard(choice: choices[index], index: index)),
          );
        }));
  }
}

class Choice {
  const Choice({this.title, this.icon, this.index});
  final String? title;
  final Stack? icon;
  final int? index;
}

List<Choice> choices = <Choice>[
  Choice(
      title: 'Default',
      icon: Stack(
        children: [
          Positioned(
              left: 15.0,
              child: SvgPicture.asset("assets/images/themeColor/blue.svg")),
          SvgPicture.asset("assets/images/themeColor/pink.svg"),
        ],
      ),
      index: 0),
  Choice(
      title: 'Fluent Light',
      icon: Stack(
        children: [
          Positioned(
              left: 15.0,
              child: SvgPicture.asset("assets/images/themeColor/darkBlue.svg")),
          SvgPicture.asset("assets/images/themeColor/green.svg")
        ],
      ),
      index: 1),
  Choice(
      title: 'Bootstrap Light',
      icon: Stack(
        children: [
          Positioned(
              left: 15.0,
              child: SvgPicture.asset("assets/images/themeColor/skyBlue.svg")),
          SvgPicture.asset("assets/images/themeColor/darkBlue.svg")
        ],
      ),
      index: 2),
  Choice(
      title: 'Indigo Light',
      icon: Stack(
        children: [
          Positioned(
              left: 15.0,
              child: SvgPicture.asset("assets/images/themeColor/pink.svg")),
          SvgPicture.asset("assets/images/themeColor/mustered.svg"),
        ],
      ),
      index: 3),
];

class SelectCard extends StatelessWidget {
  SelectCard({Key? key, this.choice, this.index}) : super(key: key);
  final Choice? choice;
  final int? index;
  // final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: indexValue == index
            ? RoundedRectangleBorder(
                side: const BorderSide(color: Color(0xff5E173C), width: 1),
                borderRadius: BorderRadius.circular(6.0))
            : RoundedRectangleBorder(
                side: BorderSide(width: 1.0, color: Colors.grey.shade600
                    // : Colors.grey.shade300,
                    ),
                borderRadius: BorderRadius.circular(6.0)),
        color: Colors.grey.shade800,
        child: Center(
          child: Column(children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            indexValue == index
                ? Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: SvgPicture.asset("assets/images/tick.svg")),
                  )
                : Container(
                    margin: const EdgeInsets.only(left: 10),
                  ),
            Expanded(
                flex: 8,
                child: Align(
                    child: Container(
                        margin: const EdgeInsets.only(left: 60),
                        width: 400,
                        height: 500,
                        child: choice!.icon!))),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 5,
              child: Text(choice!.title!,
                  style: TextStyle(
                    color: indexValue == index
                        ? const Color(0xff5E173C)
                        : Colors.grey,
                  )),
            ),
          ]),
        ));
  }
}
