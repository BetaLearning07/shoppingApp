import 'package:shopping_app/screens/account/account_screen.dart';
import 'package:shopping_app/screens/address/add_shipping_address_screen.dart';
import 'package:shopping_app/screens/address/edit_address_screen.dart';
import 'package:shopping_app/screens/address/shipping_address_list_screen.dart';
import 'package:shopping_app/screens/bank/bank_detail_screen.dart';
import 'package:shopping_app/screens/cart/cart_screen.dart';
import 'package:shopping_app/screens/cart/saved_cart_screen.dart';
import 'package:shopping_app/screens/category/category_screen.dart';
import 'package:shopping_app/screens/checkout/checkout_screen.dart';
import 'package:shopping_app/screens/checkout/order_failed_screen.dart';
import 'package:shopping_app/screens/checkout/order_successful_screen.dart';
import 'package:shopping_app/screens/faq/faq_screen.dart';
import 'package:shopping_app/screens/home/home_screen.dart';
import 'package:shopping_app/screens/order/order_detail_screen.dart';
import 'package:shopping_app/screens/order/order_list_screen.dart';
import 'package:shopping_app/screens/product/product_detail_screen.dart';
import 'package:shopping_app/screens/product/seller_product_screen.dart';
import 'package:shopping_app/screens/wishlist/wishlist_screen.dart';
import 'package:flutter/material.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initialRoute = Routes.home;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
        settings: settings,
        builder: (_) {
          switch (settings.name) {
            case Routes.account:
              return const AccountScreen();
            case Routes.home:
              return const HomeScreen();
            case Routes.orderList:
              return const OrderListScreen();
            case Routes.orderDetail:
              return const OrderDetailScreen();
            case Routes.cart:
              return const CartScreen();
            case Routes.savedCart:
              return const SavedCartScreen();
            case Routes.wishlist:
              return const WishlistScreen();
            case Routes.faq:
              return const FaqScreen();
            case Routes.bankDetail:
              return const BankDetailScreen();
            case Routes.shippingAddressList:
              return const ShippingAddressListScreen();
            case Routes.addShippingAddress:
              return const AddShippingAddressScreen();
            case Routes.editShippingAddress:
              return const EditAddressScreen();
            case Routes.checkout:
              return const CheckOutScreen();
            case Routes.orderPlaced:
              return const OrderSucessScreen();
            case Routes.orderFailed:
              return const OrderFailedScreen();
            case Routes.sellerProducts:
              return const SellerProductsScreen();
            case Routes.category:
              return const CategoryScreen();
            case Routes.productDetail:
              return ProductDetailScreen(
                  productId: settings.arguments.toString());

            default:
              return const HomeScreen();
          }
        });
  }
}
