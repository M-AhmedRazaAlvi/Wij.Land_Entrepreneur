import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// import 'package:flutter_widget_from_html/flutter_widget_from_dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wij_land/non_admin/models/farm_computer_project/farm_computers_projects_response_model.dart';
import 'package:wij_land/screens/office/widgets/add_text_button_widget.dart';
import 'package:wij_land/utils/functions.dart';
import 'package:wij_land/utils/styles.dart';
import '../../../../app_common_widgets/custom_text.dart';
import '../../../../utils/images.dart';
import '../../../providers/farm_computer_projects_provider/farm_computer_project_directory_screen_provider.dart';

class NotParticipatingDialogWidget extends StatefulWidget {
  final ProjectsData projectData;

  const NotParticipatingDialogWidget({Key? key, required this.projectData}) : super(key: key);

  @override
  State<NotParticipatingDialogWidget> createState() => _NotParticipatingDialogWidgetState();
}

class _NotParticipatingDialogWidgetState extends State<NotParticipatingDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FarmComputerProjectDirectoryScreenProvider>(builder: (context, _provider, widget) {
      return AlertDialog(
        content: Container(
          width: MediaQuery.of(context).size.width * 0.55,
          height: MediaQuery.of(context).size.height * 0.6,
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Wrap(
                spacing: 18,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                      ),
                      child: this.widget.projectData.bannerImage?.path != null
                          ? Image.network(
                              this.widget.projectData.bannerImage!.path!,
                              width: getWidth(context) * 0.13,
                              height: getHeight(context) / 5,
                              fit: BoxFit.cover,
                              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) return child;
                                return SizedBox(
                                  width: getWidth(context) * 0.13,
                                  height: getHeight(context) / 5,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      value: loadingProgress.expectedTotalBytes != null
                                          ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                          : null,
                                      strokeWidth: 1,
                                    ),
                                  ),
                                );
                              },
                            )
                          : Image.asset(
                              Images.wallpaper,
                              width: getWidth(context) * 0.13,
                              height: getHeight(context) / 5,
                              fit: BoxFit.cover,
                            )),
                  SizedBox(
                    width: getWidth(context) * 0.38,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: this.widget.projectData.projectName ?? "",
                              color: darkRed,
                              size: 20,
                              weight: FontWeight.w800,
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.close))
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        SizedBox(
                            width: getWidth(context) * 0.38,
                            height: 120,
                            child: HtmlWidget(
                              this.widget.projectData.description ?? "",
                              textStyle: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Colors.black,
                                textStyle: TextStyle(fontFamily: Montserrat_Medium),
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              _provider.projectDetailResponseModel.data!.personResponsibles!.isEmpty
                  ? SizedBox()
                  : Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Flex(
                        direction: Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: CustomText(
                              text: "Project manager".tr(),
                              color: dark,
                              size: 12,
                              weight: FontWeight.w600,
                            ),
                          ),
                          Expanded(
                            child: _provider.projectDetailResponseModel.data?.personResponsibles == null ||
                                    _provider.projectDetailResponseModel.data?.personResponsibles == []
                                ? SizedBox()
                                : Row(
                                    children: [
                                      _provider.projectDetailResponseModel.data?.personResponsibles![0].file?.original == null
                                          ? CircleAvatar(
                                              backgroundImage: AssetImage(Images.wallpaper),
                                              backgroundColor: Colors.white,
                                              radius: 20,
                                            )
                                          : ClipRRect(
                                              borderRadius: BorderRadius.circular(30),
                                              child: Image.network(
                                                _provider.projectDetailResponseModel.data!.personResponsibles![0].file!.original!,
                                                width: 60,
                                                height: 60,
                                                fit: BoxFit.cover,
                                                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                                  if (loadingProgress == null) return child;
                                                  return Container(
                                                    width: 60,
                                                    height: 60,
                                                    decoration: BoxDecoration(shape: BoxShape.circle),
                                                    child: Center(
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: CircularProgressIndicator(
                                                          value: loadingProgress.expectedTotalBytes != null
                                                              ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                                              : null,
                                                          strokeWidth: 1,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      CustomText(
                                        text:
                                            "${_provider.projectDetailResponseModel.data?.personResponsibles![0].firstName} ${_provider.projectDetailResponseModel.data?.personResponsibles![0].lastName}",
                                        color: dark,
                                        size: 12,
                                        weight: FontWeight.normal,
                                      ),
                                    ],
                                  ),
                          ),
                          Expanded(
                            child: _provider.projectDetailResponseModel.data?.personResponsibles == null ||
                                    _provider.projectDetailResponseModel.data?.personResponsibles == []
                                ? SizedBox()
                                : InkWell(
                                    onTap: () async {
                                      _provider.launchMailClient('${_provider.projectDetailResponseModel.data?.personResponsibles![0].emailAddress}');
                                    },
                                    child: CustomText(
                                      text: _provider.projectDetailResponseModel.data?.personResponsibles![0].emailAddress ?? "",
                                      color: dark,
                                      size: 12,
                                      textAligns: TextAlign.center,
                                      weight: FontWeight.normal,
                                    ),
                                  ),
                          )
                        ],
                      ),
                    ),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 0.4,
                height: 0.5,
                indent: 4,
                endIndent: 10,
              ),
              SizedBox(
                height: 10,
              ),
              CustomText(
                text: "Project Interest".tr(),
                color: darkRed,
                size: 20,
                weight: FontWeight.w800,
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Are you interested in participating in this project?".tr(),
                    color: dark,
                    size: 12,
                    weight: FontWeight.w600,
                  ),
                  AddTextButtonWidget(
                    colors: _provider.isInterested ? lightParrot : lightWhite,
                    text: "Yes, Im interested".tr(),
                    textColor: _provider.isInterested ? Colors.white : dark,
                    textWeight: FontWeight.normal,
                    onPress: () {
                      setState(() {
                        _provider.isInterested = true;
                      });

                      Navigator.pop(context);
                      _provider.updateProjectInterest(
                        projectID: this.widget.projectData.projectId!,
                        interestStatus: "Interested",
                      );
                    },
                  ),
                  AddTextButtonWidget(
                    text: "No, Im not interested".tr(),
                    textWeight: FontWeight.normal,
                    textColor: !_provider.isInterested ? Colors.white : dark,
                    colors: !_provider.isInterested ? lightParrot : lightWhite,
                    onPress: () {
                      setState(() {
                        _provider.isInterested = false;
                      });
                      Navigator.pop(context);
                      _provider.updateProjectInterest(
                        projectID: this.widget.projectData.projectId!,
                        interestStatus: "Not Interested",
                      );
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
