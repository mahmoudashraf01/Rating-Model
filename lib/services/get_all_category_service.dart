import 'dart:async';

import 'package:rating_model/helper/api.dart';

class GetAllCategories {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> data =await Api().get(url: 'https://fakestoreapi.com/products/categories');
      return data;

  }
}
