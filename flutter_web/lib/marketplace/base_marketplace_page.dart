import 'package:flutter/material.dart';
import 'package:flutter_web/controllers/user_controller.dart';

import 'package:flutter_web/utils/color_category.dart';
import 'package:flutter_web/utils/style_resources.dart';
import 'package:flutter_web/utils/text_utils.dart';
import 'package:get/get.dart';

class BaseMarketplaceView extends StatefulWidget {
  var child;

  BaseMarketplaceView({super.key, required this.child});

  @override
  State<BaseMarketplaceView> createState() => BaseMarketplaceViewState();
}

class BaseMarketplaceViewState extends State<BaseMarketplaceView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 1000,
        width: 1920,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: welcomeBackgroundColor,
          image: const DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/marketplace_background.png')),
        ),
        margin: EdgeInsets.fromLTRB(10, 10, 30, 30),
        child: Container(
          margin: EdgeInsets.fromLTRB(30, 10, 30, 30),
          child: Column(
            children: [
              topBar(context),
              widget.child,
            ],
          ),
        ));
  }

  Widget topBar(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 30, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: TextUtils.defaultTextWithSizeColor(
                    "BCFL MarketPlace", 25,
                    color: textWhite),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(50, 15, 30, 15),
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "participate_main_page");
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        StyleResources.commonBtnCallback),
                  ),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: TextUtils.defaultTextWithSize("Main Page", 17),
                  ),
                ),
              ),
              const Spacer(),
              Container(
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                child: TextUtils.defaultTextWithSize("Wallet connection", 17),
              ),
              Container(
                height: 45,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.all(10),
                child: Obx(() {
                  return Image(
                      image: userController.walletConnect.value
                          ? AssetImage(
                              'assets/images/main_wallet_connection.png')
                          : AssetImage(
                              'assets/images/main_wallet_notconnect.png'));
                }),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: const Divider(
            height: 2,
            thickness: 1,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
