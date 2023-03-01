import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/app_common_widgets/text_widget.dart';
import 'package:wij_land/models/entrepreneur/response/farm_supplier_response.dart';
import 'package:wij_land/providers/entrepreneur/farm_supplier_provider.dart';
import 'package:wij_land/screens/entrepreneur_network/farm_supplier/widgets/farm_map_widget.dart';
import 'package:wij_land/screens/entrepreneur_network/farm_supplier/widgets/farm_supplier_data_table_card.dart';

import '../../../app_common_widgets/animated_search.dart';
import '../../../app_common_widgets/custom_text.dart';
import '../../../app_common_widgets/icons_hover_buttons.dart';
import '../../../providers/entrepreneur/entrepreneur_contact_moment_provider.dart';
import '../../../utils/ShimmerEffect.dart';
import '../../../utils/functions.dart';
import '../../../utils/styles.dart';
import '../../office/widgets/add_text_button_widget.dart';

class FarmSupplierLargeScreen extends StatefulWidget {
  GetFarmSupplierResponse? response;

  FarmSupplierLargeScreen({Key? key, this.response}) : super(key: key);

  @override
  State<FarmSupplierLargeScreen> createState() => _FarmSupplierLargeScreenState();
}

class _FarmSupplierLargeScreenState extends State<FarmSupplierLargeScreen> {
  bool isList = true, isMap = false;
  String? textController;
  @override
  Widget build(BuildContext context) {
    return Consumer<GetFarmSupplier>(builder: (context, _provider, child) {
      return Column(
        children: [
          Row(
            children: [
              CustomText(
                text: 'Farm Supplier'.tr(),
                color: newRed,
                size: 35,
                weight: FontWeight.bold,
              ),
              SizedBox(
                width: getWidth(context) * 0.03,
              ),
              IconHoverButton(
                  icons: Icons.location_on_rounded,
                  isClick: isMap,
                  onPress: () {
                    isMap = true;
                    isList = false;
                    _provider.updateMap(true);
                    setState(() {});
                  }),
              SizedBox(
                width: getWidth(context) * 0.005,
              ),
              IconHoverButton(
                  icons: Icons.view_list,
                  isClick: isList,
                  onPress: () {
                    isList = true;
                    isMap = false;
                    _provider.updateMap(false);
                    setState(() {});
                  }),
              SizedBox(
                width: getWidth(context) * 0.005,
              ),
              Expanded(child: SizedBox.shrink()),
              isMap
                  ? SizedBox.shrink()
                  : AnimatedSearchWidget(
                      onChangeValue: (value) {
                        setState(() {
                          textController = value;
                        });
                      },
                      onSubmit: (values) async {
                        setState(() {
                          showLoading.value = true;
                        });
                        await _provider.getFarmSupplier(search: values);
                        setState(() {
                          showLoading.value = false;
                        });
                      },
                      onPress: () async {
                        Provider.of<EntrepreneurContactMomentScreenProvider>(context, listen: false).mFilterSearchStringController.text = '';

                        await _provider.getFarmSupplier();
                        setState(() {});
                      },
                    ),
              SizedBox(
                width: getWidth(context) * 0.005,
              ),
              isMap
                  ? SizedBox.shrink()
                  : IconHoverButton(
                      icons: FontAwesomeIcons.filter,
                      isClick: _provider.isFilter,
                      widthSize: 50,
                      onPress: () {
                        setState(
                          () {
                            _provider.isFilter = !_provider.isFilter;
                            if (!_provider.isFilter) {
                              _provider.getFarmSupplier();
                            }
                          },
                        );
                      },
                    ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          _provider.isFilter
              ? SizedBox(
                  height: 120,
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: getWidth(context),
                        height: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: 'Amount of entrepreneurs supplying to'.tr(),
                              color: Colors.black,
                              size: 14,
                              weight: FontWeight.normal,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              // alignment: WrapAlignment.spaceBetween,
                              // runSpacing: 2,
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: getWidth(context) * 0.3,
                                  child: TextWidgetField(
                                    hintText: "From".tr(),
                                    controller: _provider.fromCount,
                                    textPadding: EdgeInsets.only(top: 5, left: 10),
                                    enabled: true,
                                    onChange: (va) {
                                      _provider.fromCount.text = va;
                                      _provider.fromCount.selection =
                                          TextSelection.fromPosition(TextPosition(offset: _provider.fromCount.text.length));
                                      setState(() {});
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                SizedBox(
                                  height: 50,
                                  width: getWidth(context) * 0.3,
                                  child: TextWidgetField(
                                    hintText: "To".tr(),
                                    controller: _provider.toCount,
                                    textPadding: EdgeInsets.only(top: 5, left: 10),
                                    enabled: true,
                                    onChange: (v) {
                                      _provider.toCount.text = v;
                                      _provider.toCount.selection = TextSelection.fromPosition(TextPosition(offset: _provider.toCount.text.length));
                                      setState(() {});
                                    },
                                  ),
                                ),
                                Expanded(child: SizedBox.shrink()),
                                AddTextButtonWidget(
                                  text: 'Clear'.tr(),
                                  colors: dimMetalic3,
                                  onPress: () async {
                                    _provider.fromCount.text = "";
                                    _provider.toCount.text = "";
                                    await _provider.getFarmSupplier();
                                    setState(() {});
                                  },
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                AddTextButtonWidget(
                                  text: 'Apply'.tr(),
                                  colors: yellow,
                                  onPress: () async {
                                    setState(() {
                                      showLoading.value = true;
                                    });
                                    if (_provider.fromCount.text == '' && _provider.toCount.text == '') {
                                      showSnack('Please enter Count Range value..'.tr());
                                    } else {
                                      await _provider.getFarmSupplier(from: _provider.fromCount.text, to: _provider.toCount.text);
                                      setState(() {
                                        showLoading.value = false;
                                      });
                                    }
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : SizedBox.shrink(),
          showLoading.value == true
              ? Expanded(
                  child: ListView.builder(
                    itemBuilder: (c, i) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: ShimmerEffect(
                            child: Container(
                          height: 80,
                          width: double.infinity,
                          color: Colors.blue,
                        )),
                      );
                    },
                    itemCount: 10,
                  ),
                )
              : widget.response!.data == null || widget.response!.data!.isEmpty
                  ? Center(
                      child: Text(
                      "No Data Found".tr(),
                      style: TextStyle(fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),
                    ))
                  : _provider.isMapDisplay
                      ? Expanded(
                          child: FarmMapWidget(),
                        )
                      : Expanded(
                          child: FarmSupplierDataTableCard(model: widget.response!),
                        ),
        ],
      );
    });
  }
}
