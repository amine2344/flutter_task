import 'package:flutter/material.dart';
import 'package:task_code/constants/card_data.dart';
import 'package:task_code/constants/colors.dart';

//detail page of the image

class DetailPage extends StatefulWidget {
  const DetailPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: bgColor,
      ),
      body: GestureDetector(
        onHorizontalDragEnd: (dragEndDetails) {
          setState(() {
            if (dragEndDetails.primaryVelocity! < 0) {
              buildNextImage();
            } else if (dragEndDetails.primaryVelocity! > 0) {
              buildPreviousImage();
            }
          });
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(CardData().cardImageUrl[currentSelected]),
            ),
          ),
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
    );
  }
}
