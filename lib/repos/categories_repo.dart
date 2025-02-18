import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_application_19/model/categories_model.dart';

class CategoriesRepo {
  static Future<List<Category>> fetchCategories() async {
    try {
      var api = "https://app.ecominnerix.com/api/categories";
      var response = await http.get(Uri.parse(api));

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        return (jsonData['data']['data'] as List)
            .map((category) => Category.fromJson(category))
            .toList();
      }
    } catch (e) {
      print("Error fetching categories: $e");
    }

    return [];
  }
}
