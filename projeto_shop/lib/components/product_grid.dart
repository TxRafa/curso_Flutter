

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/product_item.dart';
import 'package:shop/models/product.dart';
import 'package:shop/models/product_list.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<ProductList>(context);
    final List<Product> loaderProducts = provider.items; 

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: loaderProducts.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: loaderProducts[i],
        child: ProductItem(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}