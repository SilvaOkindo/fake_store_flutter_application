import 'package:store_api_flutter_course/models/product.dart';

abstract class Repository {
  Future<List<Product>> getProucts();
}
