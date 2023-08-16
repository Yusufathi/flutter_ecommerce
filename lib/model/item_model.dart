class ItemModel {
  String name;
  String briefDescription;
  String fullDescription;
  double price;
  String imgPath;
  int stockCount;

  ItemModel(
      {required this.name,required this.briefDescription,required this.price,required this.imgPath,required this.stockCount,required this.fullDescription});

  @override
  String toString() {
    return 'ItemModel{name: $name, description: $briefDescription, price: $price, imgPath: $imgPath, stockCount: $stockCount}';
  }
}
