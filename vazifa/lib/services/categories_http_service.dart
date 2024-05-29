import 'dart:convert';

import 'package:dars_6/models/category.dart';
import 'package:http/http.dart' as http;

class CategoriesHttpService {
  Future<List<Category>> getCategories() async {
    Uri url = Uri.parse("https://api.escuelajs.co/api/v1/categories");

    final response = await http.get(url);
    final data = jsonDecode(response.body);
    List<Category> loadedCategories = [];

    if (data != null) {
      data.forEach(
        (value) {
          loadedCategories.add(Category.fromJson(value));
        },
      );
    }

    return loadedCategories;
  }
}
