import 'package:rating_model/helper/api.dart';
import 'package:rating_model/models/product_model.dart';

class GetAllProductServices {
  Future<List<ProductModle2>> getAllProducts() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products');

    List<ProductModle2> productLsit = [];
    for (int i = 0; i < data.length; i++) {
      ProductModle2 productModle = ProductModle2.fromJson(data[i]);
      productLsit.add(productModle);
    }
    return productLsit;
  }
}
