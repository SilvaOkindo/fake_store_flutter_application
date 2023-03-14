import 'package:store_api_flutter_course/models/category.dart';
import 'package:store_api_flutter_course/repositories/repositories.dart';


class CategoryController {
  final Repository _repository;

  CategoryController(this._repository);

  Future<List<Category>> fetchCategories() async {
    return _repository.getCategories();
  }
}
