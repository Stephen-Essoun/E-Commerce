import 'package:e_commerce/controllers/api.dart';
import 'package:http/http.dart';

class Network {
  String url = "https://api.escuelajs.co/api/v1/products";
  Future<Shop> getItems() async {
    final response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      return shopFromJson(response.body);
    } else {
      throw {Exception("Failed to get data from $url")};
    }
  }
}
