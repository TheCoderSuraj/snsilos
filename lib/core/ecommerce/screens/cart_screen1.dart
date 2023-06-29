import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sn_silos/core/ecommerce/functions/cart/cart_api.dart';
import 'package:sn_silos/core/ecommerce/widgets/cart_product_element.dart';
import 'package:sn_silos/models/product_model.dart';
import 'package:sn_silos/utils/constants.dart';
import 'package:sn_silos/utils/firebase_callback_listener.dart';
import 'package:sn_silos/utils/loading_dialog.dart';

class CartScreen extends StatefulWidget {
  static const id = "CartScreenId";
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<ProductModel> cartItems = [];
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    await Future.delayed(const Duration(milliseconds: 1));
    Future.sync(() {
      showLoadingDialog(context, title: "Loading cart product");
    });
    cartItems = await CartApi.getAllProductToCart(
        listener: FirebaseCallbackListener(onSuccess: () {
      Navigator.pop(context);
    }, onError: (err) {
      Navigator.pop(context);
    }));
    Future.sync(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: SafeArea(
        child: Padding(
          padding: kPagePadding,
          child: ListView.builder(
            itemBuilder: (context, index) => CartProductElement(
              product: cartItems[index],
            ),
            itemCount: cartItems.length,
          ),
        ),
      ),
    );
  }
}
