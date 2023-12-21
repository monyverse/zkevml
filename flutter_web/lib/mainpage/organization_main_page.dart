import 'package:flutter/material.dart';
import 'package:flutter_web/data/bcfl.dart';
import 'package:flutter_web/mainpage/base_main_page.dart';

import 'package:flutter_web/data/user.dart';
import 'package:flutter_web/manager/task_manager.dart';
import 'package:flutter_web/manager/wallet_connection_manager.dart';
import 'package:flutter_web/utils/color_category.dart';
import 'package:flutter_web/utils/string_resources.dart';
import 'package:flutter_web/utils/style_resources.dart';
import 'package:flutter_web/utils/text_utils.dart';

class OrganizationMainPage extends StatefulWidget {
  OrganizationMainPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<OrganizationMainPage> createState() => OrganizationMainPageState();
}

class OrganizationMainPageState extends State<OrganizationMainPage> {
  @override
  Widget build(BuildContext context) {
    var userName = globalUser.data.userName;
    var userType = globalUser.data.userType;

    return BaseMainView(
      userName: userName,
      userType: userType,
      child: organizationView(context),
    );
  }

  Widget organizationView(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(0, 15, 30, 15),
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "organization_register_page");
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateColor.resolveWith(
                  StyleResources.commonBtnCallback),
            ),
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: TextUtils.defaultTextWithSize("TASK REGISTER", 17),
            ),
          ),
        ),
        taskTable(context, StringResources.taskInProgress, TaskManager.sInstance.taskListByE),
        Container(
          height: 30,
        ),
        taskTable(context, StringResources.pastTask, TaskManager.sInstance.completedTaskListByE),
      ],
    );
  }

  Widget taskTable(BuildContext context, String title, List<BCFL> data) {
    return Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
          boxShadow: [StyleResources.defaultBoxShadow],
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: textBlack,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            createTaskList(context, data),
          ],
        ));
  }

  static Widget createTaskList(BuildContext context, List<BCFL> data) {
    double maxHeight = 60 * 4 + (10 * 4);
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: maxHeight, maxHeight: maxHeight),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            for (BCFL curData in data)
              Container(
                margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: taskElement(context, curData),
              ),
          ],
        ),
      ),
    );
  }

  static Widget taskElement(BuildContext context, BCFL content) {
    double itemHeight = 60;
    if (content == null) {
      return Container(
        padding: EdgeInsets.all(10),
        height: itemHeight,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: didElementColor,
        ),
      );
    } else {
      return Container(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 7),
          height: itemHeight,
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextUtils.defaultTextWithSizeAlign(
                        content.taskId as String, 17, TextAlign.center),
                  ),
                  Expanded(
                    flex: 6,
                    child: TextUtils.defaultTextWithSize(content.taskName, 17),
                  ),
                  Expanded(
                    flex: 6,
                    child: TextUtils.defaultTextWithSize(content.userName, 17),
                  ),
                  Expanded(
                    flex: 4,
                    child: TextUtils.defaultTextWithSize('Organization', 17),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: () {
                          Map<String, BCFL> postContent = {"content": content};
                          // Detail Button
                          // Navigator.pushNamed(
                          //     context, "participate_detail_page",
                          //     arguments: postContent);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              StyleResources.commonBtnCallback),
                        ),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                          child: TextUtils.defaultTextWithSize("DETAIL", 17),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Divider(
                height: 2,
                thickness: 1,
                color: notSelectTextColor,
              ),
            ],
          ));
    }
  }

  static void dummy() {
    print("dummy button");
  }
}
