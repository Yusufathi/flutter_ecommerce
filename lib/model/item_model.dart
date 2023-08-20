import 'dart:html';

class ItemModel {
  String? title;
  String? briefDescription;
  String? fullDescription;
  double? price;
  String? imgPath;
  String? category;
  int? id;

  ItemModel(
      {required this.id,
      required this.category,
      required this.title,
      required this.briefDescription,
      required this.price,
      required this.imgPath,
      required this.fullDescription});

  ItemModel.fromJson(dynamic obj) {
    id = obj['id'];
    category = obj['category'];
    title = obj['title'];
    price = obj['price'];
    fullDescription = briefDescription = obj['description'];
    imgPath = obj['image'];
  }

  @override
  String toString() {
    return 'ItemModel{title: $title, briefDescription: $briefDescription, fullDescription: $fullDescription, price: $price, imgPath: $imgPath, category: $category, id: $id}';
  }
}
