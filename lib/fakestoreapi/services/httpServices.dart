import 'package:firestoreapi_products/fakestoreapi/model/productModel.dart';
import 'package:http/http.dart' as http;
class HttpService {
  static Future<List<ProductModel>> fetchProduct() async {
    var response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if (response.statusCode == 200) {
      var data = response.body;
      return productModelFromJson(data);
    } else {
      throw Exception();
    }
  }
}