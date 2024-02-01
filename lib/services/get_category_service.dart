import 'package:rating_model/helper/api.dart';
import 'package:rating_model/models/product_model.dart';

class GetCategory {
  Future<List<ProductModle>> getAllProducts({required String category}) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$category');

    List<ProductModle> productLsit = [];
    for (int i = 0; i < data.length; i++) {
      ProductModle productModle = ProductModle.fromJson(data[i]);
      productLsit.add(productModle);
    }
    return productLsit;
  }
}
