import 'package:dars_6/models/product.dart';
import 'package:dars_6/services/products_http_service.dart';

class ProductsController {
  final productsHttpService = ProductsHttpService();

  Future<List<Product>> getProducts() async {
    List<Product> products = await productsHttpService.getProducts();

    return products;
  }
}
