import 'package:ecom_thin_ui/theme/colors.dart';
import 'package:ecom_thin_ui/theme/ui_helper.dart';
import 'package:ecom_thin_ui/widgets/hosted_image.dart';
import 'package:ecom_thin_ui/widgets/no_data_found.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

GlobalKey<FormState>? _menuKey;

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: false,
            snap: true,
            floating: true,
            title: Text(
              'Wishlist',
            ),
          ),
          WishlistCard(),
        ],
      ),
    );
  }
}

class WishlistCard extends StatelessWidget {
  const WishlistCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;

    return wishListData['wishlists'].length == 0
        ? const SliverToBoxAdapter(
            child: NoDataFound(
              title: 'No saved items found',
            ),
          )
        : SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: shortestSide < 600 ? 2 : 3,
              childAspectRatio: 1 / 1.35,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                var data = wishListData['wishlists'][index];
                return InkWell(
                  onTap: null,
                  child: Stack(
                    children: [
                      Card(
                        margin: EdgeInsets.all(3.sp),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 8,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                child: HostedImage(
                                    imageurl: data['product']['image'],
                                    asdpectRatio: 1.0),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8.0),
                                    child: Text(
                                      data['product']['title'],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2!
                                          .copyWith(
                                              fontWeight: FontWeight.normal,
                                              color:
                                                  AppColors.primaryGreyText2),
                                    ),
                                  ),
                                  UIHelper.verticalSpaceSmall(),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child:
                                                Text.rich(TextSpan(children: [
                                              TextSpan(
                                                text: '\u20B9 ',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle2!
                                                    .copyWith(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: AppColors
                                                          .primaryGreyText2,
                                                    ),
                                              ),
                                              TextSpan(
                                                text:
                                                    '${data['product']['pricing']['price']}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        letterSpacing: -.5),
                                              )
                                            ]))),
                                      ),
                                      const Expanded(
                                        child: Padding(
                                            padding:
                                                EdgeInsets.only(right: 8.0),
                                            child: HostedImage(
                                                imageurl:
                                                    'https://aseztak.ap-south-1.linodeobjects.com/notification/92fbab5f-ec07-421e-a010-ef65bc6887f5.png',
                                                asdpectRatio: 7)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                          right: 3,
                          top: 5,
                          child: PopupMenuButton(
                            icon: Icon(
                              Icons.more_vert,
                              size: 20.sp,
                            ),
                            key: _menuKey,
                            itemBuilder: (_) => <PopupMenuItem<String>>[
                              PopupMenuItem<String>(
                                onTap: () async {},
                                // child: Text('Imactive'),
                                child: const Text('Buy Now'),
                              ),
                              const PopupMenuItem<String>(
                                enabled: true,
                                child: Text('Remove'),
                              ),
                            ],
                          ))
                    ],
                  ),
                );
              },
              childCount: wishListData['wishlists'].length,
            ),
          );
  }
}

Map wishListData = {
  "status_code": 200,
  "wishlists": [
    {
      "id": 50079,
      "product": {
        "id": 11585,
        "title": "Multicolor Regular Wear Mens T-Shirts",
        "description": "Men's Tshirt in Dotknit fabric.",
        "image":
            "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0217-5012-e7c955f3-9e0c-48be-a57c-72eaef79ba9d2022-02-50-Jul-1656764412.jpg",
        "pricing": {"price": "126.18", "moq": 12, "unit": "Pcs"}
      }
    },
    {
      "id": 50692,
      "product": {
        "id": 10921,
        "title": "Hip Hop Design Unisex Pullovers- FREE SIZE",
        "description": "awesome printed pullover",
        "image":
            "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0116-2246-e2ef189a-6c29-480b-98f8-85ce439c056e2022-01-22-Jul-1656672766.png",
        "pricing": {"price": "391.70", "moq": 6, "unit": "Pcs"}
      }
    },
    {
      "id": 50694,
      "product": {
        "id": 6904,
        "title": "Multicolor Woollen Blend Sweaters for Men 001",
        "description": "Clothing Varieties your customers will like",
        "image":
            "https://aseztak.ap-south-1.linodeobjects.com/products/61c343795b57a_168096373-thumbnail.jpg",
        "pricing": {"price": "472.41", "moq": 3, "unit": "Pcs"}
      }
    },
    {
      "id": 50695,
      "product": {
        "id": 6901,
        "title": "Multicolor Woollen Blend Sweaters for Men",
        "description": "Clothing Varieties your customers will like",
        "image":
            "https://aseztak.ap-south-1.linodeobjects.com/products/61c329e745d75_664824501-thumbnail.jpg",
        "pricing": {"price": "452.78", "moq": 3, "unit": "Pcs"}
      }
    },
    {
      "id": 50079,
      "product": {
        "id": 11585,
        "title": "Multicolor Regular Wear Mens T-Shirts",
        "description": "Men's Tshirt in Dotknit fabric.",
        "image":
            "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0217-5012-e7c955f3-9e0c-48be-a57c-72eaef79ba9d2022-02-50-Jul-1656764412.jpg",
        "pricing": {"price": "126.18", "moq": 12, "unit": "Pcs"}
      }
    },
    {
      "id": 50692,
      "product": {
        "id": 10921,
        "title": "Hip Hop Design Unisex Pullovers- FREE SIZE",
        "description": "awesome printed pullover",
        "image":
            "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0116-2246-e2ef189a-6c29-480b-98f8-85ce439c056e2022-01-22-Jul-1656672766.png",
        "pricing": {"price": "391.70", "moq": 6, "unit": "Pcs"}
      }
    },
    {
      "id": 50694,
      "product": {
        "id": 6904,
        "title": "Multicolor Woollen Blend Sweaters for Men 001",
        "description": "Clothing Varieties your customers will like",
        "image":
            "https://aseztak.ap-south-1.linodeobjects.com/products/61c343795b57a_168096373-thumbnail.jpg",
        "pricing": {"price": "472.41", "moq": 3, "unit": "Pcs"}
      }
    },
    {
      "id": 50695,
      "product": {
        "id": 6901,
        "title": "Multicolor Woollen Blend Sweaters for Men",
        "description": "Clothing Varieties your customers will like",
        "image":
            "https://aseztak.ap-south-1.linodeobjects.com/products/61c329e745d75_664824501-thumbnail.jpg",
        "pricing": {"price": "452.78", "moq": 3, "unit": "Pcs"}
      }
    },
    {
      "id": 50079,
      "product": {
        "id": 11585,
        "title": "Multicolor Regular Wear Mens T-Shirts",
        "description": "Men's Tshirt in Dotknit fabric.",
        "image":
            "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0217-5012-e7c955f3-9e0c-48be-a57c-72eaef79ba9d2022-02-50-Jul-1656764412.jpg",
        "pricing": {"price": "126.18", "moq": 12, "unit": "Pcs"}
      }
    },
    {
      "id": 50692,
      "product": {
        "id": 10921,
        "title": "Hip Hop Design Unisex Pullovers- FREE SIZE",
        "description": "awesome printed pullover",
        "image":
            "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0116-2246-e2ef189a-6c29-480b-98f8-85ce439c056e2022-01-22-Jul-1656672766.png",
        "pricing": {"price": "391.70", "moq": 6, "unit": "Pcs"}
      }
    },
    {
      "id": 50694,
      "product": {
        "id": 6904,
        "title": "Multicolor Woollen Blend Sweaters for Men 001",
        "description": "Clothing Varieties your customers will like",
        "image":
            "https://aseztak.ap-south-1.linodeobjects.com/products/61c343795b57a_168096373-thumbnail.jpg",
        "pricing": {"price": "472.41", "moq": 3, "unit": "Pcs"}
      }
    },
    {
      "id": 50695,
      "product": {
        "id": 6901,
        "title": "Multicolor Woollen Blend Sweaters for Men",
        "description": "Clothing Varieties your customers will like",
        "image":
            "https://aseztak.ap-south-1.linodeobjects.com/products/61c329e745d75_664824501-thumbnail.jpg",
        "pricing": {"price": "452.78", "moq": 3, "unit": "Pcs"}
      }
    }
  ],
  "total_items": 5,
  "current_page": 1,
  "total_pages": 1
};
