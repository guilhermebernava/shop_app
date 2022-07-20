import 'cart.dart';

class Order {
  final double total;
  final String id;
  final List<CartModel> items;
  final DateTime dateOrder;

  Order(
    this.dateOrder, {
    required this.total,
    required this.id,
    required this.items,
  });
}
