import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_code/constants/colors.dart';
import 'package:task_code/constants/textbox.dart';
import 'package:task_code/constants/texthelper.dart';

import 'package:task_code/helpers/all_chefs.dart';
import 'package:task_code/helpers/cards.dart';
import 'package:task_code/helpers/categories.dart';
import 'package:task_code/helpers/offers.dart';
import 'package:task_code/helpers/top_chefs.dart';
import 'package:task_code/pages/card_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget getCategories() {
    return const Padding(
      padding: EdgeInsets.only(top: 2.0),
      child: Categories(),
    );
  }

  Widget getCards() {
    return const Padding(
      padding: EdgeInsets.only(left: 8.0, right: 8),
      child: Cards(),
    );
  }

  Widget getOffers() {
    return const Padding(
      padding: EdgeInsets.only(left: 8.0, right: 8),
      child: Offers(),
    );
  }

  Widget getTopChefs() {
    return const Padding(
      padding: EdgeInsets.only(left: 8.0, right: 8),
      child: TopChefs(),
    );
  }

  Widget getAllChefs() {
    return const Padding(
      padding: EdgeInsets.only(left: 8.0, right: 8),
      child: AllChefs(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: PreferredSize(
        preferredSize: Size.zero,
        child: AppBar(
          elevation: 0,
          backgroundColor: bgColor, //ios status bar colors
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: bgColor, //android status bar color
            statusBarBrightness: Brightness.dark, // For iOS: (dark icons)
            statusBarIconBrightness:
                Brightness.dark, // For Android: (dark icons)
          ),
        ),
      ),
      body: ListView(
        children: [
          // header
          Stack(children: [
            Container(
              width: double.infinity,
              height: size.height * 0.07,
              decoration: const BoxDecoration(
                color: bgColor,
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PopupMenuButton(
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                          ),
                          onSelected: (value) {
                            if (value == "profile") {
                            } else if (value == "settings") {
                            } else if (value == "logout") {}
                          },
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry>[
                            const PopupMenuItem(
                              value: "profile",
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: Icon(Icons.person),
                                  ),
                                  Text(
                                    'Profile',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                            const PopupMenuItem(
                              value: "settings",
                              child: Row(
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Icon(Icons.settings)),
                                  Text(
                                    'Settings',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                            const PopupMenuItem(
                              value: "logout",
                              child: Row(
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Icon(Icons.logout)),
                                  Text(
                                    'Logout',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ],
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            child: Container(
                                height: 30,
                                width: 30,
                                decoration: const BoxDecoration(
                                  color: bgColor,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.menu,
                                  color: Colors.black,
                                )),
                          ),
                        ),
                        Row(
                          children: [
                            const BoldableText(
                              "Home, ",
                              style: TextStyle(
                                fontFamily: 'CustomFont',
                                fontSize: 14,
                                color: Color.fromARGB(255, 212, 0, 255),
                                fontWeight: FontWeight.normal,
                              ),
                              textAlign: TextAlign.center,
                              isSelectable: true,
                            ),
                            Container(
                                child: const BoldableText(
                              "Dubai Silicon Oisis",
                              style: TextStyle(
                                fontFamily: 'CustomFont',
                                fontSize: 14,
                                color: textColor,
                                fontWeight: FontWeight.normal,
                              ),
                              textAlign: TextAlign.center,
                              isSelectable: true,
                            )),
                            const Icon(
                              Icons.keyboard_arrow_down,
                              color: Color.fromARGB(255, 212, 0, 255),
                            )
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CardPage(),
                                ));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            child: Container(
                                child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: const BoxDecoration(
                                    color: bgColor,
                                  ),
                                  child: const Icon(
                                    Icons.shopping_cart_outlined,
                                    color: Colors.black,
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Container(
                                    padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    constraints: const BoxConstraints(
                                      minWidth: 16,
                                      minHeight: 16,
                                    ),
                                    child: const Text(
                                      '3',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]),
          Stack(
            children: [
              // body
              // search bar
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: Row(
                  children: [
                    const Expanded(child: CustomTextBox()),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 35,
                      width: 35,
                      decoration: const BoxDecoration(
                          color: iconbgColor,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: const Icon(
                        Icons.display_settings_outlined,
                        color: iconColor,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // categories
          getCategories(),
          // cards
          getCards(),
          // Offrs
          getOffers(),
          // top chefs
          const SizedBox(
            height: 8,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BoldableText(
                  "Top Chefs",
                  style: TextStyle(
                    fontFamily: 'CustomFont',
                    fontSize: 18,
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  isSelectable: true,
                ),
              ],
            ),
          ),
          getTopChefs(),
          const SizedBox(
            height: 8,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BoldableText(
                  "All Chefs",
                  style: TextStyle(
                    fontFamily: 'CustomFont',
                    fontSize: 18,
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  isSelectable: true,
                ),
              ],
            ),
          ),
          getAllChefs(),
        ],
      ),
    );
  }
}
