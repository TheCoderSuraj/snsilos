import 'package:flutter/material.dart';
import 'package:sn_silos/core/ecommerce/functions/cart/cart_api.dart';
import 'package:sn_silos/models/product_model.dart';
import 'package:sn_silos/utils/firebase_callback_listener.dart';
import 'package:sn_silos/utils/utility.dart';

class CartProductElement extends StatefulWidget {
  const CartProductElement({
    super.key,
    required this.product,
  });
  final ProductModel product;

  @override
  State<CartProductElement> createState() => _CartProductElementState();
}

class _CartProductElementState extends State<CartProductElement> {
  final int kCartProductTitleLimit = 37;

  String title = "";
  final TextEditingController _cntController = TextEditingController(text: "1");

  int itemCount = 1;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    itemCount = widget.product.itemCount;
    _cntController.text = widget.product.itemCount.toString();
    title = (widget.product.title.length < kCartProductTitleLimit)
        ? widget.product.title
        : "${widget.product.title.substring(0, kCartProductTitleLimit - 3)}...";
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.primary.withAlpha(25)),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              widget.product.image,
              height: 100,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // showLoadingDialog(context,
                        //     title: "Removing Product from cart");
                        CartApi.deleteProductFromCart(
                          productId: widget.product.id,
                          listener: FirebaseCallbackListener(
                            onError: (err) {
                              // Navigator.pop(context);
                            },
                            onSuccess: () {
                              // Navigator.pop(context);
                              showMyToast("Successfully removed from cart");
                            },
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$ ${widget.product.price}"),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withAlpha(150)),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: itemCount < 2
                                ? null
                                : () {
                                    itemCount--;
                                    CartApi.updateCartProduct(
                                        product:
                                            widget.product.copyWith(itemCount));
                                  },
                            // onPressed: () {
                            //   // if ((int.tryParse(_cntController.text) ?? 1) >
                            //   //     1) {
                            //   //   _cntController.text =
                            //   //       ((int.tryParse(_cntController.text) ?? 1) -
                            //   //               1)
                            //   //           .toString();
                            //   // }
                            //   //   int? value =
                            //   //       int.tryParse(_cntController.text) ?? 1;
                            //   //   if (value < 2) return;
                            //   //   _cntController.text = (value - 1).toString();
                            //   //   CartApi.updateCartProduct(
                            //   //       product: widget.product.copyWith(value - 1));

                            //   // if(itemCount <)
                            // },
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                            child: Center(
                              child: Text(
                                itemCount.toString().padLeft(2, '0'),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                            // child: TextFormField(
                            //   controller: _cntController,
                            //   keyboardType: TextInputType.number,
                            //   maxLength: 2,
                            //   enabled: false,
                            //   textAlign: TextAlign.center,
                            //   decoration: const InputDecoration(
                            //     border: InputBorder.none,
                            //     counterText: "",
                            //   ),
                            //   style: Theme.of(context)
                            //       .textTheme
                            //       .bodyMedium!
                            //       .copyWith(
                            //         color: Colors.white,
                            //         height: 1,
                            //       ),
                            // ),
                          ),
                          IconButton(
                            onPressed: itemCount > 98
                                ? null
                                : () {
                                    setState(() {
                                      itemCount++;
                                    });
                                    CartApi.updateCartProduct(
                                        product:
                                            widget.product.copyWith(itemCount));
                                  },
                            // onPressed: () {
                            //   int? value =
                            //       int.tryParse(_cntController.text) ?? 1;
                            //   if (value > 98) return;
                            //   _cntController.text = (value + 1).toString();
                            //   CartApi.updateCartProduct(
                            //       product: widget.product.copyWith(value + 1));
                            // },
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
