import 'package:store_api_flutter_course/repositories/repositories.dart';

import '../models/product.dart';

class ProductController {
  final Repository _repository;

  ProductController(this._repository);

  Future<List<Product>> fetchProucts() async {
    return _repository.getProucts();
  }
}
