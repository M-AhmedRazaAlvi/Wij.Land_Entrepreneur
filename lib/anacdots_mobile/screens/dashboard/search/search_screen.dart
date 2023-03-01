import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/anacdots_mobile/app_common_widgets/common_text_widget.dart';
import 'package:wij_land/utils/functions.dart';

import '../../../../app_common_widgets/custom_text.dart';
import '../../../../utils/functions.dart';
import '../../../../utils/images.dart';
import '../../../app_common_widgets/styles.dart';
import '../../../providers/anecdots_search_provider/anecdots_search_provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var name = [1, 2, 3, 4];
  var age = [12, 21, 42];
  @override
  void initState() {
    // TODO: implement initState
    List abc = [...name, ...age];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AnecdotSearchProvider>(builder: (context, provider, child) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              CustomText(
                text: "Search",
                size: 24,
                color: anecBlack,
                weight: FontWeight.w700,
              ),
              /*  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.times,
                        size: 20,
                      )),*/
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: CommonTextFieldWidget(
                  mAutoFocus: false,
                  mPrefixIconWidget: Icon(
                    CupertinoIcons.search,
                    color: anecBlack,
                  ),
                  mSuffixIconWidget: IconButton(
                      onPressed: () {
                        provider.searchController.clear();
                        setState(() {});
                      },
                      icon: Icon(
                        CupertinoIcons.multiply,
                        color: anecBlack,
                      )),
                  mEditController: provider.searchController,
                  onChange: (v) {
                    provider.searchController.text = v;
                    provider.searchController.selection =
                        TextSelection.fromPosition(TextPosition(
                            offset: provider.searchController.text.length));
                    Provider.of<AnecdotSearchProvider>(context, listen: false)
                        .searchAnecdot(key: provider.searchController.text);
                  },
                ),
              ),
              Expanded(
                  child: SingleChildScrollView(
                      child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (provider.searchController.text.isEmpty)
                    SizedBox(
                        // fit: FlexFit.loose,
                        height: getHeight(context) * 0.7,
                        child: Image.asset(
                          Images.searchIcon,
                          height: getHeight(context) * 0.7,
                        )),
                  if (provider.searchController.text.isNotEmpty)
                    ...provider.searchResponse!.data!.map((e) {
                      int index = provider.searchResponse!.data!.indexOf(e);
                      return ListTile(
                        minLeadingWidth: 6,
                        onTap: () {
                          debugPrint('e value index  ${e.id}');
                        },
                        leading: Image.asset(
                          e.type == "person"
                              ? IconImages.userIcon
                              : IconImages.buildingIcon,
                          width: 20,
                          height: 20,
                        ),
                        title: CustomText(
                          text: provider.searchResponse == null
                              ? ""
                              : e.name.toString(),
                          size: 12,
                          color: anecBlack,
                          weight: FontWeight.bold,
                        ),
                      );
                    }).toList()
                ],
              ))),
            ]),
          ),
        ),
      );
    });
  }
}
