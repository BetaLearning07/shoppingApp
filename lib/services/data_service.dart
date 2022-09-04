import 'package:shopping_app/data/categories_model.dart';
import 'package:shopping_app/data/home_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeDataProvider = Provider((ref) {
  final d = HomeModel.fromJson(homeData1);
  return d;
});

final categoriesDataProvider = Provider((ref) {
  final d = CaegoriesModel.fromJson(categoriesData);
  return d;
});

final homeData1 = {
  "status_code": 200,
  "offer": false,
  "categories": [
    {
      "id": 5,
      "name": "Men",
      "slug": "men",
      "description":
          "All types of Men's Garments. T-Shirt, Jeans, Shirt, Winter & Seasonal, Sports Wear, Formal Wear, Ethnic Wear, Inner Wear etc.",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/categories/8mWOgetYqERKXbNdKihew5YtJ.png",
      "status": 1,
      "haschild": true
    },
    {
      "id": 6,
      "name": "Women",
      "slug": "women",
      "description":
          "All types of Women's Garments. Western Clothing, Women Ethnic, Winter & Seasonal Clothing, Women Nightwear, Sportswear, Inner wear etc.",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/categories/xkxuJ2B5Z3UCTpsngS2w5oWyI.png",
      "status": 1,
      "haschild": true
    },
    {
      "id": 7,
      "name": "Kids",
      "slug": "kids",
      "description": "All types of baby & kid's clothing, school supplies etc.",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/categories/pvMt6KZo4qV5NCoIZmrqbqRnT.png",
      "status": 1,
      "haschild": true
    },
    {
      "id": 1391,
      "name": "Home and Appliances",
      "slug": "home-and-appliances",
      "description":
          "All types of home furnishing items. Pillow Covers, Towels/Gamchha, Curtains/Curtains (Parda), Bedding Sets, Blankets, Bedsheets, Pillows & Cusions etc.",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/categories/YFEXs75cY6vFGcXjnQVoawKgV.png",
      "status": 1,
      "haschild": true
    },
    {
      "id": 1409,
      "name": "Men's Footwear",
      "slug": "mens-footwear",
      "description":
          "Men's Casual Shoes, Sport Shoes, Formal Shoes,, Sandals & Floaters, Slippers & Flip-Flops, Ethnic Shoes, Boots, Clogs.",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/categories/mbr9a8FIjCbFU8NcLmDm5agIR.png",
      "status": 1,
      "haschild": true
    }
  ],
  "banners": [
    {
      "id": 255,
      "banner":
          "https://aseztak.ap-south-1.linodeobjects.com/banners/7b06bbb9-e3db-4b57-bba1-7de29502c222.gif"
    },
    {
      "id": 248,
      "banner":
          "https://aseztak.ap-south-1.linodeobjects.com/banners/3a59deb0-3a6f-4feb-929a-b81d983ab6a9.jpg"
    },
    {
      "id": 237,
      "banner":
          "https://aseztak.ap-south-1.linodeobjects.com/banners/cd3466d7-754a-407e-a7f3-c0e4f3260b2a.jpg"
    },
    {
      "id": 217,
      "banner":
          "https://aseztak.ap-south-1.linodeobjects.com/banners/9a16eb84-72ec-4c3b-84a8-1fd62ce6216a.jpg"
    }
  ],
  "widgets": [
    {
      "id": 13,
      "widget_name": "grid_widget_crossaxis_2",
      "title": "You are here to??",
      "description": "Buy products according to your shop ",
      "no_of_images": 2,
      "items": [
        {
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2018-0110-222b950e-307b-444f-8cb1-e6f26492c35e2022-20-01-Jun-1655728270.jpg",
          "go_to": "searchview",
          "id": 1956
        },
        {
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2018-0117-9f78409e-545b-466b-ad37-4b0c2934347c2022-20-01-Jun-1655728277.jpg",
          "go_to": "searchview",
          "id": 1760
        }
      ]
    },
    {
      "id": 3,
      "widget_name": "widget_3",
      "title": "NEW SEASON STYLES",
      "description": "Grab the best for your store",
      "no_of_images": 3,
      "items": [
        {
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2412-2400-e5affdea-7820-4fc9-a872-d097f2df770a2022-24-24-Jun-1656053640.gif",
          "go_to": "searchview",
          "id": 1738
        },
        {
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2018-0348-f8c3e85a-0fb6-45bc-90d7-6e564205fded2022-20-03-Jun-1655728428.jpg",
          "go_to": "categories_view",
          "id": 1391
        },
        {
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2412-2409-a582afc3-0cb2-4c8d-b080-2511fd7e58aa2022-24-24-Jun-1656053649.jpg",
          "go_to": "searchview",
          "id": 158
        }
      ]
    },
    {
      "id": 4,
      "widget_name": "widget_1",
      "title": "Trendy Flip-Flops for Men and Women",
      "description": "",
      "no_of_images": 1,
      "items": [
        {
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/widgets/202207-0118-3644-daa57b22-fdb3-4468-8b37-5cc244ae6df22022-01-36-Jul-1656680804.gif",
          "go_to": "searchview",
          "id": 2002
        }
      ]
    },
    {
      "id": 8,
      "widget_name": "grid_widget_crossaxis_4",
      "title": "Shop According to your Budget",
      "description": "Trendy Garments and Footwears. Don't Miss Out!",
      "no_of_images": 4,
      "items": [
        {
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2018-0435-4a52a32f-06a8-40ff-87e8-17101269a2952022-20-04-Jun-1655728475.jpg",
          "go_to": "searchview",
          "id": 1848
        },
        {
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2018-0443-f5a173b7-8e65-4905-b746-323ba70bf9012022-20-04-Jun-1655728483.jpg",
          "go_to": "searchview",
          "id": 1849
        },
        {
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2018-0449-2344df0e-1d03-4b35-8edd-06541b989e922022-20-04-Jun-1655728489.jpg",
          "go_to": "searchview",
          "id": 1850
        },
        {
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2018-0454-919ca8a9-a321-46d7-9483-154b589db69c2022-20-04-Jun-1655728494.jpg",
          "go_to": "searchview",
          "id": 1851
        }
      ]
    },
    {
      "id": 6,
      "widget_name": "grid_widget_crossaxis_2",
      "title": "Trending Designs from Top Cities",
      "description": "",
      "no_of_images": 8,
      "items": [
        {
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2112-3700-d9fc866e-e35c-4671-9d17-47918bade3762022-21-37-Jun-1655795220.jpg",
          "go_to": "searchview",
          "id": 1806
        },
        {
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2018-0607-5b6c00d0-7d12-4bd3-b8b5-5f012f998a552022-20-06-Jun-1655728567.jpg",
          "go_to": "searchview",
          "id": 1874
        },
        {
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2018-0626-f9900979-51e8-4e3c-8467-0f2f0a6a87562022-20-06-Jun-1655728586.jpg",
          "go_to": "searchview",
          "id": 1987
        },
        {
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2018-0642-72fbda85-b45e-4954-9788-cf9180fc5cfc2022-20-06-Jun-1655728602.jpg",
          "go_to": "searchview",
          "id": 1989
        },
        {
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2018-0701-3fcb04f7-13c0-4943-a9d5-666762e243642022-20-07-Jun-1655728621.jpg",
          "go_to": "searchview",
          "id": 1988
        },
        {
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2018-0714-ebf70ad1-dd28-4f3c-aa72-a681858f35c02022-20-07-Jun-1655728634.jpg",
          "go_to": "searchview",
          "id": 1990
        }
      ]
    },
    {
      "id": 5,
      "widget_name": "grid_widget_crossaxis_4",
      "title": "Top Brands from Aseztak",
      "description": "",
      "no_of_images": 8,
      "items": [
        {
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2018-1922-c9e189ec-1064-483d-a2ca-498f0cb4a97c2022-20-19-Jun-1655729362.jpg",
          "go_to": "product_brandwise",
          "id": 9
        },
        {
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2018-1929-514bb74d-ff62-415a-89e0-110cc19159462022-20-19-Jun-1655729369.jpg",
          "go_to": "product_brandwise",
          "id": 20
        },
        {
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2018-1935-143ce542-dc4e-45ee-999d-18f0e16cbcbe2022-20-19-Jun-1655729375.jpg",
          "go_to": "product_brandwise",
          "id": 36
        },
        {
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2018-1942-cb1e3ae5-604b-4c87-b0a9-fb7e609189022022-20-19-Jun-1655729382.jpg",
          "go_to": "product_brandwise",
          "id": 44
        },
        {
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2018-1948-00a0ffdc-90f3-4979-ade2-c8fc714cd31b2022-20-19-Jun-1655729388.jpg",
          "go_to": "product_brandwise",
          "id": 31
        },
        {
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2018-1954-e78bea75-3e8e-41ad-a10d-e7c3160ce6f22022-20-19-Jun-1655729394.jpg",
          "go_to": "product_brandwise",
          "id": 102
        },
        {
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2018-2001-26aeab8a-43d9-4719-91b9-126554488f692022-20-20-Jun-1655729401.jpg",
          "go_to": "product_brandwise",
          "id": 57
        },
        {
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2018-2008-8fa0c27e-126c-42b6-8145-6a42bb1e42f92022-20-20-Jun-1655729408.jpg",
          "go_to": "product_brandwise",
          "id": 28
        }
      ]
    },
    {
      "id": 9,
      "widget_name": "horizontal_slidable_widget",
      "title": "Explore the Most Trending Garments",
      "description": "T-Shirts, Half Pants, Jeans, Track Pants & many more",
      "no_of_images": 5,
      "items": [
        {
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2018-1103-a65d9999-256e-4d1e-9cad-9d87362798882022-20-11-Jun-1655728863.jpg",
          "go_to": "searchview",
          "id": 1192
        },
        {
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2018-1126-c65be3a4-efcb-459d-8f14-3a9220c257262022-20-11-Jun-1655728886.jpg",
          "go_to": "searchview",
          "id": 174
        },
        {
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2018-1150-a9e2d79c-c1c3-421d-b912-b165ddb388ac2022-20-11-Jun-1655728910.jpg",
          "go_to": "searchview",
          "id": 45
        },
        {
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2018-1203-a9fa0656-b2a4-48b2-8476-be4e7829e19e2022-20-12-Jun-1655728923.jpg",
          "go_to": "searchview",
          "id": 59
        },
        {
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2113-0417-b5d25c66-efba-4234-bb2d-18b96f7549c32022-21-04-Jun-1655796857.jpg",
          "go_to": "searchview",
          "id": 504
        }
      ]
    }
  ],
  "brands": [
    {
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2018-1922-c9e189ec-1064-483d-a2ca-498f0cb4a97c2022-20-19-Jun-1655729362.jpg",
      "go_to": "product_brandwise",
      "id": 9
    },
    {
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2018-1929-514bb74d-ff62-415a-89e0-110cc19159462022-20-19-Jun-1655729369.jpg",
      "go_to": "product_brandwise",
      "id": 20
    },
    {
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2018-1935-143ce542-dc4e-45ee-999d-18f0e16cbcbe2022-20-19-Jun-1655729375.jpg",
      "go_to": "product_brandwise",
      "id": 36
    },
    {
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2018-1942-cb1e3ae5-604b-4c87-b0a9-fb7e609189022022-20-19-Jun-1655729382.jpg",
      "go_to": "product_brandwise",
      "id": 44
    },
    {
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2018-1948-00a0ffdc-90f3-4979-ade2-c8fc714cd31b2022-20-19-Jun-1655729388.jpg",
      "go_to": "product_brandwise",
      "id": 31
    },
    {
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2018-1954-e78bea75-3e8e-41ad-a10d-e7c3160ce6f22022-20-19-Jun-1655729394.jpg",
      "go_to": "product_brandwise",
      "id": 102
    },
    {
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2018-2001-26aeab8a-43d9-4719-91b9-126554488f692022-20-20-Jun-1655729401.jpg",
      "go_to": "product_brandwise",
      "id": 57
    },
    {
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2018-2008-8fa0c27e-126c-42b6-8145-6a42bb1e42f92022-20-20-Jun-1655729408.jpg",
      "go_to": "product_brandwise",
      "id": 28
    }
  ],
  "trending": [
    {
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2112-3700-d9fc866e-e35c-4671-9d17-47918bade3762022-21-37-Jun-1655795220.jpg",
      "go_to": "searchview",
      "id": 1806
    },
    {
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2018-0607-5b6c00d0-7d12-4bd3-b8b5-5f012f998a552022-20-06-Jun-1655728567.jpg",
      "go_to": "searchview",
      "id": 1874
    },
    {
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2018-0626-f9900979-51e8-4e3c-8467-0f2f0a6a87562022-20-06-Jun-1655728586.jpg",
      "go_to": "searchview",
      "id": 1987
    },
    {
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2018-0642-72fbda85-b45e-4954-9788-cf9180fc5cfc2022-20-06-Jun-1655728602.jpg",
      "go_to": "searchview",
      "id": 1989
    },
    {
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2018-0701-3fcb04f7-13c0-4943-a9d5-666762e243642022-20-07-Jun-1655728621.jpg",
      "go_to": "searchview",
      "id": 1988
    },
    {
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2018-0714-ebf70ad1-dd28-4f3c-aa72-a681858f35c02022-20-07-Jun-1655728634.jpg",
      "go_to": "searchview",
      "id": 1990
    }
  ],
  "products": [
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
      "status": 51,
      "category_name": "Mens",
      "brand": ""
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
      "status": 51,
      "category_name": "Mens",
      "brand": "Ckko"
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
      "status": 51,
      "category_name": "Womens",
      "brand": "Naulkha"
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
      "status": 51,
      "category_name": "Kids",
      "brand": "Jean & John"
    },
    {
      "id": 11620,
      "title": "Printed Vest For Women",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0617-5107-fa4c48ea-782f-47dc-a30e-b3ea70d2dced2022-06-51-Jul-1657110067.jpg",
      "short_description":
          "Color:- Mixed Color\r\nClothing Size:- L, XL, XXL\r\nNeck Type:- Round Neck\r\nFabric:- Cotton\r\nTop Type:-Regular Top",
      "category": 87,
      "pricing": {"id": 15107, "price": "65.83", "moq": 10, "unit": "Pcs"},
      "favourite": false,
      "created_at": "2022-07-06",
      "status": 51,
      "category_name": "Womens",
      "brand": ""
    },
    {
      "id": 11619,
      "title": "Stylish Banarasi Blouse 01",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0617-1806-3b808741-b6eb-4ace-a01f-7fd1506686be2022-06-18-Jul-1657108086.jpg",
      "short_description":
          "Fabric Type:- Banarasi Silk\r\nBlouse Stitch Type:-\tNon-Stitched\r\nNeck Type:-Round Neck\r\nSleeve:- 3/4 Sleeve",
      "category": 103,
      "pricing": {"id": 15106, "price": "154.71", "moq": 6, "unit": "Pcs"},
      "favourite": false,
      "created_at": "2022-07-06",
      "status": 51,
      "category_name": "Mens",
      "brand": "Shades"
    },
    {
      "id": 11618,
      "title": "Ladies Printed Rayon Top 02",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0616-5219-4326ac9b-bee8-453a-8d4f-07add68be1372022-06-52-Jul-1657106539.jpg",
      "short_description":
          "Ideal For :- Women\r\nClothing Size:- 4XL\r\nNeck Type:- Round Neck\r\nSleeve:- 3/4 Sleeve\r\nFabric:-Rayon",
      "category": 87,
      "pricing": {"id": 15105, "price": "151.41", "moq": 12, "unit": "Pcs"},
      "favourite": false,
      "created_at": "2022-07-06",
      "status": 51,
      "category_name": "Mens",
      "brand": ""
    },
    {
      "id": 11611,
      "title": "Kids Hood Suit Set 021",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0616-1823-0d0f76da-2462-4f0d-b146-ba69fd7e27cb2022-06-18-Jul-1657104503.jpg",
      "short_description": "100% cotton fabrics ",
      "category": 268,
      "pricing": {"id": 15103, "price": "202.98", "moq": 9, "unit": "Pcs"},
      "favourite": false,
      "created_at": "2022-07-06",
      "status": 51,
      "category_name": "Mens",
      "brand": "Akrauti"
    },
    {
      "id": 11610,
      "title": "Printed Kids Hood suit Dc -Full Sleeve",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0616-1220-db3626e6-95b9-4dd9-b091-fd1f8befd4fe2022-06-12-Jul-1657104140.jpg",
      "short_description": "100% Cotton Fabrics ",
      "category": 268,
      "pricing": {"id": 15102, "price": "202.98", "moq": 9, "unit": "Pcs"},
      "favourite": false,
      "created_at": "2022-07-06",
      "status": 51,
      "category_name": "Womens",
      "brand": ""
    },
    {
      "id": 11609,
      "title": "Casual Wear Black PVC Flip-Flops a548",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0711-2418-f5582bcc-3864-4948-bc5c-2771271e36532022-07-24-Jul-1657173258.jpg",
      "short_description":
          "Regular and Casual Wear Flip- Flops for both Men and Boys( Size- 6, 7, 8, 9, 10, 11)",
      "category": 1414,
      "pricing": {"id": 15114, "price": "245.58", "moq": 8, "unit": "Pair"},
      "favourite": false,
      "created_at": "2022-07-06",
      "status": 51,
      "category_name": "Womens",
      "brand": ""
    },
    {
      "id": 11608,
      "title": "Casual Wear Green PVC Flip-Flops a547",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0613-1037-2c50a8fb-4ee2-435b-b064-dd6dc236e2492022-06-10-Jul-1657093237.jpg",
      "short_description":
          "Regular and Casual Wear Flip- Flops for both Men and Boys( Size- 6, 7, 8, 9, 10, 11)",
      "category": 1414,
      "pricing": {"id": 15100, "price": "245.58", "moq": 8, "unit": "Pair"},
      "favourite": false,
      "created_at": "2022-07-06",
      "status": 51,
      "category_name": "Mens",
      "brand": "Ocean"
    },
    {
      "id": 11606,
      "title": "Casual Wear Navy PVC Flip-Flops a545",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0612-0311-705144a8-75ae-4057-ba9f-7c25d6d98f572022-06-03-Jul-1657089191.JPG",
      "short_description":
          "Regular and Casual Wear Flip- Flops for both Men and Boys( Size- 6, 7, 8, 9, 10, 11)",
      "category": 1414,
      "pricing": {"id": 15098, "price": "245.58", "moq": 8, "unit": "Pair"},
      "favourite": false,
      "created_at": "2022-07-06",
      "status": 51,
      "category_name": "Mens",
      "brand": ""
    },
    {
      "id": 11605,
      "title": "Casual Wear White PVC Flip-Flops a544",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0518-5329-cfc45182-fda6-44f3-b7e0-bb265432b0ed2022-05-53-Jul-1657027409.JPG",
      "short_description":
          "Regular and Casual Wear Flip- Flops for both Men and Boys( Size- 6, 7, 8, 9, 10, 11)",
      "category": 1414,
      "pricing": {"id": 15097, "price": "245.58", "moq": 8, "unit": "Pair"},
      "favourite": false,
      "created_at": "2022-07-05",
      "status": 51,
      "category_name": "Mens",
      "brand": "Ckko"
    },
    {
      "id": 11604,
      "title": "Casual Wear Green PVC Flip-Flops a543",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0518-4355-863de049-d4b5-4dd8-8d32-2c134a1fa8032022-05-43-Jul-1657026835.JPG",
      "short_description":
          "Regular and Casual Wear Flip- Flops for both Men and Boys( Size- 6, 7, 8, 9, 10, 11)",
      "category": 1414,
      "pricing": {"id": 15096, "price": "245.58", "moq": 8, "unit": "Pair"},
      "favourite": false,
      "created_at": "2022-07-05",
      "status": 51,
      "category_name": "Mens",
      "brand": "Ckko"
    },
    {
      "id": 11602,
      "title": "Casual Wear Black PVC Flip-Flops a542",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0518-1334-c294ea64-2f7b-450b-8870-dab82c6aeb6e2022-05-13-Jul-1657025014.jpg",
      "short_description":
          "Regular and Casual Wear Flip- Flops for both Men and Boys( Size- 6, 7, 8, 9, 10, 11)",
      "category": 1414,
      "pricing": {"id": 15092, "price": "245.58", "moq": 8, "unit": "Pair"},
      "favourite": false,
      "created_at": "2022-07-05",
      "status": 51,
      "category_name": "Mens",
      "brand": "Monster"
    },
    {
      "id": 11601,
      "title": "Casual Wear Maroon PVC Flip-Flops a541",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0518-0216-c0f28b92-20fa-43a9-ad18-6781e3121b902022-05-02-Jul-1657024336.jpg",
      "short_description":
          "Regular and Casual Wear Flip- Flops for both Men and Boys( Size- 6, 7, 8, 9, 10, 11)",
      "category": 1414,
      "pricing": {"id": 15091, "price": "245.58", "moq": 8, "unit": "Pair"},
      "favourite": false,
      "created_at": "2022-07-05",
      "status": 51,
      "category_name": "Mens",
      "brand": "Little Candy"
    },
    {
      "id": 11600,
      "title": "Casual Wear Grey PVC Flip-Flops a540",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0517-5110-c6d31b2d-8381-4bad-b212-98ed917fd52a2022-05-51-Jul-1657023670.jpg",
      "short_description":
          "Regular and Casual Wear Flip- Flops for both Men and Boys( Size- 6, 7, 8, 9, 10, 11)",
      "category": 1414,
      "pricing": {"id": 15090, "price": "245.58", "moq": 8, "unit": "Pair"},
      "favourite": false,
      "created_at": "2022-07-05",
      "status": 51,
      "category_name": "Mens",
      "brand": "Ckko"
    },
    {
      "id": 11598,
      "title": "Casual Wear White PVC Flip-Flops a539",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0517-0744-3b31a406-2a1e-45af-a43f-c086e98976262022-05-07-Jul-1657021064.jpg",
      "short_description":
          "Regular and Casual Wear Flip- Flops for both Men and Boys( Size- 6, 7, 8, 9, 10, 11)",
      "category": 1414,
      "pricing": {"id": 15088, "price": "245.58", "moq": 8, "unit": "Pair"},
      "favourite": false,
      "created_at": "2022-07-05",
      "status": 51,
      "category_name": "Mens",
      "brand": "Ckko"
    },
    {
      "id": 11597,
      "title": "Casual Wear Beige PVC Flip-Flops a538",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0516-4140-15b09f8c-338f-4ac7-a6b2-21067e5db8932022-05-41-Jul-1657019500.jpg",
      "short_description":
          "Regular and Casual Wear Flip- Flops for both Men and Boys( Size- 6, 7, 8, 9, 10, 11)",
      "category": 1414,
      "pricing": {"id": 15087, "price": "245.58", "moq": 8, "unit": "Pair"},
      "favourite": false,
      "created_at": "2022-07-05",
      "status": 51,
      "category_name": "Mens",
      "brand": "Ckko"
    },
    {
      "id": 11596,
      "title": "Casual Wear Black PVC Flip-Flops a537",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0516-2701-5c2165b1-eb1e-4b38-a3a6-3c90fc4e09802022-05-27-Jul-1657018621.JPG",
      "short_description":
          "Regular and Casual Wear Flip- Flops for both Men and Boys( Size- 6, 7, 8, 9, 10, 11)",
      "category": 1414,
      "pricing": {"id": 15086, "price": "245.58", "moq": 8, "unit": "Pair"},
      "favourite": false,
      "created_at": "2022-07-05",
      "status": 51,
      "category_name": "Mens",
      "brand": "Ckko"
    },
    {
      "id": 11595,
      "title": "Fancy Bulls Casual Shorts For Men",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0513-0021-4e10f6ba-4c8a-4de3-81dc-8b60791f5a252022-05-00-Jul-1657006221.png",
      "short_description": "New arrival readymade bulls half pant ",
      "category": 39,
      "pricing": {"id": 15085, "price": "160.19", "moq": 10, "unit": "Pcs"},
      "favourite": false,
      "created_at": "2022-07-05",
      "status": 51,
      "category_name": "Mens",
      "brand": "Ckko"
    },
    {
      "id": 11594,
      "title": "Fancy Elastic Half Pant Bulls 85",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0512-4738-aa4b9090-7779-4c50-8678-383039aeb1072022-05-47-Jul-1657005458.png",
      "short_description": "Bulls 85 hipop half pant",
      "category": 39,
      "pricing": {"id": 15084, "price": "160.19", "moq": 10, "unit": "Pcs"},
      "favourite": false,
      "created_at": "2022-07-05",
      "status": 51,
      "category_name": "Mens",
      "brand": "Ckko"
    },
    {
      "id": 11593,
      "title": "New Born Kids Hood Suit Set 01",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0420-1451-2a5848f2-4ef7-4f0a-a05c-ef892f3cae972022-04-14-Jul-1656945891.jpg",
      "short_description": "100% cotton fabrics ",
      "category": 268,
      "pricing": {"id": 15083, "price": "186.52", "moq": 6, "unit": "Pcs"},
      "favourite": false,
      "created_at": "2022-07-04",
      "status": 51,
      "category_name": "Mens",
      "brand": "Ckko"
    },
    {
      "id": 11591,
      "title": "Casual NS Half Pant For Men",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0416-3134-ab964ff7-ad03-4e45-bce6-70e09d69a3ac2022-04-31-Jul-1656932494.jpg",
      "short_description": "Latest knee lanth half pant for boys ",
      "category": 39,
      "pricing": {"id": 15082, "price": "120.69", "moq": 10, "unit": "Pcs"},
      "favourite": false,
      "created_at": "2022-07-04",
      "status": 51,
      "category_name": "Mens",
      "brand": "Ckko"
    }
  ]
};

final homeData = {
  "banerList": [
    "http://img.alicdn.com/imgextra/i3/115/O1CN01PsvX9s1Cii2Pvi3WM_!!115-0-luban.jpg",
    "https://gw.alicdn.com/imgextra/i3/43/O1CN01ZPUEId1CBjWPLKzea_!!43-0-lubanu.jpg",
    "https://gw.alicdn.com/imgextra/i2/41/O1CN01yCNeuw1CAojHBeUyC_!!41-0-lubanu.jpg",
    "http://img.alicdn.com/imgextra/i3/115/O1CN01PsvX9s1Cii2Pvi3WM_!!115-0-luban.jpg",
    "https://gw.alicdn.com/imgextra/i3/43/O1CN01ZPUEId1CBjWPLKzea_!!43-0-lubanu.jpg",
    "https://gw.alicdn.com/imgextra/i2/41/O1CN01yCNeuw1CAojHBeUyC_!!41-0-lubanu.jpg"
  ],
  "cateGoryList": [
    {
      "name": "锅具",
      "icon":
          "https://yanxuan.nosdn.127.net/10a143a382aaf8b8de1f533a1d3b6760.png"
    },
    {
      "name": "清洁保鲜",
      "icon":
          "https://yanxuan.nosdn.127.net/fdec112d77ab0c5083e6b2c53531df7d.png"
    },
    {
      "name": "厨房配件",
      "icon":
          "https://yanxuan.nosdn.127.net/a2e37687f68cf5cf9b5f5a54803e6171.png"
    },
    {
      "name": "刀剪砧板",
      "icon":
          "https://yanxuan.nosdn.127.net/2783b73b3631d9c71a3c602000e393c8.png"
    },
    {
      "name": "餐具",
      "icon":
          "https://yanxuan.nosdn.127.net/9fec1d39f6753fbc727b1ff76d9c810c.png"
    },
    {
      "name": "水具杯壶",
      "icon":
          "https://yanxuan.nosdn.127.net/95237ea2c4867a7b6d21e69245316af1.png"
    },
    {
      "name": "咖啡具酒具",
      "icon":
          "https://yanxuan.nosdn.127.net/318f9ae4afc1aff32515de0f73e66f80.png"
    }
  ],
  "brandList": [
    {
      "name": "冲调饮品",
      "icon":
          "https://yanxuan.nosdn.127.net/3d70af62c5461e795644b12721508372.png"
    },
    {
      "name": "茶包花茶",
      "icon":
          "https://yanxuan.nosdn.127.net/fb30ea6fc9e87d768200c70511a14b08.png"
    },
    {
      "name": "传统茗茶",
      "icon":
          "https://yanxuan.nosdn.127.net/34dc2c9d61f0df6d472820ac28940ce3.png"
    },
    {
      "name": "方便食品",
      "icon":
          "https://yanxuan.nosdn.127.net/559b5d22eb9d4164d7b613f6a8d22836.png"
    },
    {
      "name": "饼干糕点",
      "icon":
          "https://yanxuan.nosdn.127.net/f8d152f1f6f4b0072dcbf10dc2983fe6.png"
    },
    {
      "name": "小食糖巧",
      "icon":
          "https://yanxuan.nosdn.127.net/63e96c2a27d6a4d67e8feeaaa5ba9c7e.png"
    },
    {
      "name": "坚果炒货",
      "icon":
          "https://yanxuan.nosdn.127.net/1d0d218887aa43ea3d74a4dcb8965d2d.png"
    },
    {
      "name": "肉类零食",
      "icon":
          "https://yanxuan.nosdn.127.net/b7f1f3360d22c5a0c9feed8cbe17885c.png"
    },
    {
      "name": "蜜饯果干",
      "icon":
          "https://yanxuan.nosdn.127.net/2be45b99b4409c4149412a74f2eaf387.png"
    },
    {
      "name": "米面粮油",
      "icon":
          "https://yanxuan.nosdn.127.net/51b86357c5e34b77e3bb866b1cff15dc.png"
    },
    {
      "name": "南北干货",
      "icon":
          "https://yanxuan.nosdn.127.net/bbb7bf16b78265062dad3be66724f779.png"
    },
    {
      "name": "调味酱菜",
      "icon":
          "https://yanxuan.nosdn.127.net/84ca992ed0f3b733b1d71499a14532bb.png"
    },
    {
      "name": "酒类",
      "icon":
          "https://yanxuan.nosdn.127.net/3698a22b151359f4c1c55f565909fef8.png"
    },
    {
      "name": "乳品饮料",
      "icon":
          "https://yanxuan.nosdn.127.net/9b04ab23f967ef43d08bef7220452ff4.png"
    },
    {
      "name": "果鲜肉蛋",
      "icon":
          "https://yanxuan.nosdn.127.net/bbb5ae00927c496676dc1747989b91b7.png"
    },
    {
      "name": "网易黑猪",
      "icon":
          "https://yanxuan.nosdn.127.net/fc7770efb186d8b440e6f8b07dc0446b.png"
    },
    {
      "name": "海外美食",
      "icon":
          "https://yanxuan.nosdn.127.net/fe74ff4076d40d2c068d18feb6831a38.png"
    },
    {
      "name": "饼干糕点",
      "icon":
          "https://yanxuan.nosdn.127.net/f8d152f1f6f4b0072dcbf10dc2983fe6.png"
    },
    {
      "name": "小食糖巧",
      "icon":
          "https://yanxuan.nosdn.127.net/63e96c2a27d6a4d67e8feeaaa5ba9c7e.png"
    },
    {
      "name": "坚果炒货",
      "icon":
          "https://yanxuan.nosdn.127.net/1d0d218887aa43ea3d74a4dcb8965d2d.png"
    },
    {
      "name": "肉类零食",
      "icon":
          "https://yanxuan.nosdn.127.net/b7f1f3360d22c5a0c9feed8cbe17885c.png"
    },
    {
      "name": "蜜饯果干",
      "icon":
          "https://yanxuan.nosdn.127.net/2be45b99b4409c4149412a74f2eaf387.png"
    },
    {
      "name": "冲调饮品",
      "icon":
          "https://yanxuan.nosdn.127.net/3d70af62c5461e795644b12721508372.png"
    },
    {
      "name": "茶包花茶",
      "icon":
          "https://yanxuan.nosdn.127.net/fb30ea6fc9e87d768200c70511a14b08.png"
    },
    {
      "name": "传统茗茶",
      "icon":
          "https://yanxuan.nosdn.127.net/34dc2c9d61f0df6d472820ac28940ce3.png"
    },
    {
      "name": "方便食品",
      "icon":
          "https://yanxuan.nosdn.127.net/559b5d22eb9d4164d7b613f6a8d22836.png"
    },
    {
      "name": "米面粮油",
      "icon":
          "https://yanxuan.nosdn.127.net/51b86357c5e34b77e3bb866b1cff15dc.png"
    },
    {
      "name": "南北干货",
      "icon":
          "https://yanxuan.nosdn.127.net/bbb7bf16b78265062dad3be66724f779.png"
    },
    {
      "name": "调味酱菜",
      "icon":
          "https://yanxuan.nosdn.127.net/84ca992ed0f3b733b1d71499a14532bb.png"
    },
    {
      "name": "酒类",
      "icon":
          "https://yanxuan.nosdn.127.net/3698a22b151359f4c1c55f565909fef8.png"
    },
    {
      "name": "乳品饮料",
      "icon":
          "https://yanxuan.nosdn.127.net/9b04ab23f967ef43d08bef7220452ff4.png"
    },
    {
      "name": "果鲜肉蛋",
      "icon":
          "https://yanxuan.nosdn.127.net/bbb5ae00927c496676dc1747989b91b7.png"
    },
    {
      "name": "网易黑猪",
      "icon":
          "https://yanxuan.nosdn.127.net/fc7770efb186d8b440e6f8b07dc0446b.png"
    },
    {
      "name": "海外美食",
      "icon":
          "https://yanxuan.nosdn.127.net/fe74ff4076d40d2c068d18feb6831a38.png"
    }
  ],
  "products": [
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
      "status": 51,
      "category_name": "Mens",
      "brand": "Ckko",
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
      "status": 51,
      "category_name": "Mens",
      "brand": "Ckko",
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
      "status": 51,
      "category_name": "Mens",
      "brand": "Ckko",
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
      "status": 51,
      "category_name": "Mens",
      "brand": "Ckko",
    },
    {
      "id": 11620,
      "title": "Printed Vest For Women",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0617-5107-fa4c48ea-782f-47dc-a30e-b3ea70d2dced2022-06-51-Jul-1657110067.jpg",
      "short_description":
          "Color:- Mixed Color\r\nClothing Size:- L, XL, XXL\r\nNeck Type:- Round Neck\r\nFabric:- Cotton\r\nTop Type:-Regular Top",
      "category": 87,
      "pricing": {"id": 15107, "price": "65.83", "moq": 10, "unit": "Pcs"},
      "favourite": false,
      "created_at": "2022-07-06",
      "status": 51,
      "category_name": "Mens",
      "brand": "Ckko",
    },
    {
      "id": 11619,
      "title": "Stylish Banarasi Blouse 01",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0617-1806-3b808741-b6eb-4ace-a01f-7fd1506686be2022-06-18-Jul-1657108086.jpg",
      "short_description":
          "Fabric Type:- Banarasi Silk\r\nBlouse Stitch Type:-\tNon-Stitched\r\nNeck Type:-Round Neck\r\nSleeve:- 3/4 Sleeve",
      "category": 103,
      "pricing": {"id": 15106, "price": "154.71", "moq": 6, "unit": "Pcs"},
      "favourite": false,
      "created_at": "2022-07-06",
      "status": 51,
      "category_name": "Mens",
      "brand": "Ckko",
    },
    {
      "id": 11618,
      "title": "Ladies Printed Rayon Top 02",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0616-5219-4326ac9b-bee8-453a-8d4f-07add68be1372022-06-52-Jul-1657106539.jpg",
      "short_description":
          "Ideal For :- Women\r\nClothing Size:- 4XL\r\nNeck Type:- Round Neck\r\nSleeve:- 3/4 Sleeve\r\nFabric:-Rayon",
      "category": 87,
      "pricing": {"id": 15105, "price": "151.41", "moq": 12, "unit": "Pcs"},
      "favourite": false,
      "created_at": "2022-07-06",
      "status": 51,
      "category_name": "Mens",
      "brand": "Ckko",
    },
    {
      "id": 11611,
      "title": "Kids Hood Suit Set 021",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0616-1823-0d0f76da-2462-4f0d-b146-ba69fd7e27cb2022-06-18-Jul-1657104503.jpg",
      "short_description": "100% cotton fabrics ",
      "category": 268,
      "pricing": {"id": 15103, "price": "202.98", "moq": 9, "unit": "Pcs"},
      "favourite": false,
      "created_at": "2022-07-06",
      "status": 51,
      "category_name": "Mens",
      "brand": "Ckko",
    },
    {
      "id": 11610,
      "title": "Printed Kids Hood suit Dc -Full Sleeve",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0616-1220-db3626e6-95b9-4dd9-b091-fd1f8befd4fe2022-06-12-Jul-1657104140.jpg",
      "short_description": "100% Cotton Fabrics ",
      "category": 268,
      "pricing": {"id": 15102, "price": "202.98", "moq": 9, "unit": "Pcs"},
      "favourite": false,
      "created_at": "2022-07-06",
      "status": 51,
      "category_name": "Mens",
      "brand": "Ckko",
    },
    {
      "id": 11609,
      "title": "Casual Wear Black PVC Flip-Flops a548",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0711-2418-f5582bcc-3864-4948-bc5c-2771271e36532022-07-24-Jul-1657173258.jpg",
      "short_description":
          "Regular and Casual Wear Flip- Flops for both Men and Boys( Size- 6, 7, 8, 9, 10, 11)",
      "category": 1414,
      "pricing": {"id": 15114, "price": "245.58", "moq": 8, "unit": "Pair"},
      "favourite": false,
      "created_at": "2022-07-06",
      "status": 51,
      "category_name": "Mens",
      "brand": "Ckko",
    },
    {
      "id": 11608,
      "title": "Casual Wear Green PVC Flip-Flops a547",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0613-1037-2c50a8fb-4ee2-435b-b064-dd6dc236e2492022-06-10-Jul-1657093237.jpg",
      "short_description":
          "Regular and Casual Wear Flip- Flops for both Men and Boys( Size- 6, 7, 8, 9, 10, 11)",
      "category": 1414,
      "pricing": {"id": 15100, "price": "245.58", "moq": 8, "unit": "Pair"},
      "favourite": false,
      "created_at": "2022-07-06",
      "status": 51,
      "category_name": "Mens",
      "brand": "Ckko",
    },
    {
      "id": 11606,
      "title": "Casual Wear Navy PVC Flip-Flops a545",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0612-0311-705144a8-75ae-4057-ba9f-7c25d6d98f572022-06-03-Jul-1657089191.JPG",
      "short_description":
          "Regular and Casual Wear Flip- Flops for both Men and Boys( Size- 6, 7, 8, 9, 10, 11)",
      "category": 1414,
      "pricing": {"id": 15098, "price": "245.58", "moq": 8, "unit": "Pair"},
      "favourite": false,
      "created_at": "2022-07-06",
      "status": 51,
      "category_name": "Mens",
      "brand": "Ckko",
    },
    {
      "id": 11605,
      "title": "Casual Wear White PVC Flip-Flops a544",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0518-5329-cfc45182-fda6-44f3-b7e0-bb265432b0ed2022-05-53-Jul-1657027409.JPG",
      "short_description":
          "Regular and Casual Wear Flip- Flops for both Men and Boys( Size- 6, 7, 8, 9, 10, 11)",
      "category": 1414,
      "pricing": {"id": 15097, "price": "245.58", "moq": 8, "unit": "Pair"},
      "favourite": false,
      "created_at": "2022-07-05",
      "status": 51,
      "category_name": "Mens",
      "brand": "Ckko",
    },
    {
      "id": 11604,
      "title": "Casual Wear Green PVC Flip-Flops a543",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0518-4355-863de049-d4b5-4dd8-8d32-2c134a1fa8032022-05-43-Jul-1657026835.JPG",
      "short_description":
          "Regular and Casual Wear Flip- Flops for both Men and Boys( Size- 6, 7, 8, 9, 10, 11)",
      "category": 1414,
      "pricing": {"id": 15096, "price": "245.58", "moq": 8, "unit": "Pair"},
      "favourite": false,
      "created_at": "2022-07-05",
      "status": 51,
      "category_name": "Mens",
      "brand": "Ckko",
    },
    {
      "id": 11602,
      "title": "Casual Wear Black PVC Flip-Flops a542",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0518-1334-c294ea64-2f7b-450b-8870-dab82c6aeb6e2022-05-13-Jul-1657025014.jpg",
      "short_description":
          "Regular and Casual Wear Flip- Flops for both Men and Boys( Size- 6, 7, 8, 9, 10, 11)",
      "category": 1414,
      "pricing": {"id": 15092, "price": "245.58", "moq": 8, "unit": "Pair"},
      "favourite": false,
      "created_at": "2022-07-05",
      "status": 51,
      "category_name": "Mens",
      "brand": "Ckko",
    },
    {
      "id": 11601,
      "title": "Casual Wear Maroon PVC Flip-Flops a541",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0518-0216-c0f28b92-20fa-43a9-ad18-6781e3121b902022-05-02-Jul-1657024336.jpg",
      "short_description":
          "Regular and Casual Wear Flip- Flops for both Men and Boys( Size- 6, 7, 8, 9, 10, 11)",
      "category": 1414,
      "pricing": {"id": 15091, "price": "245.58", "moq": 8, "unit": "Pair"},
      "favourite": false,
      "created_at": "2022-07-05",
      "status": 51,
      "category_name": "Mens",
      "brand": "Ckko",
    },
    {
      "id": 11600,
      "title": "Casual Wear Grey PVC Flip-Flops a540",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0517-5110-c6d31b2d-8381-4bad-b212-98ed917fd52a2022-05-51-Jul-1657023670.jpg",
      "short_description":
          "Regular and Casual Wear Flip- Flops for both Men and Boys( Size- 6, 7, 8, 9, 10, 11)",
      "category": 1414,
      "pricing": {"id": 15090, "price": "245.58", "moq": 8, "unit": "Pair"},
      "favourite": false,
      "created_at": "2022-07-05",
      "status": 51,
      "category_name": "Mens",
      "brand": "Ckko",
    },
    {
      "id": 11598,
      "title": "Casual Wear White PVC Flip-Flops a539",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0517-0744-3b31a406-2a1e-45af-a43f-c086e98976262022-05-07-Jul-1657021064.jpg",
      "short_description":
          "Regular and Casual Wear Flip- Flops for both Men and Boys( Size- 6, 7, 8, 9, 10, 11)",
      "category": 1414,
      "pricing": {"id": 15088, "price": "245.58", "moq": 8, "unit": "Pair"},
      "favourite": false,
      "created_at": "2022-07-05",
      "status": 51,
      "category_name": "Mens",
      "brand": "Ckko",
    },
    {
      "id": 11597,
      "title": "Casual Wear Beige PVC Flip-Flops a538",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0516-4140-15b09f8c-338f-4ac7-a6b2-21067e5db8932022-05-41-Jul-1657019500.jpg",
      "short_description":
          "Regular and Casual Wear Flip- Flops for both Men and Boys( Size- 6, 7, 8, 9, 10, 11)",
      "category": 1414,
      "pricing": {"id": 15087, "price": "245.58", "moq": 8, "unit": "Pair"},
      "favourite": false,
      "created_at": "2022-07-05",
      "status": 51,
      "category_name": "Mens",
      "brand": "Ckko",
    },
    {
      "id": 11596,
      "title": "Casual Wear Black PVC Flip-Flops a537",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0516-2701-5c2165b1-eb1e-4b38-a3a6-3c90fc4e09802022-05-27-Jul-1657018621.JPG",
      "short_description":
          "Regular and Casual Wear Flip- Flops for both Men and Boys( Size- 6, 7, 8, 9, 10, 11)",
      "category": 1414,
      "pricing": {"id": 15086, "price": "245.58", "moq": 8, "unit": "Pair"},
      "favourite": false,
      "created_at": "2022-07-05",
      "status": 51,
      "category_name": "Mens",
      "brand": "Ckko",
    },
    {
      "id": 11595,
      "title": "Fancy Bulls Casual Shorts For Men",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0513-0021-4e10f6ba-4c8a-4de3-81dc-8b60791f5a252022-05-00-Jul-1657006221.png",
      "short_description": "New arrival readymade bulls half pant ",
      "category": 39,
      "pricing": {"id": 15085, "price": "160.19", "moq": 10, "unit": "Pcs"},
      "favourite": false,
      "created_at": "2022-07-05",
      "status": 51,
      "category_name": "Mens",
      "brand": "Ckko",
    },
    {
      "id": 11594,
      "title": "Fancy Elastic Half Pant Bulls 85",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0512-4738-aa4b9090-7779-4c50-8678-383039aeb1072022-05-47-Jul-1657005458.png",
      "short_description": "Bulls 85 hipop half pant",
      "category": 39,
      "pricing": {"id": 15084, "price": "160.19", "moq": 10, "unit": "Pcs"},
      "favourite": false,
      "created_at": "2022-07-05",
      "status": 51,
      "category_name": "Mens",
      "brand": "Ckko",
    },
    {
      "id": 11593,
      "title": "New Born Kids Hood Suit Set 01",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0420-1451-2a5848f2-4ef7-4f0a-a05c-ef892f3cae972022-04-14-Jul-1656945891.jpg",
      "short_description": "100% cotton fabrics ",
      "category": 268,
      "pricing": {"id": 15083, "price": "186.52", "moq": 6, "unit": "Pcs"},
      "favourite": false,
      "created_at": "2022-07-04",
      "status": 51,
      "category_name": "Mens",
      "brand": "Ckko",
    },
    {
      "id": 11591,
      "title": "Casual NS Half Pant For Men",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0416-3134-ab964ff7-ad03-4e45-bce6-70e09d69a3ac2022-04-31-Jul-1656932494.jpg",
      "short_description": "Latest knee lanth half pant for boys ",
      "category": 39,
      "pricing": {"id": 15082, "price": "120.69", "moq": 10, "unit": "Pcs"},
      "favourite": false,
      "created_at": "2022-07-04",
      "status": 51,
      "category_name": "Mens",
      "brand": "Ckko",
    }
  ]
};

final categoriesData = {
  "categories": [
    {
      "id": 5,
      "name": "Men",
      "slug": "men",
      "description":
          "All types of Men's Garments. T-Shirt, Jeans, Shirt, Winter & Seasonal, Sports Wear, Formal Wear, Ethnic Wear, Inner Wear etc.",
      "image": "assets/icons/boy.svg",
      "status": 1,
      "haschild": true
    },
    {
      "id": 6,
      "name": "Women",
      "slug": "men",
      "description":
          "All types of Men's Garments. T-Shirt, Jeans, Shirt, Winter & Seasonal, Sports Wear, Formal Wear, Ethnic Wear, Inner Wear etc.",
      "image": "assets/icons/girl-alt.svg",
      "status": 1,
      "haschild": true
    },
    {
      "id": 7,
      "name": "Kids",
      "slug": "men",
      "description":
          "All types of Men's Garments. T-Shirt, Jeans, Shirt, Winter & Seasonal, Sports Wear, Formal Wear, Ethnic Wear, Inner Wear etc.",
      "image": "assets/icons/kid.svg",
      "status": 1,
      "haschild": true
    },
    {
      "id": 9,
      "name": "Footware",
      "slug": "men",
      "description":
          "All types of Men's Garments. T-Shirt, Jeans, Shirt, Winter & Seasonal, Sports Wear, Formal Wear, Ethnic Wear, Inner Wear etc.",
      "image": "assets/icons/sandals-male.svg",
      "status": 1,
      "haschild": true
    },
    {
      "id": 8,
      "name": "Home Decor",
      "slug": "men",
      "description":
          "All types of Men's Garments. T-Shirt, Jeans, Shirt, Winter & Seasonal, Sports Wear, Formal Wear, Ethnic Wear, Inner Wear etc.",
      "image": "assets/icons/chair.svg",
      "status": 1,
      "haschild": true
    }
  ],
};
