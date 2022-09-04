import 'package:shopping_app/widgets/index.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class BannerSwiper extends StatefulWidget {
  const BannerSwiper({Key? key}) : super(key: key);
  @override
  State<BannerSwiper> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerSwiper> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      setState(() {
        Future.delayed(const Duration(microseconds: 1000), () {
          if (_currentPage < 3) {
            _currentPage++;
          } else {
            _currentPage = 0;
          }
        });

        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 800),
          curve: Curves.ease,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 2.25,
        child: Container(
            margin: const EdgeInsets.only(left: 5, right: 5, top: 5),
            child: PageView(
                onPageChanged: (ind) {
                  _currentPage = ind;
                },
                controller: _pageController,
                children: List.generate(4, (index) {
                  return HostedImage(
                    imageurl: bannerList[index],
                    asdpectRatio: 1.9,
                  );
                }))));
  }
}

List bannerList = [
  'https://aseztak.ap-south-1.linodeobjects.com/banners/1ccdba8b-5d16-473e-a0cd-1b72679d5b4c.jpg',
  'https://aseztak.ap-south-1.linodeobjects.com/banners/98e25881-3602-4505-ae8d-9246b899fd91.jpg',
  'https://aseztak.ap-south-1.linodeobjects.com/banners/4b69c198-4e55-4e5c-8541-a7d5a1039f92.jpg',
  'https://aseztak.ap-south-1.linodeobjects.com/banners/484223fe-428b-4f91-99b4-7e4f5bc9e7f0.com-gif-maker%20(1)'
];
