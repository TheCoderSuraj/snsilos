import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sn_silos/core/ecommerce/functions/cart/cart_api.dart';
import 'package:sn_silos/core/ecommerce/widgets/cart_product_element.dart';
import 'package:sn_silos/models/product_model.dart';
import 'package:sn_silos/utils/constants.dart';
import 'package:sn_silos/utils/firebase_callback_listener.dart';
import 'package:sn_silos/utils/loading_dialog.dart';
import 'package:sn_silos/widgets/app_navigator_bar.dart';

class CartScreen extends StatefulWidget {
  static const id = "CartScreenId";
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<ProductModel> cartItems = [];
  // @override
  // void initState() {
  //   super.initState();
  //   // loadData();
  // }

  // void loadData() async {
  //   await Future.delayed(const Duration(milliseconds: 1));
  //   Future.sync(() {
  //     showLoadingDialog(context, title: "Loading cart product");
  //   });
  //   cartItems = await CartApi.getAllProductToCart(
  //       listener: FirebaseCallbackListener(onSuccess: () {
  //     Navigator.pop(context);
  //   }, onError: (err) {
  //     Navigator.pop(context);
  //   }));
  //   Future.sync(() {
  //     setState(() {});
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: SafeArea(
        child: Padding(
          padding: kPagePadding,
          child: StreamBuilder<QuerySnapshot>(
              stream: CartApi.getProductStream(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: Text("Loading"),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("Error: ${snapshot.error}"),
                  );
                } else if (snapshot.hasData && snapshot.data!.docs.length > 0) {
                  // cartItems = [];
                  // for (var a in snapshot.data!.docs) {
                  //   cartItems.add(ProductModel.fromJson(a.data()));
                  // }
                  print(snapshot.data!.docs[0].data());
                  return ListView.builder(
                    itemBuilder: (context, index) => CartProductElement(
                      product: ProductModel.fromJson(snapshot.data!.docs[index]
                          .data() as Map<String, dynamic>),
                    ),
                    itemCount: snapshot.data!.docs.length,
                  );
                  // return CartProductElement(
                  //   product: ProductModel.fromJson(
                  //       snapshot.data!.docs[0].data() as Map<String, dynamic>),
                  // );
                }
                print("no change");
                return const Center(child: Text("No data"));
              }),
          // child: ListView.builder(
          //   itemBuilder: (context, index) => CartProductElement(
          //     product: cartItems[index],
          //   ),
          //   itemCount: cartItems.length,
          // ),
        ),
      ),
      bottomNavigationBar: const AppBottomNavigatorBar(),
    );
  }
}
