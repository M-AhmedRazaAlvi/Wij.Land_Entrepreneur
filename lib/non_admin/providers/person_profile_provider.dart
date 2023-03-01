import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wij_land/models/user/user_model.dart' as ImagePathPage;
import 'package:wij_land/non_admin/api_clients/farm_computer_project_clients.dart';
import 'package:wij_land/utils/controller.dart';

import '../../api_clients/entrepreneur_client.dart';
import '../../models/file_upload/response/file_upload_response.dart';
import '../../models/user/user_model.dart';
import '../app_common_widgets/large_screen.dart';
import '../models/person_profile/person_profile_detail_model.dart';
import '../models/person_profile/person_profile_update_model.dart';
import '../models/person_profile/person_profile_update_request_model.dart';

class PersonProfileProvider extends ChangeNotifier {
  //* VARIABLES *//

  TextEditingController mFirstNameController = TextEditingController();
  TextEditingController mLastNameController = TextEditingController();
  TextEditingController mEmailAddressController = TextEditingController();
  TextEditingController mMailingAddressController = TextEditingController();
  TextEditingController mMobileNumberController = TextEditingController();
  TextEditingController mPhoneNumberController = TextEditingController();
  late String mImagePath;

  bool isFormNotValid = false;
  bool mShowNetworkImage = true;

  //* VARIABLES *//

  updateState() {
    isFormNotValid = true;
  }

  //* CLEAR ALREADY ADDED VALUES *//
  setData() {
    if (personProfileDetailResponseModel.data != null) {
      mFirstNameController.text =
          personProfileDetailResponseModel.data?.firstName ?? "";
      mLastNameController.text =
          personProfileDetailResponseModel.data?.lastName ?? "";
      mMailingAddressController.text =
          personProfileDetailResponseModel.data?.addressMail ?? "";
      mEmailAddressController.text =
          personProfileDetailResponseModel.data?.emailAddress ?? "";
      mPhoneNumberController.text =
          personProfileDetailResponseModel.data?.phoneNumberHome ?? "";
      mMobileNumberController.text =
          personProfileDetailResponseModel.data?.phoneNumberMobile ?? "";
      mImagePath = personProfileDetailResponseModel.data?.imagePath?.path ?? "";
      if (personProfileDetailResponseModel.data?.imagePath != null) {
        mLogoID =
            personProfileDetailResponseModel.data!.imagePath!.id.toString();
        authController.myUser.value.personInfo?.imagePath?.path =
            personProfileDetailResponseModel.data!.imagePath!.path!;
      }
      isFIlePicked = false;

      notifyListeners();
    }
  }

  //* CLEAR ALREADY ADDED VALUES *//

  //* API CALL TO GET PERSON PROFILE DETAIL WORK START *//
  late PersonProfileDetailResponseModel personProfileDetailResponseModel;

  bool mShowLoading = true;

  Future getPersonProfileDetailData({required int id}) async {
    //  mShowLoading = true;
    // notifyListeners();
    personProfileDetailResponseModel =
        await FarmComputerProjectClients.getPersonProfileDetail(id: id);
    print("Profile Data : ${personProfileDetailResponseModel.data!.toJson()}");
    setData();
    mShowLoading = false;
    notifyListeners();
  }

  //* API CALL TO GET PERSON PROFILE DETAIL WORK END *//

  //* PICK FILE WORK START *//

  var mUserImagePath;

  late PlatformFile mPickedFile;
  late FilePickerResult? mFilePickerResult;

  pickUserImage() async {
    mFilePickerResult = await FilePicker.platform.pickFiles();

    if (mFilePickerResult != null) {
      mPickedFile = mFilePickerResult!.files.first;
      var f = mPickedFile.bytes;
      isFIlePicked = true;
      mUserImagePath = f;
      print("Path : $mUserImagePath");
      notifyListeners();
    }
  }

  //* PICK FILE WORK ENDS *//

  //* File Upload And Update Entrepreneur Post Request Work Start *//
  bool isFIlePicked = false;
  late FileUploadResponse fileUploadResponse;
  String? mLogoID = "";
  String? image_path = '';

  uploadFile({
    required BuildContext context,
    required int id,
  }) async {
    if (isFIlePicked == false) {
      updatePerson(id: id);
    } else {
      fileUploadResponse = await EntrepreneurClients.uploadFile(
          mPickedFile); // First it was only file
      image_path = fileUploadResponse.data!.path!;
      mLogoID = fileUploadResponse.data!.id.toString();
      notifyListeners();
      updatePerson(id: id);
    }
  }

  //* File Upload And Update Entrepreneur Post Request Work Ends *//

  //* API CALL TO UPDATE PERSON PROFILE DETAIL WORK START *//
  late PersonProfileUpdateResponseModel personProfileUpdateResponseModel;

  Future updatePerson({
    required int id,
  }) async {
    print("Logo ID === $mLogoID");
    PersonProfileUpdateRequestModel requestModel =
        PersonProfileUpdateRequestModel(
            firstName: mFirstNameController.text,
            lastName: mLastNameController.text,
            addressMail: mMailingAddressController.text,
            emailAddress: mEmailAddressController.text,
            phoneNumberHome: mPhoneNumberController.text,
            phoneNumberMobile: mMobileNumberController.text,
            personImageId: mLogoID);

    personProfileUpdateResponseModel =
        await FarmComputerProjectClients.personProfileUpdate(
      model: requestModel,
      id: personProfileDetailResponseModel.data!.personId!,
    );
    authController.myUser.value = MyUser(
        name: authController.myUser.value.name,
        email: mEmailAddressController.text,
        personInfo: PersonInfo(
            imagePath: image_path == ''
                ? authController.myUser.value.personInfo!.imagePath
                : ImagePathPage.ImagePath(
                    date:
                        authController.myUser.value.personInfo!.imagePath!.date,
                    description: authController
                        .myUser.value.personInfo!.imagePath!.description,
                    id: int.parse(mLogoID!),
                    path: image_path,
                  ),
            firstName: mFirstNameController.text,
            lastName: mLastNameController.text,
            name: mFirstNameController.text + " ${mLastNameController.text}"),
        id: authController.myUser.value.id,
        active: authController.myUser.value.active,
        locale: authController.myUser.value.locale,
        farmComputer: authController.myUser.value.farmComputer,
        insertedAt: authController.myUser.value.insertedAt,
        personId: authController.myUser.value.personId,
        token: authController.myUser.value.token,
        updatedAt: authController.myUser.value.updatedAt);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(
        USER, json.encode(authController.myUser.value.toJson()));
    larrgeScreenStreamcontroller.add(12);
    if (personProfileUpdateResponseModel.status == 200) {
      mShowLoading = true;
      notifyListeners();
      getPersonProfileDetailData(id: id);
    }
  }

//* API CALL TO UPDATE PERSON PROFILE DETAIL WORK ENDS *//

}
