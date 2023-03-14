import 'package:flutter/material.dart';
import 'package:store_api_flutter_course/models/product.dart';

import '../repositories/product_repository.dart';
import '../services/get_products.dart';
import '../widgets/feeds_widget.dart';
import 'package:provider/provider.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productController = ProductController(ProductRepository());
    return Scaffold(
      appBar: AppBar(
        // elevation: 4,
        title: const Text('All Products'),
      ),
      body: FutureBuilder<List<Product>>(
        future: productController.fetchProucts(),
        builder: (_, snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapShot.connectionState == ConnectionState.done) {
            return GridView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: snapShot.data?.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0.0,
                    mainAxisSpacing: 0.0,
                    childAspectRatio: 0.7),
                itemBuilder: (ctx, index) {
                  //var products = snapShot.data?[index];
                  return ChangeNotifierProvider.value(
                    value: snapShot.data![index],
                    child: const FeedsWidget());
                });
          } else {
            return const Center(
              child: Text('Error occurred'),
            );
          }
        },
      ),
    );
  }
}
