import 'package:ecom_thin_ui/theme/colors.dart';
import 'package:ecom_thin_ui/theme/device_size_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: false,
            snap: true,
            floating: true,
            title: Text(
              'FAQ',
            ),
          ),
          SliverToBoxAdapter(
            child: FaqCard(),
          )
        ],
      ),
    );
  }
}

class FaqCard extends StatelessWidget {
  const FaqCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: faqData['faqs'].length,
      itemBuilder: (BuildContext context, int index) {
        var data = faqData['faqs'][index];
        return Padding(
          padding: EdgeInsets.only(left: 8.0.w, right: 8.0.w),
          child: ExpansionTile(
              tilePadding: const EdgeInsets.all(0),
              title: Text(data['question']),
              children: [
                Container(
                  constraints:
                      const BoxConstraints(minHeight: 20, maxHeight: 200),
                  width: getWidth,
                  child: WebView(
                    initialUrl: Uri.dataFromString('<h1>${data['answer']}</h1>',
                            mimeType: 'text/html')
                        .toString(),
                    gestureNavigationEnabled: true,
                    zoomEnabled: true,
                  ),
                )
              ]),
        );
      },
    );
  }
}

Map faqData = {
  "status_code": 200,
  "faqs": [
    {
      "id": 7,
      "flag": "Buyer",
      "question": "Q: How do I buy the product?",
      "answer":
          "<p>Go to the 'search' tab, search the required product, to buy the shown product simply click on 'add to cart' then you will have to select the quantity of the available variants or set of the product. The item will be added to your cart, then you can go to your cart and buy the product.</p>",
      "video": ""
    },
    {
      "id": 8,
      "flag": "Buyer",
      "question": "Q: How do I pay for the purchase?",
      "answer":
          "<p>You can pay it once the order is delivered to you or you can pay it online through (Debit, Credit Card, Net Banking, Wallet, Upi, etc.) before placing the order.</p>",
      "video": ""
    },
    {
      "id": 9,
      "flag": "Buyer",
      "question": "Q: How do I cancel my order/item?",
      "answer":
          "                                <p>To cancel a order/item click on 'orders' then tap on the order/item which you want to cancel. Click on 'Cancel Order' and select a reason for the cancellation. Your order will be cancelled.</p>\r\n                            ",
      "video": ""
    },
    {
      "id": 10,
      "flag": "Buyer",
      "question":
          "Q: What is the return and refund policy of Aseztak Wholesale?",
      "answer":
          "<p>You can initiate a return request according to the days mentioned in the product. After the pick up is completed, your refund will be credited in the given bank account within 5-7 working days.</p>",
      "video": ""
    },
    {
      "id": 11,
      "flag": "Buyer",
      "question":
          "Q: How do I register and what documents are required to create a buyer account?",
      "answer":
          "<p>You can register by using your Mobile Number, Shop Name and any one of these documents: AADHAR, PAN or GSTIN.</p>",
      "video": ""
    },
    {
      "id": 12,
      "flag": "Buyer",
      "question":
          "Q: How do I change my address after ordering a product/ item?",
      "answer":
          "<p>You cannot change your address after ordering a product/ item. For changing the address you will have to cancel the order and recreate it with the desired address.</p>",
      "video": ""
    },
    {
      "id": 13,
      "flag": "Buyer",
      "question": "Q: How can I track my order?",
      "answer":
          "                                <p>You can track the status of your order by clicking on 'Order' and selecting the order of which you want to track.</p>\r\n                            ",
      "video": ""
    },
    {
      "id": 14,
      "flag": "Buyer",
      "question": "Q: Who provides the courier services?",
      "answer":
          "<p>As a buyer, you do not need to worry about arranging courier to pick up or deliver the order. Aseztak arranges the order to be picked up and delivered.</p>",
      "video": ""
    },
    {
      "id": 16,
      "flag": "Buyer",
      "question": "Q: What is the estimated delivery period of a order?",
      "answer":
          "<p>The estimated delivery period of the order is 6- 7 working days.</p>",
      "video": ""
    },
    {
      "id": 17,
      "flag": "Buyer",
      "question": "Q: What does 'out of stock' mean?",
      "answer":
          "<p>An item is marked as 'Out of stock' when it is not available with any sellers at the moment, you won't be able to buy it now.</p>",
      "video": ""
    },
    {
      "id": 18,
      "flag": "Buyer",
      "question":
          "Q: What is the minimum order quantity (MOQ) for purchasing a product?",
      "answer":
          "<p>The Minimum Order Quantity (MOQ) for purchasing depends on the product. The Minimum Order Quantity (MOQ) of each product is mentioned in the product itself.</p>",
      "video": ""
    },
    {
      "id": 19,
      "flag": "Buyer",
      "question": "Q: When do I need to pay for the courier?",
      "answer":
          "<p>Courier charges are required to be paid along with the payment for the order.</p>",
      "video": ""
    },
    {
      "id": 20,
      "flag": "Buyer",
      "question": "Q: Who pays for the courier?",
      "answer":
          "<p>Aseztak provides Free Delivery offers where you are not needed to pay any courier charges. If your order do not meet the Free Delivery criteria then you will have to pay the courier charges.</p>",
      "video": ""
    },
    {
      "id": 21,
      "flag": "Buyer",
      "question": "Q: Where can I see the orders I have placed?",
      "answer":
          "                                <p>You can see all your orders by clicking on 'Orders'.</p>\r\n                            ",
      "video": ""
    }
  ]
};
