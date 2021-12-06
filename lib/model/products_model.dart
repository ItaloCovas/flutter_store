class ProductsModel {
  final int id;
  final String title;
  final double price;
  final String category;
  final String description;
  final String image;

  ProductsModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.category,
      required this.description,
      required this.image});
}
