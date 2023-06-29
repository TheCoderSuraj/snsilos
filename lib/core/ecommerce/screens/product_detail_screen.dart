import 'package:flutter/material.dart';
import 'package:sn_silos/core/ecommerce/functions/cart/cart_api.dart';
import 'package:sn_silos/models/product_model.dart';
import 'package:sn_silos/utils/constants.dart';
import 'package:sn_silos/utils/firebase_callback_listener.dart';
import 'package:sn_silos/utils/loading_dialog.dart';
import 'package:sn_silos/utils/utility.dart';
import 'package:sn_silos/widgets/action_button.dart';

import '../widgets/circular_button.dart';

class ProductDetailScreen extends StatelessWidget {
  static const id = "ProductDetailScreenId";
  const ProductDetailScreen({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Material(
                          borderRadius: const BorderRadius.vertical(
                              bottom: Radius.circular(25)),
                          elevation: 25,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                bottom: Radius.circular(25)),
                            child: Image.network(
                              product.image,
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                              height: 450,
                            ),
                          ),
                        ),
                        Positioned(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (Navigator.canPop(context))
                                CircularButton(
                                  iconData: Icons.arrow_back,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              CircularButton(
                                iconData: Icons.favorite_outline,
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: kPagePadding,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  product.title,
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("${product.rating}"),
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange[200],
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Center(
                            child: Text(
                              "Description:",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ),
                          Text(product.description),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ActionButton(
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .primary
                              .withAlpha(200),
                          widthRatio: 0.4,
                          title: "Add to Cart",
                          onPressed: () => addProductToCart(context),
                        ),
                        ActionButton(
                          widthRatio: 0.4,
                          title: "Buy \$${product.price}",
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  void addProductToCart(BuildContext context) {
    showLoadingDialog(context, title: "Adding to Cart");
    CartApi.addProductToCart(
        product: product,
        listener: FirebaseCallbackListener(onSuccess: () {
          Navigator.pop(context);
          showMyToast("Successfully added to cart");
        }, onError: (er) {
          Navigator.pop(context);
        }));
  }
}
