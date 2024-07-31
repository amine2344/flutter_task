import 'package:flutter/material.dart';
import 'package:task_code/constants/colors.dart';
import 'package:task_code/constants/styles.dart';
import 'package:task_code/data/json.dart';

class TopChefs extends StatelessWidget {
  const TopChefs({super.key});

  @override
  Widget build(BuildContext context) {
    List selers = List.from((data["data"] as List<dynamic>)[0]
        ["data_slider_top"][0]["top_sellers"]);

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            SizedBox(
              child: Row(
                children: selers.map((category) {
                  return Container(
                    height: 120,
                    width: 60,
                    decoration: const BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Center(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              (category["seller_logo_cdn"] != null &&
                                      category["seller_logo_cdn"] != "")
                                  ? Expanded(
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20)),
                                        child: Image.network(
                                          height: 70,
                                          width: 60,
                                          category["seller_logo_cdn"],
                                          alignment: Alignment.centerLeft,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              category["business_name"].toString(),
                              style: const TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "CustomFont",
                                  fontSize: 8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
