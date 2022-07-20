class CartModel {
  final String id;
  final String title;
  final double price;
  final String imageUrl;
  int quantity;

  CartModel({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
    this.quantity = 1,
  });
}
