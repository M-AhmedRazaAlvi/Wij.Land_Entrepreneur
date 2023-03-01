import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/app_common_widgets/on_hover.dart';

import '../providers/entrepreneur/entrepreneur_contact_moment_provider.dart';
import '../utils/styles.dart';

class AnimatedSearchWidget extends StatefulWidget {
  final dynamic onChangeValue;
  dynamic onSubmit;
  final Function()? onPress;

  double width;

  AnimatedSearchWidget({
    Key? key,
    this.onChangeValue,
    this.onSubmit,
    this.onPress,
    this.width = 350,
  }) : super(key: key);

  @override
  State<AnimatedSearchWidget> createState() => _AnimatedSearchWidgetState();
}

class _AnimatedSearchWidgetState extends State<AnimatedSearchWidget> {
  bool searchTapped = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<EntrepreneurContactMomentScreenProvider>(builder: (context, provider, widget) {
      return AnimatedContainer(
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 400),
          height: 50,
          width: searchTapped ? this.widget.width : 50,
          child: Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Center(
              child: Row(
                children: [
                  if (searchTapped)
                    Expanded(
                      child: TextField(
                        autofocus: true,
                        controller: provider.mFilterSearchStringController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 10, bottom: 5),
                        ),
                        onChanged: this.widget.onChangeValue,
                        onSubmitted: this.widget.onSubmit,
                      ),
                    ),
                  OnHover(
                    builder: (hover) => Container(
                      height: 43,
                      width: 40,
                      decoration: BoxDecoration(
                        color: hover ? hoverColor : Colors.transparent,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          searchTapped = !searchTapped;
                          if (!searchTapped) {
                            this.widget.onPress!.call();
                          }
                          setState(() {});
                        },
                        // hoverColor: Colors.green,
                        child: Icon(
                          Icons.search,
                          color: searchTapped
                              ? secondary
                              : hover
                                  ? Colors.white
                                  : secondary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ));
    });

    //   AnimatedContainer(
    //   alignment: Alignment.center,
    //   duration: const Duration(milliseconds: 400),
    //   height: 55,
    //   width: searchTapped ? 350 : 55,
    //   child: Card(
    //     shape: const RoundedRectangleBorder(
    //       borderRadius: BorderRadius.all(
    //         Radius.circular(8),
    //       ),
    //     ),
    //     child: Center(
    //       child: Row(
    //         children: [
    //           if (searchTapped)
    //             Expanded(
    //               child: TextField(
    //                 // controller: earchController,
    //                 decoration: InputDecoration(
    //                   border: InputBorder.none,
    //                   contentPadding: EdgeInsets.only(left: 10, bottom: 5),
    //                 ),
    //                 onChanged: widget.onChangeValue,
    //                 onSubmitted: widget.onSubmit,
    //
    //               ),
    //             ),
    //           SizedBox(
    //             height: 46,
    //             width: 46,
    //             child: OnHover(
    //               builder: (hover) => Card(
    //                 color: hover ? hoverColor : Colors.white,
    //                 shape: const RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.all(
    //                     Radius.circular(8),
    //                   ),
    //                 ),
    //                 child: InkWell(
    //                   onTap: () {
    //                     setState(
    //                       () {
    //                         searchTapped = !searchTapped;
    //                       },
    //                     );
    //                   },
    //                   child: Icon(
    //                     Icons.search,
    //                     color: secondary,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
