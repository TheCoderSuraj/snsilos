import 'package:flutter/material.dart';
import 'package:sn_silos/core/auth/functions/auth.dart';
import 'package:sn_silos/core/auth/screens/login_screen.dart';
import 'package:sn_silos/core/ecommerce/functions/product/product_api.dart';
import 'package:sn_silos/core/ecommerce/widgets/cart_product_element.dart';
import 'package:sn_silos/core/ecommerce/widgets/list_product_element.dart';
import 'package:sn_silos/models/product_model.dart';
import 'package:sn_silos/utils/constants.dart';
import 'package:sn_silos/utils/firebase_callback_listener.dart';
import 'package:sn_silos/widgets/screen_page_setup.dart';

import '../../../utils/loading_dialog.dart';

class HomeScreen extends StatefulWidget {
  static const id = "HomeScreenId";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ProductModel> products = [];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    await Future.delayed(const Duration(milliseconds: 1));
    Future.sync(() {
      showLoadingDialog(context, title: "loading products");
    });

    // forced delayed
    // await Future.delayed(const Duration(milliseconds: 500));
    products = await ProductApi.getAllProducts();
    setState(() {});
    Future.sync(() {
      Navigator.popUntil(context, ModalRoute.withName(HomeScreen.id));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        actions: [
          IconButton(
            onPressed: () {
              AuthApi.signOut(listener: FirebaseCallbackListener(
                onSuccess: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, LoginScreen.id, (route) => false);
                },
              ));
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: kPagePadding,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    childAspectRatio: 0.78,
                    maxCrossAxisExtent: 235,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    mainAxisExtent: 269,
                  ),
                  itemBuilder: (context, index) => ListProductElement(
                    product: products[index],
                  ),
                  itemCount: products.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
