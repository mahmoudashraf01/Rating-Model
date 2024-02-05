class ProductModle {
  final dynamic id;
  final String title;
  final String price;
  final String description;
  final String category;
  final String image;
  final RatingModel rating;

  ProductModle({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductModle.fromJson(json) {
    return ProductModle(
      id: json["id"],
      title: json["title"],
      price: json["price"].toString(),
      description: json["description"],
      category: json["category"],
      image: json["image"],
      rating: RatingModel.fromJson(json["rating"]),
    );
  }
}

class RatingModel {
  final dynamic rate;
  final int count;

  RatingModel({
    required this.rate,
    required this.count,
  });

  factory RatingModel.fromJson(json) {
    return RatingModel(
      rate: json["rate"],
      count: json["count"],
    );
  }
}

class ProductModle2 {
  final dynamic id;
  final String title;
  final String price;
  final String description;
  final String category;
  final String image;

  ProductModle2({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  factory ProductModle2.fromJson(json) {
    return ProductModle2(
      id: json["id"],
      title: json["title"],
      price: json["price"].toString(),
      description: json["description"],
      category: json["category"],
      image: json["image"],
    );
  }
}
