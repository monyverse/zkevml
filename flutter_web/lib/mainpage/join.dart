import 'package:flutter/material.dart';
import 'package:flutter_web/controllers/user_controller.dart';
import 'package:flutter_web/manager/task_manager.dart';
import 'package:flutter_web/utils/color_category.dart';
import 'package:flutter_web/utils/http_utils.dart';
import 'package:metamask/metamask.dart';

import 'package:flutter_web/utils/style_resources.dart';

import 'package:flutter_web/data/user.dart';
import 'package:flutter_web/services/clientService.dart';

class Join extends StatefulWidget {
  const Join({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Join> createState() => _JoinPageState();
}

class _JoinPageState extends State<Join> {


  Future<void> _loginWithMetaMask() async {
    var metamask = MetaMask();
    print("_loginWithMetaMask()");
    userController.initController();
    bool isWindows = Theme.of(context).platform == TargetPlatform.windows;
    bool isMacOS = Theme.of(context).platform == TargetPlatform.macOS;
    if (isWindows || isMacOS) {
      print("metamask : " + metamask.address.toString());
      bool success = await metamask.login();
      if (success) {
        final UserService clientApi;
        clientApi = UserService();

        debugPrint('MetaMask address: ${metamask.address}');
        debugPrint('MetaMask signature: ${metamask.signature}');

        userController.address.value = metamask.address.toString();
        userController.signature.value = metamask.signature.toString();
        print("Await Start !!");
        UserResponse response = await clientApi.isUser({"userAddress": metamask.address});
        print("Await Success !!");
        if (response.result.code != SUCCESS) {
          Navigator.pushNamed(context, "did_vc");
        } else if (response.result.code == SUCCESS) {
          userController.walletConnect.value = true;
          globalUser = response;
          TaskManager.sInstance.initTaskList();
          if (response.data.userType == typeParticipant) {
            Navigator.pushNamed(
              context,
              "participate_main_page",
            );
          } else if (response.data.userType == typeOrganization) {
            Navigator.pushNamed(
              context,
              "organization_main_page",
            );
          }
        }
      } else {
        debugPrint('MetaMask login failed');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: welcomeBackgroundColor,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/welcome_background.png')),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Welcome, User!',
                style: TextStyle(fontSize: 50),
              ),
              Container(
                width: 305,
                height: 365,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/welcome_card.png'))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(
                      image:
                          AssetImage('assets/images/welcome_metamask_logo.png'),
                      width: 76,
                      height: 76,
                    ),
                    ElevatedButton(
                      onPressed: _loginWithMetaMask,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            StyleResources.commonBtnCallback),
                      ),
                      child: Text("CONNECT WALLET",
                          style: TextStyle(
                              color: textBlack,
                              fontSize: 18,
                              fontWeight: FontWeight.w700)),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: Text("Wanna get additional token?",
                          style: TextStyle(
                              color: textWhite,
                              fontSize: 15,
                              fontWeight: FontWeight.w500)),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: Text("Issue DID/VC",
                          style: TextStyle(
                              color: textWhite,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline)),
                    )
                  ],
                ),
              ),
              // if (metamask.address != null) Text('address: ${userController.address.value}'),
              // if (metamask.signature != null) Text('signed: ${userController.signature.value}'),
              // Text(
              //   metamask.address == null ? 'You are not logged in' : 'You are logged in',
              // ),
              // Text('Metamask support ${metamask.isSupported}'),
            ],
          ),
        ),
      ),
    );
  }

  void fetchData() async{

  }
}
