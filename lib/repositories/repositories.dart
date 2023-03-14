import 'package:store_api_flutter_course/models/category.dart';
import 'package:store_api_flutter_course/models/product.dart';

abstract class Repository {
  Future<List<Product>> getProucts();

  Future<List<Category>> getCategories();

  //Future<Product> getProductById({required String id});
}
