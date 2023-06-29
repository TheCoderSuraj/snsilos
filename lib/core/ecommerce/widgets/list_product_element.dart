import 'package:flutter/material.dart';
import 'package:sn_silos/core/ecommerce/functions/product/product_api.dart';
import 'package:sn_silos/core/ecommerce/screens/product_detail_screen.dart';
import 'package:sn_silos/models/product_model.dart';

import '../../../utils/constants.dart';

class ListProductElement extends StatelessWidget {
  const ListProductElement({
    super.key,
    required this.product,
  });

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    String title = product.title.length > kProductTitleLimit
        ? "${product.title.substring(0, kProductTitleLimit - 3)}..."
        : product.title;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDetailScreen.id,
            arguments: product);
      },
      child: Container(
        padding: const EdgeInsets.all(3),
        height: 269,
        width: 210,
        constraints: const BoxConstraints(
          maxWidth: 210,
          // maxHeight: 210,
          // minHeight: 210,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).colorScheme.primary.withAlpha(50),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                product.image,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text("\$ ${product.price}"),
                      ),
                      Row(
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
