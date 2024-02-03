import 'package:rating_model/helper/api.dart';
import 'package:rating_model/models/product_model.dart';

class UpdateProduct{
    Future<ProductModle> updateProduct({
    required String title,
    required String price,
    required String desc,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> data = await Api().put(
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