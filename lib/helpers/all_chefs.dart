import 'package:flutter/material.dart';
import 'package:task_code/constants/colors.dart';
import 'package:task_code/data/json.dart';

class AllChefs extends StatelessWidget {
  const AllChefs({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List selers = List.from((data["data"] as List<dynamic>)[0]["all_sellers"]);

    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: selers.map((category) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Stack(
                children: [
                  Container(
                    height: 190,
                    width: size.width * 0.9,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Center(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              (category["seller_banner_cdn"] != null &&
                                      category["seller_banner_cdn"] != "")
                                  ? Expanded(
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20)),
                                        child: Image.network(
                                          height: 150,
                                          category["seller_banner_cdn"],
                                          alignment: Alignment.centerLeft,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(90, 8, 8, 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  category["business_name"].toString(),
                                  style: const TextStyle(
                                      color: textColor,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "CustomFont",
                                      fontSize: 8),
                                ),
                                Stack(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.star_border,
                                                  color: Colors.amber,
                                                ),
                                                Text(
                                                  category["seller_rating"]
                                                      .toString(),
                                                  style: const TextStyle(
                                                      color: textColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: "CustomFont",
                                                      fontSize: 8),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.local_taxi_outlined,
                                                  color: Colors.amber,
                                                ),
                                                Text(
                                                  "${category["preparation_time"]} day",
                                                  style: const TextStyle(
                                                      color: textColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: "CustomFont",
                                                      fontSize: 8),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 20,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white60
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: (category["sf"] != null && category["sf"] != "")
                          ? ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              child: Row(
                                children: [
                                  Icon(Icons.draw_outlined),
                                  Text("${category["sf"]} % OFF"),
                                ],
                              ))
                          : const SizedBox(),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 30,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: (category["seller_logo_cdn"] != null &&
                              category["seller_logo_cdn"] != "")
                          ? ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              child: Image.network(
                                height: 70,
                                width: 60,
                                category["seller_logo_cdn"],
                                alignment: Alignment.centerLeft,
                                fit: BoxFit.cover,
                              ),
                            )
                          : const SizedBox(),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
