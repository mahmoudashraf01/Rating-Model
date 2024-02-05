import 'package:rating_model/helper/api.dart';
import 'package:rating_model/models/product_model.dart';

class UpdateProductService {
  Future<ProductModle2> updateProduct({
    required int id,
    required String title,
    required String price,
    required String desc,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> data = await Api().put(
      url: 'https://fakestoreapi.com/products/$id',
      body: {
        'title': title,
        'price': price,
        'description': desc,
        'image': image,
        'category': category,
      },
    );
    ProductModle2 productModle = ProductModle2.fromJson(data);
    return productModle;
  }
}
