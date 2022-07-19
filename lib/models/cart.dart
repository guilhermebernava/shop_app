class CartModel {
  final String id;
  final String title;
  final double price;
  int quantity;

  CartModel({
    required this.id,
    required this.title,
    required this.price,
    this.quantity = 1,
  });
}
