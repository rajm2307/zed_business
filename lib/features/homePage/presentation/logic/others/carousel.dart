import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselBanners extends StatelessWidget {
  final List<String> imageList = [
    'assets/png/banner_1.png',
    'assets/png/banner_2.png',
    'assets/png/banner_3.png',
  ];

  CarouselBanners({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        items: imageList.map((imagePath) {
          return Container(
            margin: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          );
        }).toList(),
        options: CarouselOptions(
          height: 230.0,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 300),
          viewportFraction: 1,
        ),
      ),
    );
  }
}
