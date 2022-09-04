import 'package:ecom_thin_ui/screens/account/account_screen.dart';
import 'package:ecom_thin_ui/screens/address/add_shipping_address_screen.dart';
import 'package:ecom_thin_ui/screens/address/edit_address_screen.dart';
import 'package:ecom_thin_ui/screens/address/shipping_address_list_screen.dart';
import 'package:ecom_thin_ui/screens/bank/bank_detail_screen.dart';
import 'package:ecom_thin_ui/screens/cart/cart_screen.dart';
import 'package:ecom_thin_ui/screens/cart/saved_cart_screen.dart';
import 'package:ecom_thin_ui/screens/faq/faq_screen.dart';
import 'package:ecom_thin_ui/screens/home/home_screen.dart';
import 'package:ecom_thin_ui/screens/order/order_detail_screen.dart';
import 'package:ecom_thin_ui/screens/order/order_list_screen.dart';
import 'package:ecom_thin_ui/screens/product_detail/product_detail_screen.dart';
import 'package:ecom_thin_ui/screens/wishlist/wishlist_screen.dart';
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
            case Routes.productDetail:
              return const ProductDetailScreen();

            default:
              return const HomeScreen();
          }
        });
  }
}
