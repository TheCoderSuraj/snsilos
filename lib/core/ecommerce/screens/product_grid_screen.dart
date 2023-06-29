import 'package:flutter/material.dart';
import 'package:sn_silos/utils/constants.dart';

import '../../../models/product_model.dart';
import '../widgets/list_product_element.dart';

class ProductGridScreen extends StatelessWidget {
  const ProductGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: SafeArea(
        child: Padding(
          padding: kPagePadding,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 0.78,
              maxCrossAxisExtent: 235,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              mainAxisExtent: 269,
            ),
            itemBuilder: (context, index) => ListProductElement(
              product: ProductModel.demo(),
            ),
            itemCount: 8,
          ),
        ),
      ),
    );
  }
}
