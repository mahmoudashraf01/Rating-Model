import 'package:rating_model/helper/api.dart';
import 'package:rating_model/models/product_model.dart';

class AddProduct {
  Future<ProductModle> addProduct({
    required String title,
    required String price,
    required String desc,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: 'https://fakestoreapi.com/products',
      body: {
        'title': title,
        'price': price,
        'description': desc,
        'image': image,
        'category': category,
      },
    );
    ProductModle productModle = ProductModle.fromJson(data);
    return productModle;
  }
}
