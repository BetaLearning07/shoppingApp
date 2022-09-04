import 'package:shopping_app/data/home_model.dart';
import 'package:flutter/material.dart';

import '../../widgets/index.dart';

class BrandSwiper extends StatelessWidget {
  final List<Brands>? brands;
  const BrandSwiper({Key? key, required this.brands}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 16.0, right: 0, bottom: 2.0, left: 0),
      child: Column(
        children: <Widget>[
          const LeftTitle(
            title: 'Top Brands',
          ),
          Container(
            height: 120,
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: brands!.length,
              itemBuilder: (context, index) {
                Brands item = brands![index];
                return _buildBrandItem(context, item);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBrandItem(BuildContext context, Brands branad) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: const EdgeInsets.only(right: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 100.0,
              width: 100.0,
              padding: const EdgeInsets.all(8),
              child: HostedImage(
                asdpectRatio: 1.0,
                imageurl: branad.image!,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
