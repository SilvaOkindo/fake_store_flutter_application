import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_api_flutter_course/models/category.dart';
import 'package:store_api_flutter_course/widgets/category_widget.dart';

import '../repositories/product_repository.dart';
import '../services/get_categories.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        var productController = CategoryController(ProductRepository());

    return Scaffold(
      appBar: AppBar(title: const Text("Categories")),
      body: FutureBuilder<List<Category>>(
        future: productController.fetchCategories(),
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
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0.0,
                    mainAxisSpacing: 0.0,
                    childAspectRatio: 1),
                itemBuilder: (ctx, index) {
                 // var products = snapShot.data?[index];
                  return ChangeNotifierProvider.value(
                    value: snapShot.data![index],
                    child: const CategoryWidget());
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