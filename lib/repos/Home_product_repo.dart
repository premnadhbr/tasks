import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/home_product_Model.dart';

class BestOfferRepo {
  static Future<List<Product>> getBestOffers() async {
    try {
      var api = "https://app.ecominnerix.com/api/v1/home";
      var response = await http.get(Uri.parse(api));

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        if (jsonData["best_offers"] != null) {
          var bestOffers = BestOffersResponse.fromJson(jsonData["best_offers"]);
          return bestOffers.items;
        }
      } else {
        print("Failed to load best offers: ${response.statusCode}");
      }
    } catch (e) {}

    return [];
  }
}
