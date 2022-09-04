import 'package:shopping_app/theme/colors.dart';
import 'package:shopping_app/theme/device_size_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/product_detail_image.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: AppColors.white,
            pinned: false,
            snap: true,
            floating: true,
            expandedHeight: getHeight.h / 2.2,
            flexibleSpace: FlexibleSpaceBar(
                background: ProductDetailImageWidget(
              imageList: prodDetail['product']['images'],
            )),
          ),
          const SliverToBoxAdapter(),
        ],
      ),
    );
  }
}

Map prodDetail = {
  "status_code": 202,
  "product": {
    "id": 11516,
    "title": "Casual Wear Grey PVC Flip-Flops a206",
    "images": [
      "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0111-5947-ea470fb9-89ca-4cca-9f82-4061f58390f02022-01-59-Jul-1656656987.JPG",
      "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0111-5946-c72a3e71-0119-448d-a4bc-efd6f9f475a12022-01-59-Jul-1656656986.jpg",
      "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0111-5947-38d96ffc-3398-4465-b4dc-122157ddf49e2022-01-59-Jul-1656656987.JPG",
      "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0111-5947-54c4511e-4b9f-4468-8911-9b8aea05dc072022-01-59-Jul-1656656987.JPG"
    ],
    "slug": "casual-wear-grey-pvc-flip-flops-a206",
    "short_description":
        "Regular and Casual Wear Flip- Flops for both Men and Boys( Size- 6, 7, 8, 9, 10, 11)",
    "category": 1414,
    "pricing": {"id": 14994, "price": "150.57", "moq": 8, "unit": "Pair"},
    "created_at": "2022-06-30",
    "stock": true,
    "favourite": false,
    "status": 51,
    "delivery": {
      "title": "PRODUCT DELIVERY",
      "rate": 99,
      "text": "₹99 | Flat Delivery Charge"
    },
    "payment": {
      "title": "PAYMENT OPTIONS",
      "text": "Cash on Delivery & Online Payment Available"
    },
    "return_days": {
      "title": "PRODUCT RETURN",
      "rate": 4,
      "text":
          "4 Days return policy available. If there is any issue with your product, you can raise a return request"
    },
    "discount": {"rate": 2, "text": "2.0% Extra Discount on Online Payment"},
    "seller": {
      "id": 23358,
      "name": "Dagna Sales",
      "city": "New Delhi",
      "region": "Delhi"
    }
  },
  "specification": [
    {"name": "Ideal For", "values": "Men, Boys"},
    {"name": "Footwear Size", "values": "6, 7, 8, 9, 10, 11"},
    {"name": "Color", "values": "Grey"},
    {"name": "Upper Materials", "values": "Rexine"},
    {
      "name": "Occasion",
      "values": "Regular Wear, Casual Wear, Summer Wear, Night/Lounge Wear"
    },
    {"name": "Sole Material", "values": "PVC"},
    {"name": "Packaging Type", "values": "In Loose"},
    {"name": "Product Design/Pattern", "values": "Slipper"},
    {"name": "Product Code", "values": "a206"}
  ],
  "seller_products": [
    {
      "id": 11876,
      "title": "Casual Wear Yellow PVC Flip-Flops a389",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-2111-5338-dcc89465-ae8d-4680-8673-cf8d8b4d0d772022-21-53-Jul-1658384618.JPG",
      "short_description":
          "Regular and Casual Wear Flip- Flops for both Men and Boys( Size- 6, 7, 8, 9, 10, 11)",
      "category": 1414,
      "pricing": {"id": 15444, "price": "150.57", "moq": 8, "unit": "Pair"},
      "favourite": true,
      "created_at": "2022-07-21",
      "status": 51
    },
    {
      "id": 11626,
      "title": "Casual Wear Black PVC Flip-Flops a562",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0712-2042-5bfa2a74-9cc0-4edc-ac12-8d468239f57b2022-07-20-Jul-1657176642.JPG",
      "short_description":
          "Regular and Casual Wear Flip- Flops for both Men and Boys( Size- 6, 7, 8, 9, 10, 11)",
      "category": 1414,
      "pricing": {"id": 15117, "price": "245.58", "moq": 8, "unit": "Pair"},
      "favourite": true,
      "created_at": "2022-07-07",
      "status": 51
    },
    {
      "id": 11625,
      "title": "Casual Wear Yellow PVC Flip-Flops a561",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0711-5605-b60ba7f1-2112-432d-b99f-681f8963ce402022-07-56-Jul-1657175165.jpg",
      "short_description":
          "Regular and Casual Wear Flip- Flops for both Men and Boys( Size- 6, 7, 8, 9, 10, 11)",
      "category": 1414,
      "pricing": {"id": 15116, "price": "245.58", "moq": 8, "unit": "Pair"},
      "favourite": true,
      "created_at": "2022-07-07",
      "status": 51
    },
    {
      "id": 11624,
      "title": "Casual Wear Grey PVC Flip-Flops a546",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0711-1423-7242dca6-247f-4908-a0fe-8185e08b71be2022-07-14-Jul-1657172663.jpg",
      "short_description":
          "Regular and Casual Wear Flip- Flops for both Men and Boys( Size- 6, 7, 8, 9, 10, 11)",
      "category": 1414,
      "pricing": {"id": 15113, "price": "245.58", "moq": 8, "unit": "Pair"},
      "favourite": true,
      "created_at": "2022-07-07",
      "status": 51
    }
  ],
  "similarproducts": [
    {
      "id": 11876,
      "title": "Casual Wear Yellow PVC Flip-Flops a389",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-2111-5338-dcc89465-ae8d-4680-8673-cf8d8b4d0d772022-21-53-Jul-1658384618.JPG",
      "short_description":
          "Regular and Casual Wear Flip- Flops for both Men and Boys( Size- 6, 7, 8, 9, 10, 11)",
      "category": 1414,
      "pricing": {"id": 15444, "price": "150.57", "moq": 8, "unit": "Pair"},
      "favourite": false,
      "created_at": "2022-07-21",
      "status": 51
    },
    {
      "id": 11752,
      "title": "Multicolor Comfy Rubber Slippers for Men 01",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-1513-2619-e13e5711-ed4f-45e1-97a9-367a50ce2fec2022-15-26-Jul-1657871779.png",
      "short_description": "Regular Wear Slippers for Men and Boys\r\n",
      "category": 1414,
      "pricing": {"id": 15296, "price": "139.78", "moq": 24, "unit": "Pair"},
      "favourite": false,
      "created_at": "2022-07-15",
      "status": 51
    },
    {
      "id": 11751,
      "title": "Multicolor Comfy EVA Slippers for Men 01",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-1513-2543-d3f67e57-27d1-431d-8016-01c6fb7ff1cf2022-15-25-Jul-1657871743.jpeg",
      "short_description": "Regular Wear Slippers for Men and Boys\r\n",
      "category": 1414,
      "pricing": {"id": 15295, "price": "93.19", "moq": 24, "unit": "Pair"},
      "favourite": false,
      "created_at": "2022-07-15",
      "status": 51
    },
    {
      "id": 11750,
      "title": "Multicolor Comfy EVA Slippers for Men",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-1513-2348-fd9d43a1-52c0-40ea-802c-ff4a168c76d42022-15-23-Jul-1657871628.png",
      "short_description": "Regular Wear Slippers for Men and Boys\r\n",
      "category": 1414,
      "pricing": {"id": 15294, "price": "93.19", "moq": 24, "unit": "Pair"},
      "favourite": false,
      "created_at": "2022-07-15",
      "status": 51
    },
    {
      "id": 11749,
      "title": "Multicolor Comfy Rubber Slippers for Men",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-1513-2207-bb225116-5bb5-4423-b1b5-5fc0fe6c5b572022-15-22-Jul-1657871527.jpeg",
      "short_description": "Regular Wear Slippers for Men and Boys\r\n",
      "category": 1414,
      "pricing": {"id": 15293, "price": "128.14", "moq": 24, "unit": "Pair"},
      "favourite": false,
      "created_at": "2022-07-15",
      "status": 51
    },
    {
      "id": 11704,
      "title": "Multicolor Comfy Slippers for Men- Multicolor",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-1312-1258-fc4233e7-fa39-4e47-b5b1-84c6b663e6d32022-13-12-Jul-1657694578.png",
      "short_description": "Regular Wear Slippers for Men and Boys\r\n",
      "category": 1414,
      "pricing": {"id": 15235, "price": "64.07", "moq": 12, "unit": "Pair"},
      "favourite": false,
      "created_at": "2022-07-13",
      "status": 51
    },
    {
      "id": 11626,
      "title": "Casual Wear Black PVC Flip-Flops a562",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0712-2042-5bfa2a74-9cc0-4edc-ac12-8d468239f57b2022-07-20-Jul-1657176642.JPG",
      "short_description":
          "Regular and Casual Wear Flip- Flops for both Men and Boys( Size- 6, 7, 8, 9, 10, 11)",
      "category": 1414,
      "pricing": {"id": 15117, "price": "245.58", "moq": 8, "unit": "Pair"},
      "favourite": false,
      "created_at": "2022-07-07",
      "status": 51
    },
    {
      "id": 11625,
      "title": "Casual Wear Yellow PVC Flip-Flops a561",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0711-5605-b60ba7f1-2112-432d-b99f-681f8963ce402022-07-56-Jul-1657175165.jpg",
      "short_description":
          "Regular and Casual Wear Flip- Flops for both Men and Boys( Size- 6, 7, 8, 9, 10, 11)",
      "category": 1414,
      "pricing": {"id": 15116, "price": "245.58", "moq": 8, "unit": "Pair"},
      "favourite": false,
      "created_at": "2022-07-07",
      "status": 51
    },
    {
      "id": 11624,
      "title": "Casual Wear Grey PVC Flip-Flops a546",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0711-1423-7242dca6-247f-4908-a0fe-8185e08b71be2022-07-14-Jul-1657172663.jpg",
      "short_description":
          "Regular and Casual Wear Flip- Flops for both Men and Boys( Size- 6, 7, 8, 9, 10, 11)",
      "category": 1414,
      "pricing": {"id": 15113, "price": "245.58", "moq": 8, "unit": "Pair"},
      "favourite": false,
      "created_at": "2022-07-07",
      "status": 51
    },
    {
      "id": 11622,
      "title": "Casual Wear Red PVC Flip-Flops a549",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0711-3607-7b050da8-96af-422e-b113-f267ae1acce32022-07-36-Jul-1657173967.jpg",
      "short_description":
          "Regular and Casual Wear Flip- Flops for both Men and Boys( Size- 6, 7, 8, 9, 10, 11)",
      "category": 1414,
      "pricing": {"id": 15115, "price": "245.58", "moq": 8, "unit": "Pair"},
      "favourite": false,
      "created_at": "2022-07-06",
      "status": 51
    }
  ]
};
