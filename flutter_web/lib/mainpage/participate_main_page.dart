import 'package:flutter/material.dart';
import 'package:flutter_web/data/bcfl.dart';
import 'package:flutter_web/mainpage/base_main_page.dart';
import 'package:flutter_web/mainpage/participate_detail_popup.dart';
import 'package:flutter_web/mainpage/participate_search_page.dart';

import 'package:flutter_web/data/user.dart';
import 'package:flutter_web/manager/task_manager.dart';
import 'package:flutter_web/utils/color_category.dart';
import 'package:flutter_web/utils/string_resources.dart';
import 'package:flutter_web/utils/style_resources.dart';
import 'package:flutter_web/utils/text_utils.dart';
import 'package:get/get.dart';

class ParticipateMainPage extends StatefulWidget {
  ParticipateMainPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ParticipateMainPage> createState() => ParticipateMainPageState();
}

class ParticipateMainPageState extends State<ParticipateMainPage> {
  var userName = globalUser.data.userName;
  var userType = globalUser.data.userType;
  @override
  Widget build(BuildContext context) {
    TaskManager.sInstance.initTaskList();
    return BaseMainView(
      userName: userName,
      userType: userType,
      child: participateView(context),
    );
  }

  Widget participateView(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(0, 15, 30, 15),
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            onPressed: () {
                Navigator.pushNamed(context, "participate_search_page");
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateColor.resolveWith(
                  StyleResources.commonBtnCallback),
            ),
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: TextUtils.defaultTextWithSize("Explore tasks", 17),
            ),
          ),
        ),
        Obx(() => taskTable(context, StringResources.taskInProgress, TaskManager.sInstance.taskListByT),),
        Container(
          height: 30,
        ),
        Obx(() => taskTable(context, StringResources.pastTask, TaskManager.sInstance.completedTaskListByT),),
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
            createTaskList(context, data, false),
          ],
        ));
  }

  static Widget createTaskList(
      BuildContext context, List<BCFL> data, bool isSearch) {
    double maxHeight = 60 * 4 + (10 * 4);
    if (isSearch) {
      maxHeight = 60 * ParticipateSearchPageState.maxCapacity +
          (10 * ParticipateSearchPageState.maxCapacity);
    }
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: maxHeight, maxHeight: maxHeight),
      child: SingleChildScrollView(
        physics: isSearch
            ? const NeverScrollableScrollPhysics()
            : const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            for (BCFL curData in data)
              Container(
                margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: taskElement(context, curData, isSearch),
              ),
          ],
        ),
      ),
    );
  }

  static Widget taskElement(BuildContext context, BCFL content, bool isSearch) {
    double itemHeight = isSearch ? 80 : 60;
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
                        content.taskId.toString(), 17, TextAlign.center),
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
                    child: TextUtils.defaultTextWithSize(
                        isSearch ? (content.taskParticipants + "/" + content.taskMaxTrainer)
                            : 'Trainer', 17),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: () {
                          Map<String, BCFL> postContent = {"content": content};
                          isSearch
                              ? Navigator.pushNamed(
                                  context, "participate_detail_page",
                                  arguments: postContent)
                              : ParticipateDetailPopup.showDetailPopup(context, content, globalUser.data.userType);
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
