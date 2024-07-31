import 'package:flutter/material.dart';
import 'package:task_code/constants/styles.dart';
import 'package:task_code/data/json.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    final List categories =
        (data["data"] as List<dynamic>)[0]["data_slider_top"][0]["categories"];

    return Padding(
      padding: const EdgeInsets.all(8.0), 
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: categories.map((category) {
            return Container(
              height: 40,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Row(
                  children: [
                    (category["image_thumb"] != null &&
                            category["image_thumb"] != "")
                        ? Padding(
                            padding: const EdgeInsets.only(right: 4.0),
                            child: Image.network(
                              category["image_thumb"],
                              alignment: Alignment.centerLeft,
                              fit: BoxFit.cover,
                            ),
                          )
                        : const SizedBox(),
                    Text(
                      category["sub_division_name"],
                      style: textStyle,
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
