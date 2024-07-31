import 'package:flutter/material.dart';
import 'package:task_code/constants/colors.dart';
import 'package:task_code/constants/styles.dart';
import 'package:task_code/data/json.dart';

class Offers extends StatelessWidget {
  const Offers({super.key});

  @override
  Widget build(BuildContext context) {
    List content = List.from(
        (data["data"] as List<dynamic>)[0]["data_slider_top"][0]["categories"]);
    content.removeWhere(
      (element) => (int.parse(element["category_id"]) < 21 ||
          (int.parse(element["category_id"]) > 24 &&
              int.parse(element["category_id"]) != 28 &&
              int.parse(element["category_id"]) != 27)),
    );
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: Row(
                children: content.map((category) {
                  return (int.parse(category["category_id"]) != 27 &&
                          int.parse(category["category_id"]) != 28)
                      ? Container(
                          height: 100,
                          width: 71,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Center(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    (category["image_thumb"] != null &&
                                            category["image_thumb"] != "")
                                        ? Expanded(
                                            child: Image.network(
                                              height: 70,
                                              width: 60,
                                              category["image_thumb"],
                                              alignment: Alignment.centerLeft,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : const SizedBox(),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        category["sub_division_name"]
                                            .toString()
                                            .replaceAll("AED", ""),
                                        style: const TextStyle(
                                            color: textColor,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "CustomFont",
                                            fontSize: 8),
                                      ),
                                      category["sub_division_name"]
                                              .toString()
                                              .contains("aed")
                                          ? const Text(
                                              "AED",
                                              style: TextStyle(
                                                  color: textColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "CustomFont",
                                                  fontSize: 3),
                                            )
                                          : const SizedBox(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : const SizedBox();
                }).toList(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: Row(
                children: content.map((category) {
                  return (int.parse(category["category_id"]) == 27 ||
                          int.parse(category["category_id"]) == 28)
                      ? Container(
                          height: 50,
                          width: MediaQuery.sizeOf(context).width * 0.44,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Row(
                              children: [
                                (category["image_thumb"] != null &&
                                        category["image_thumb"] != "")
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(right: 4.0),
                                        child: Image.network(
                                          category["image_thumb"],
                                          alignment: Alignment.centerLeft,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : const SizedBox(),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          category["sub_division_name"],
                                          style: textStyle,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          category["sub_division_name"] ==
                                                  "Flowers"
                                              ? "A Blossoming Gift"
                                              : "Make a diffrence",
                                          style: const TextStyle(
                                            fontSize: 5,
                                            color: textColor,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: "CustomFont",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      : const SizedBox();
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
