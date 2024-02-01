import 'package:rating_model/helper/api.dart';
import 'package:rating_model/models/product_model.dart';

class GetAllProductServices {
  Future<List<ProductModle>> getAllProducts() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products');

    List<ProductModle> productLsit = [];
    for (int i = 0; i < data.length; i++) {
      ProductModle productModle = ProductModle.fromJson(data[i]);
      productLsit.add(productModle);
    }
    return productLsit;
  }
}
