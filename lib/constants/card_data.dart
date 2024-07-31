import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:task_code/constants/colors.dart';
import 'package:task_code/data/json.dart';

//this is the indicator for the dot indicator
int currentSelected = 0;

//this class was created to store the image urls and save functions for actions taken in the app
class CardData {
  List sliders =
      (data["data"] as List<dynamic>)[0]["data_slider_top"][0]["home_slider"];

  List<String> cardImageUrl = [
    'https://firebasestorage.googleapis.com/v0/b/boldo-c23f2.appspot.com/o/Screenshot_2024-07-31_18-45-48.png?alt=media&token=54c1c3a6-9c6a-4f46-a827-db6bdb7df682',
    'https://images.unsplash.com/photo-1642760841079-2da66789aa6f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=1000&q=60',
    'https://cdn.pixabay.com/photo/2023/09/04/20/39/cake-8233676_640.jpg',
    'https://images.radio-canada.ca/q_auto,w_1200/v1/alimentation/recette/16x9/0025-gateau-truffe-choco-orange.jpg',
    'https://images.unsplash.com/photo-1642781148581-64443eaa8dd5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    'https://images.unsplash.com/photo-1608514737591-8d9be34beeb7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDZ8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
  ];

  nextImage() {
    if (currentSelected == cardImageUrl.length - 1) {
      currentSelected = 0;
    } else {
      int newlySelected = currentSelected + 1;
      currentSelected = newlySelected;
    }
  }

  previousImage() {
    if (currentSelected == 0) {
      currentSelected = 0;
    } else {
      int newlySelected = currentSelected - 1;
      currentSelected = newlySelected;
    }
  }

  DotsIndicator buildDotsIndicator() {
    return DotsIndicator(
      dotsCount: cardImageUrl.length,
      position: currentSelected,
      decorator: DotsDecorator(
        activeColor: Colors.amber,
        color: Colors.grey,
        size: const Size.square(3),
        activeSize: const Size(20.0, 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
