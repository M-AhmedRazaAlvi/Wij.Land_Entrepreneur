import 'package:flutter/material.dart';
import 'package:wij_land/screens/farm_networks/projects/project_profile_screens/widgets/actions_project_widget.dart';
import 'package:wij_land/screens/farm_networks/projects/project_profile_screens/widgets/events_project_widget.dart';
import 'package:wij_land/screens/farm_networks/projects/project_profile_screens/widgets/intrested_project_widget.dart';
import 'package:wij_land/screens/farm_networks/projects/project_profile_screens/widgets/involved_project_widget.dart';
import 'package:wij_land/screens/farm_networks/projects/project_profile_screens/widgets/task_project_widget.dart';

import '../../../../../../../../../utils/functions.dart';
import '../../../../office/widgets/elevated_button.dart';


class ProjectProfileInvolved extends StatefulWidget {
  const ProjectProfileInvolved({ Key? key }) : super(key: key);

  @override
  State<ProjectProfileInvolved> createState() => _ProjectProfileInvolvedState();
}

class _ProjectProfileInvolvedState extends State<ProjectProfileInvolved> {
  bool selected = true;
  bool involved = true;
  bool actions = false, task = false , intrested = false, events= false; 
  @override
  Widget build(BuildContext context) {
  return Container(
    decoration: const BoxDecoration(
            color: Colors.white,
        //    borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))
        ),
    child: Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Container(
          width: getWidth(context),
          padding: EdgeInsets.only(left: 20,top: 20),
          decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
          child: Wrap(
            children: [
              ElevatedButtonWidget(
                primary: involved? Colors.black: Colors.white, 
                bgColor: involved ? Colors.white : Colors.black, 
                text: "Involved",
                onPressed: (){
                  setState(() {
                    involved = true;
                    actions = false;
                    task = false; 
                    intrested = false;
                    events = false;
                  });
                },
                ),
                ElevatedButtonWidget(
                primary: actions? Colors.black: Colors.white, 
                bgColor: actions ? Colors.white : Colors.black, 
                text: "Actions",
                  onPressed: (){
                  setState(() {
                    involved = false;
                    actions = true;
                    task = false; 
                    intrested = false;
                    events = false;
                  });
                },
                ),
                
                ElevatedButtonWidget(
                primary: task? Colors.black: Colors.white, 
                bgColor: task ? Colors.white : Colors.black, 
                text: "Task",
                  onPressed: (){
                  setState(() {
                    involved = false;
                    actions = false;
                    task = true; 
                    intrested = false;
                    events = false;
                  });
                },
                ),
                ElevatedButtonWidget(
                primary: intrested? Colors.black: Colors.white, 
                bgColor: intrested ? Colors.white : Colors.black, 
                text: "Intrested",
                  onPressed: (){
                  setState(() {
                    involved = false;
                    actions = false;
                    task = false; 
                    intrested = true;
                    events = false;
                  });
                },),
                ElevatedButtonWidget(
                primary: events? Colors.black: Colors.white, 
                bgColor: events ? Colors.white : Colors.black, 
                text: "Events",
                  onPressed: (){
                  setState(() {
                    involved = false;
                    actions = false;
                    task = false; 
                    intrested = false;
                    events = true;
                  });
                },)
            ],
          ),
           ),
      ),
         involved ? InvolvedProjectWidget():Container(),
         actions?ActionsProjectWidget():Container(),
         task? TaskProjectWidget() : Container(),
         intrested? IntrestedProjectWidget():Container(),
         events? EventsProjectWidget():Container()
    ]),
  );
  }
}
