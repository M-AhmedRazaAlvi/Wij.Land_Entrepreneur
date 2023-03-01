import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../app_common_widgets/custom_text.dart';
import '../../../utils/responsive.dart';
import '../../../utils/styles.dart';
import '../../app_common_widgets/icons_hover_buttons.dart';
import '../../app_common_widgets/on_hover.dart';
import '../../app_common_widgets/real_check_box_widget.dart';
import '../../app_common_widgets/real_dropdown_widget.dart';
import '../../utils/controller.dart';
import '../../utils/functions.dart';
import '../../utils/images.dart';
import '../farm_networks/farms/farm_profile.dart';
import '../farm_networks/projects/project_profile_screens/project_profile_screen.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  bool _isFilter = false,
      _isLayer = false,
      _isFarms = false,
      _isOrganization = false,
      _isfParcel = false,
      _isOParcel = false,
      _isSquestion = false,
      _isSoil = false,
      _isBiomass = false,
      isProvince = false,
      _isWaterboard = false,
      _isBase = false,
      _isKadaster = false,
      _isSatellite = false;
  String farmerWebType = 'Select On Website', farmType = 'Select Type', farmingText = 'Select Type';
  List<String> farmerWebList = ['Select On Website', 'Farmer On Website', 'Farmer Not On Website'],
      farmBType = ['Select Type', 'Normal', 'Certified', 'Planet Proof', 'Bio-dynamic', 'Transition from normal to certified', 'Other'],
      farmingType = ['Select Type', 'Arable Farming', 'Dairy Farming', 'Meat Farming', 'Mixed Farming', 'Other'];
  bool mapFarm = false, isMapList = false;

  List<bool> farmIndexList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    farmIndexList = List.filled(16, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Obx(() => SizedBox(
                    child: CustomText(
                      text: menuController.activeItemRoute.value,
                      size: 14,
                    ),
                  )),
              SizedBox(width: 50),
              Row(
                children: [
                  Expanded(
                      child: CustomText(
                    text: 'Landscape Map',
                    color: third,
                    size: 30,
                    weight: FontWeight.bold,
                  )),
                  IconHoverButton(icons: FontAwesomeIcons.search, onPress: () {}),
                  IconHoverButton(
                      icons: FontAwesomeIcons.filter,
                      isClick: _isFilter,
                      onPress: () {
                        setState(() {
                          _isFilter = !_isFilter;
                        });
                      }),
                  IconHoverButton(
                      icons: FontAwesomeIcons.layerGroup,
                      isClick: _isLayer,
                      onPress: () {
                        setState(() {
                          _isLayer = !_isLayer;
                        });
                      }),
                  SizedBox(
                    width: 4,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              _isFilter
                  ? Card(
                      child: Padding(
                        padding: EdgeInsets.all(!Responsive.isDesktop(context) ? 8 : 18.0),
                        child: Flex(
                          direction: Axis.horizontal,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  CustomText(text: "Farmer on Website"),
                                  SizedBox(height: 6),
                                  RealDropDownWidget(
                                    value: farmerWebType,
                                    onChanged: (va) {
                                      setState(() {
                                        farmerWebType = va;
                                      });
                                    },
                                    items: farmerWebList.map<DropdownMenuItem<String>>((String values) {
                                      return DropdownMenuItem<String>(value: values, child: Text(values));
                                    }).toList(),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: !Responsive.isDesktop(context) ? 8 : 50),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  CustomText(text: "Farm Business Type"),
                                  SizedBox(height: 6),
                                  RealDropDownWidget(
                                    value: farmType,
                                    onChanged: (va) {
                                      setState(() {
                                        farmType = va;
                                      });
                                    },
                                    items: farmBType.map<DropdownMenuItem<String>>((String values) {
                                      return DropdownMenuItem<String>(value: values, child: Text(values));
                                    }).toList(),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: !Responsive.isDesktop(context) ? 8 : 50),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  CustomText(text: "Main Farming Type"),
                                  SizedBox(height: 6),
                                  RealDropDownWidget(
                                    value: farmingText,
                                    onChanged: (va) {
                                      setState(() {
                                        farmingText = va;
                                      });
                                    },
                                    items: farmingType.map<DropdownMenuItem<String>>((String values) {
                                      return DropdownMenuItem<String>(value: values, child: Text(values));
                                    }).toList(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
              SizedBox(
                height: 20,
              ),
              _isLayer
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Card(
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            alignment: !Responsive.isDesktop(context) ? WrapAlignment.center : WrapAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0),
                                child: CustomText(
                                  text: 'Objects',
                                  size: 17,
                                  weight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 55),
                              OnHover(builder: (hover) {
                                return ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    primary: _isFarms
                                        ? yellow
                                        : hover
                                            ? lightGreen
                                            : Colors.white,
                                    elevation: 0,
                                    fixedSize: Size(100, 40),
                                    side: BorderSide(width: 1, color: yellow),
                                  ),
                                  icon: Icon(
                                    Icons.location_on,
                                    color: _isFarms ? Color(0xff008000) : yellow,
                                    size: 20.0,
                                  ),
                                  label: Text(
                                    'Farms',
                                    style: TextStyle(color: shineGreen),
                                  ),
                                  onPressed: () {
                                    _isFarms = !_isFarms;
                                  },
                                );
                              }),
                              SizedBox(
                                width: 20,
                                height: !Responsive.isDesktop(context) ? 60 : 0,
                              ),
                              OnHover(builder: (hover) {
                                return ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    primary: _isOrganization
                                        ? yellow
                                        : hover
                                            ? lightGreen
                                            : Colors.white,
                                    elevation: 0,
                                    fixedSize: Size(150, 40),
                                    side: BorderSide(width: 1, color: yellow),
                                  ),
                                  icon: Icon(
                                    Icons.location_on,
                                    color: Color(0xff008000),
                                    size: 20.0,
                                  ),
                                  label: Text(
                                    'Organizations',
                                    style: TextStyle(color: shineGreen),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isOrganization = !_isOrganization;
                                    });
                                  },
                                );
                              }),
                              SizedBox(
                                width: 20,
                              ),
                              OnHover(builder: (hover) {
                                return ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    primary: _isfParcel
                                        ? yellow
                                        : hover
                                            ? lightGreen
                                            : Colors.white,
                                    elevation: 0,
                                    fixedSize: Size(150, 40),
                                    side: BorderSide(width: 1, color: yellow),
                                  ),
                                  icon: Icon(
                                    FontAwesomeIcons.squareFull,
                                    color: lightGreen,
                                    size: 16.0,
                                  ),
                                  label: Text(
                                    'Farms Parecls',
                                    style: TextStyle(color: shineGreen),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isfParcel = !_isfParcel;
                                    });
                                  },
                                );
                              }),
                              SizedBox(
                                width: 20,
                              ),
                              OnHover(builder: (hover) {
                                return ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    primary: _isOParcel
                                        ? yellow
                                        : hover
                                            ? lightGreen
                                            : Colors.white,
                                    elevation: 0,
                                    fixedSize: Size(150, 40),
                                    side: BorderSide(width: 1, color: yellow),
                                  ),
                                  icon: Icon(
                                    FontAwesomeIcons.squareFull,
                                    color: shineBlue,
                                    size: 16.0,
                                  ),
                                  label: Text(
                                    'Org. Parcel',
                                    style: TextStyle(color: shineGreen),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isOParcel = !_isOParcel;
                                    });
                                  },
                                );
                              }),
                              SizedBox(
                                height: 40,
                              ),
                            ],
                          ),
                        ),
                        Card(
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            alignment: !Responsive.isDesktop(context) ? WrapAlignment.center : WrapAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0),
                                child: CustomText(
                                  text: 'Custom',
                                  size: 17,
                                  weight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 55),
                              OnHover(builder: (hover) {
                                return ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    primary: _isSquestion
                                        ? yellow
                                        : hover
                                            ? lightGreen
                                            : Colors.white,
                                    elevation: 0,
                                    fixedSize: Size(130, 40),
                                    side: BorderSide(width: 1, color: yellow),
                                  ),
                                  icon: Icon(
                                    Icons.water_drop,
                                    color: shineBlue,
                                    size: 20.0,
                                  ),
                                  label: Text(
                                    'Sequestion',
                                    style: TextStyle(color: shineGreen),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isSquestion = !_isSquestion;
                                    });
                                  },
                                );
                              }),
                              SizedBox(
                                width: 20,
                                height: !Responsive.isDesktop(context) ? 60 : 0,
                              ),
                              OnHover(builder: (hover) {
                                return ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    primary: _isSoil
                                        ? yellow
                                        : hover
                                            ? lightGreen
                                            : Colors.white,
                                    elevation: 0,
                                    fixedSize: Size(80, 40),
                                    side: BorderSide(width: 1, color: yellow),
                                  ),
                                  icon: Icon(
                                    Icons.water_drop,
                                    color: shineBlue,
                                    size: 20.0,
                                  ),
                                  label: Text(
                                    'Soil',
                                    style: TextStyle(color: shineGreen),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isSoil = !_isSoil;
                                    });
                                  },
                                );
                              }),
                              SizedBox(
                                width: 20,
                              ),
                              OnHover(builder: (hover) {
                                return ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    primary: _isBiomass
                                        ? yellow
                                        : hover
                                            ? lightGreen
                                            : Colors.white,
                                    elevation: 0,
                                    fixedSize: Size(120, 40),
                                    side: BorderSide(width: 1, color: yellow),
                                  ),
                                  icon: Icon(
                                    Icons.water_drop,
                                    color: shineBlue,
                                    size: 20.0,
                                  ),
                                  label: Text(
                                    'Biomass',
                                    style: TextStyle(color: shineGreen),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isBiomass = !_isBiomass;
                                    });
                                  },
                                );
                              }),
                            ],
                          ),
                        ),
                        Card(
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            alignment: !Responsive.isDesktop(context) ? WrapAlignment.center : WrapAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0),
                                child: CustomText(
                                  text: 'Areas',
                                  size: 17,
                                  weight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 70),
                              OnHover(builder: (hover) {
                                return ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: isProvince
                                        ? yellow
                                        : hover
                                            ? lightGreen
                                            : Colors.white,
                                    elevation: 0,
                                    fixedSize: Size(100, 40),
                                    side: BorderSide(width: 1, color: yellow),
                                  ),
                                  child: Text(
                                    'Provinces',
                                    style: TextStyle(color: shineGreen),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isProvince = !isProvince;
                                    });
                                  },
                                );
                              }),
                              SizedBox(
                                width: 20,
                                height: !Responsive.isDesktop(context) ? 60 : 0,
                              ),
                              OnHover(builder: (hover) {
                                return ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    primary: _isWaterboard
                                        ? yellow
                                        : hover
                                            ? lightGreen
                                            : Colors.white,
                                    elevation: 0,
                                    fixedSize: Size(140, 40),
                                    side: BorderSide(width: 1, color: yellow),
                                  ),
                                  icon: Icon(
                                    Icons.water_drop,
                                    color: shineBlue,
                                    size: 20.0,
                                  ),
                                  label: Text(
                                    'Waterboard',
                                    style: TextStyle(color: shineGreen),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isWaterboard = !_isWaterboard;
                                    });
                                  },
                                );
                              }),
                            ],
                          ),
                        ),
                        Card(
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            alignment: !Responsive.isDesktop(context) ? WrapAlignment.center : WrapAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0),
                                child: CustomText(
                                  text: 'Base Layers',
                                  size: 17,
                                  weight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 20),
                              OnHover(builder: (hover) {
                                return ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    primary: _isSatellite
                                        ? yellow
                                        : hover
                                            ? lightGreen
                                            : Colors.white,
                                    elevation: 0,
                                    fixedSize: Size(110, 40),
                                    side: BorderSide(width: 1, color: yellow),
                                  ),
                                  icon: Icon(
                                    FontAwesomeIcons.satellite,
                                    color: darkBlue,
                                    size: 16.0,
                                  ),
                                  label: Text(
                                    'Satellite',
                                    style: TextStyle(color: shineGreen),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if (_isSatellite) {
                                        _isSatellite = false;
                                      } else {
                                        _isSatellite = true;
                                        _isBase = false;
                                      }
                                    });
                                  },
                                );
                              }),
                              SizedBox(
                                width: 20,
                                height: !Responsive.isDesktop(context) ? 60 : 0,
                              ),
                              OnHover(builder: (hover) {
                                return ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: _isBase
                                        ? yellow
                                        : hover
                                            ? lightGreen
                                            : Colors.white,
                                    elevation: 0,
                                    fixedSize: Size(70, 40),
                                    side: BorderSide(width: 1, color: yellow),
                                  ),
                                  child: Text(
                                    'Base',
                                    style: TextStyle(color: shineGreen),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if (_isBase) {
                                        _isBase = false;
                                      } else {
                                        _isBase = true;
                                        _isSatellite = false;
                                      }
                                    });
                                  },
                                );
                              }),
                              SizedBox(
                                width: 20,
                              ),
                              OnHover(builder: (hover) {
                                return ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: _isKadaster
                                        ? yellow
                                        : hover
                                            ? lightGreen
                                            : Colors.white,
                                    elevation: 0,
                                    fixedSize: Size(100, 40),
                                    side: BorderSide(width: 1, color: yellow),
                                  ),
                                  child: Text(
                                    'Kadaster',
                                    style: TextStyle(color: shineGreen),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isKadaster = !_isKadaster;
                                    });
                                  },
                                );
                              }),
                            ],
                          ),
                        ),
                      ],
                    )
                  : SizedBox.shrink(),
              Wrap(
                children: [
                  isMapList
                      ? SizedBox(
                          width: !Responsive.isDesktop(context) ? getWidth(context) : getWidth(context) * 0.25,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Flexible(
                                    flex: 5,
                                    child: Card(
                                      child: ListTile(
                                        onTap: () {
                                          setState(() {
                                            if (mapFarm == true) {
                                              mapFarm = false;
                                            } else {
                                              mapFarm = true;
                                            }
                                          });
                                        },
                                        contentPadding: EdgeInsets.only(
                                          left: 8,
                                          right: 24,
                                        ),
                                        horizontalTitleGap: 4,
                                        minLeadingWidth: 6,
                                        leading: RealCheckBoxWidget(
                                            value: mapFarm,
                                            onChanged: (va) {
                                              setState(() {
                                                if (mapFarm == true) {
                                                  mapFarm = false;
                                                } else {
                                                  mapFarm = true;
                                                }
                                              });
                                            },
                                            Labeltext: ''),
                                        title: Text(
                                          '12Results',
                                          style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w600),
                                        ),
                                        trailing: FaIcon(
                                          CupertinoIcons.multiply,
                                          size: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                      child: IconHoverButton(
                                    onPress: () {},
                                    icons: FontAwesomeIcons.ellipsisV,
                                  )),
                                ],
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Card(
                                    clipBehavior: Clip.antiAlias,
                                    margin: EdgeInsets.only(left: 5, top: 8, right: 12, bottom: 4),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          ListTile(
                                            contentPadding: EdgeInsets.only(
                                              left: 8,
                                              right: 8,
                                            ),
                                            horizontalTitleGap: 4,
                                            minLeadingWidth: 6,
                                            leading: RealCheckBoxWidget(
                                                value: farmIndexList[index],
                                                onChanged: (va) {
                                                  setState(() {
                                                    if (farmIndexList[index] == true) {
                                                      farmIndexList[index] = false;
                                                    } else {
                                                      farmIndexList[index] = true;
                                                    }
                                                  });
                                                },
                                                Labeltext: ''),
                                            title: TextButton(
                                                onPressed: () {
                                                  Get.to(FarmProfileScreens());
                                                },
                                                child: Text(
                                                  'Farm of Tom Collins',
                                                  style: TextStyle(color: darkGreen, fontSize: 16, fontWeight: FontWeight.w900),
                                                )),
                                            trailing: Text(
                                              '$index.4HECTARES',
                                              style: TextStyle(color: shineGrey, fontSize: 8, fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                //Get.to(PersonProfileScreen());
                                              },
                                              child: Text(
                                                'Tom Collins',
                                                style: TextStyle(color: dimGrey, fontSize: 14, fontWeight: FontWeight.w300),
                                              )),
                                          SizedBox(
                                            height: 6,
                                          ),
                                          Wrap(
                                            children: [
                                              SizedBox(
                                                  width: 120,
                                                  height: 30,
                                                  child: Center(
                                                      child: Text(
                                                    'Active in projects:',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
                                                  ))),
                                              for (int i = 0; i < 4; i++)
                                                TextButton(
                                                    onPressed: () {
                                                      Get.to(ProjectProfileScreen());
                                                    },
                                                    child: Text(
                                                      'Wij.land Project',
                                                      style: TextStyle(color: dimGrey, fontSize: 12, fontWeight: FontWeight.w300),
                                                    )),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                itemCount: 6,
                              ),
                            ],
                          ),
                        )
                      : SizedBox.shrink(),
                  SizedBox(
                    width: isMapList
                        ? !Responsive.isDesktop(context)
                            ? getWidth(context)
                            : getWidth(context) * 0.7
                        : getWidth(context),
                    child: Stack(
                      children: [
                        Image.asset(
                          Images.mapImage,
                          width: getWidth(context),
                          height: getHeight(context) * 0.70,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                            child: IconHoverButton(
                          icons: isMapList ? FontAwesomeIcons.angleLeft : FontAwesomeIcons.angleRight,
                          onPress: () {
                            setState(() {
                              isMapList = !isMapList;
                            });
                          },
                        )),
                        Positioned(
                            right: 16,
                            top: 8,
                            child: IconHoverButton(
                              icons: CupertinoIcons.viewfinder,
                              iconSize: 20,
                              onPress: () {
                                setState(() {
                                  //    isMapList=!isMapList;
                                });
                              },
                            )),
                        Positioned(
                            right: 16,
                            top: getHeight(context) * 0.55,
                            child: Column(
                              children: [
                                IconHoverButton(
                                  icons: FontAwesomeIcons.plus,
                                  onPress: () {
                                    setState(() {
                                      //    isMapList=!isMapList;
                                    });
                                  },
                                ),
                                IconHoverButton(
                                  icons: FontAwesomeIcons.minus,
                                  onPress: () {
                                    setState(() {
                                      //    isMapList=!isMapList;
                                    });
                                  },
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
