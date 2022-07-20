import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/screens/order_detail/order_detail.dart';
import 'package:shop_app/themes/app_colors.dart';
import '../../../models/order.dart';

class OrderItem extends StatelessWidget {
  final Order order;
  const OrderItem({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        OrderDetail.route,
        arguments: order.id,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        child: Card(
          child: ListTile(
            title: Text('Total: \$ ${order.total}'),
            trailing: Text(
              DateFormat('yyyy-MM-dd').format(order.dateOrder),
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
            leading: CircleAvatar(
              backgroundColor: AppColors.green,
              child: Text(
                order.items.length.toString(),
                style: const TextStyle(
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
