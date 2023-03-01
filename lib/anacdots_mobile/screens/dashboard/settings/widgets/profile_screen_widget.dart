import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/anacdots_mobile/api_client/anecdotes_directory_clients.dart';
import 'package:wij_land/anacdots_mobile/screens/dashboard/widgets/dashboard_widgets.dart';

import '../../../../../app_common_widgets/custom_text.dart';
import '../../../../../utils/images.dart';
import '../../../../app_common_widgets/ancadots_toast_widget.dart';
import '../../../../app_common_widgets/common_text_widget.dart';
import '../../../../app_common_widgets/styles.dart';
import '../../../../providers/auth_provider/auth_provider.dart';
import '../../main_dashboard.dart';

class ProfileScreenWidget extends StatefulWidget {
  const ProfileScreenWidget({Key? key}) : super(key: key);

  @override
  State<ProfileScreenWidget> createState() => _ProfileScreenWidgetState();
}

class _ProfileScreenWidgetState extends State<ProfileScreenWidget> {
  TextEditingController fName = TextEditingController();
  TextEditingController lName = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    initData();
    super.initState();
  }

  XFile? _image;
  final ImagePicker imagePicker = ImagePicker();
  bool isLoading = false;

  initData() {
    var prov = Provider.of<AuthProvider>(context, listen: false);

    fName.text = prov.myUser.value.data!.person!.firstName.toString();
    lName.text = prov.myUser.value.data!.person!.lastName.toString();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, child) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: isLoading
              ? Center(child: SpinKitCircle(color: darkGreen))
              : ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: CustomText(
                        text: "You Profile",
                        size: 18,
                        color: anecBlack,
                        weight: FontWeight.bold,
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(top: 24.0),
                          child: CircularProfileAvatar(
                            '',
                            imageFit: BoxFit.cover,
                            child: _image != null
                                ? Image.file(
                                    File(_image!.path),
                                    fit: BoxFit.cover,
                                  )
                                : CachedNetworkImage(
                                    alignment: Alignment.centerLeft,
                                    fit: BoxFit.cover,
                                    imageUrl:
                                        provider.myUser.value.data!.person!
                                                    .personImage !=
                                                null
                                            ? provider.myUser.value.data!
                                                .person!.personImage!.path!
                                            : provider.dummyImage),
                          ),
                        ),
                        Positioned(
                          top: 35,
                          left: 80,
                          child: InkWell(
                            onTap: () {
                              _settingModalBottomSheet(context);
                            },
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Icon(
                                  Icons.add_a_photo,
                                  color: Colors.black,
                                  size: 18,
                                ),
                              ),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 3,
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      50,
                                    ),
                                  ),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(2, 4),
                                      color: Colors.black.withOpacity(
                                        0.3,
                                      ),
                                      blurRadius: 3,
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: CustomText(
                        text: 'First Name',
                        color: anecBlack,
                        size: 14,
                        weight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: CommonTextFieldWidget(
                        mEditController: fName,
                        /* onChange: (v) {
                          fName.text = v;
                          fName.selection = TextSelection.fromPosition(TextPosition(offset: fName.text.length));
                        },*/
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: CustomText(
                        text: 'Last Name',
                        color: anecBlack,
                        size: 14,
                        weight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: CommonTextFieldWidget(
                        mEditController: lName,
                        /*  onChange: (v) {
                          lName.text = v;
                          lName.selection = TextSelection.fromPosition(TextPosition(offset: lName.text.length));
                        },*/
                      ),
                    ),
                    /* Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: CustomText(text: 'username',),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: CommonTextFieldWidget(mEditController: uName!, onChange: (v) {  },),
                ),*/
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  darkGreen, //background color of button
                              elevation: 3, //elevation of button
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              padding: EdgeInsets.all(
                                  10) //content padding inside button
                              ),
                          onPressed: () async {
                            isLoading = true;
                            setState(() {});
                            if (_image != null) {
                              var response =
                                  await AnecdotesDirectoryClients.uploadImage(
                                      context, _image);
                              if (response['status'] == 200) {
                                showAnacdotsToast("${response['message']}");
                                Map map = {
                                  "person": {
                                    "first_name": fName.text,
                                    "last_name": lName.text,
                                    "person_image_id": response['data']['id']
                                  },
                                  "person_id":
                                      provider.myUser.value.data!.personId
                                };
                                await Provider.of<AuthProvider>(context,
                                        listen: false)
                                    .updateUserProfile(map,
                                        provider.myUser.value.data!.personId!);
                                // showAnacdotsToast("$updateProfile");
                                isLoading = false;
                                setState(() {});
                              } else {
                                showAnacdotsToast(
                                    "this is ${response['message']}");
                                isLoading = false;
                                setState(() {});
                              }
                            } else {
                              Map map = {
                                "person": {
                                  "first_name": fName.text,
                                  "last_name": lName.text,
                                },
                                "person_id":
                                    provider.myUser.value.data!.personId
                              };

                              await Provider.of<AuthProvider>(context,
                                      listen: false)
                                  .updateUserProfile(map,
                                      provider.myUser.value.data!.personId!);

                              showAnacdotsToast(
                                  "${provider.myUser.value.message}");
                              isLoading = false;
                              setState(() {});
                            }
                          },
                          child: CustomText(
                            text: 'Confirm',
                            color: Colors.white,
                            weight: FontWeight.bold,
                          )),
                    ),
                  ],
                ),
        ),
      );
    });
  }

  void selectImagesFromGallery() async {
    final XFile? selectedImages =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (selectedImages != null) {
      setState(() {
        _image = selectedImages;
      });
    }
  }

  Future getImageFromCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) {
      return;
    }
    final imageTemporary = XFile(image.path);

    setState(() {
      _image = imageTemporary;
    });
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        isDismissible: true,
        context: context,
        builder: (BuildContext bc) {
          return Wrap(
            children: <Widget>[
              ListTile(
                  leading: Icon(Icons.camera),
                  title: Text('Camera'),
                  onTap: () => {Navigator.pop(context), getImageFromCamera()}),
              ListTile(
                leading: Icon(Icons.browse_gallery_outlined),
                title: Text('Gallery'),
                onTap: () => {
                  Navigator.pop(context),
                  selectImagesFromGallery(),
                },
              ),
            ],
          );
        });
  }
}
