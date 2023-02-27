import 'dart:convert';

import 'package:store_api_flutter_course/models/product.dart';
import 'package:store_api_flutter_course/repositories/repositories.dart';
import 'package:http/http.dart' as http;

class ProductRepository extends Repository {
  @override
  Future<List<Product>> getProucts() async {
    List<Product> products = [];
    String uri = "https://api.escuelajs.co/api/v1/products";
    var url = Uri.parse(uri);
    var response = await http.get(url);
    print("status code : ${response.statusCode}");
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      for (var i = 0; i < body.length; i++) {
        products.add(Product.fromJson(body[i]));
      }
    }

    return products;
  }
}
