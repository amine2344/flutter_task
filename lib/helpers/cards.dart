import 'dart:async';

import 'package:flutter/material.dart';
import 'package:task_code/constants/card_data.dart';
import 'package:task_code/constants/details_pic.dart';

class Cards extends StatefulWidget {
  const Cards({super.key});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  Timer? _timer;

  void buildNextImage() {
    setState(() {
      CardData().nextImage();
    });
  }

  void buildPreviousImage() {
    setState(() {
      CardData().previousImage();
    });
  }

  Widget rebuildDotIndicator() {
    return CardData().buildDotsIndicator();
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      setState(() {
        buildNextImage();
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
      child: GestureDetector(
        /* onHorizontalDragEnd: (dragEndDetails) {
          setState(() {
            if (dragEndDetails.primaryVelocity! < 0) {
              buildNextImage();
            } else if (dragEndDetails.primaryVelocity! > 0) {
              buildPreviousImage();
            }
          });
        }, */ 
        onTap: () {
          setState(() {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const DetailPage()));
          });
        },
        child: AnimatedSwitcher(
          duration: Duration(seconds: 1),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: Container(
            key: ValueKey<int>(currentSelected),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(CardData().cardImageUrl[currentSelected]),
                fit: BoxFit.cover,
              ),
            ),
            height: 150,
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  left: 0,
                  bottom: 10,
                  child: rebuildDotIndicator(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
