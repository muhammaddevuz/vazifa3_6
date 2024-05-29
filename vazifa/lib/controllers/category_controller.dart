import 'package:dars_6/models/category.dart';
import 'package:dars_6/services/categories_http_service.dart';

class CategoryController {
  final categoriesHttpService = CategoriesHttpService();

  Future<List<Category>> getCategories() async {
    List<Category> categories = await categoriesHttpService.getCategories();

    return categories;
  }
}
