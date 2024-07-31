import 'package:flutter/material.dart';
import 'package:task_code/constants/colors.dart';

class CustomTextBox extends StatelessWidget {
  const CustomTextBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: const Padding(
        padding: EdgeInsets.only( 
          left: 14.0,   
        ),
        child: Center(
          child: TextField(
            style: TextStyle(color: Colors.black, fontFamily: 'CustomFont'),
            decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.search,
                  color: iconRevColor,
                  size: 20,
                ),
                border: InputBorder.none,
                hintText: "Search ...",
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14)),
          ),
        ),
      ),
    );
  }
}
