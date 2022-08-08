import 'package:commercial_app/models/carts/cart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CartScreenItem extends StatelessWidget {
  const CartScreenItem({Key? key, required this.cart, required this.onTap})
      : super(key: key);

  final Cart cart;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            spreadRadius: 8,
            blurRadius: 10,
            offset: const Offset(1, 4),
            color: Colors.grey.shade300,
          )
        ], borderRadius: BorderRadius.circular(16), color: Colors.white),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [const Text("Carta ID raqami"), Text(cart.id.toString())],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Harid qilingan sanasi"),
              Text(DateFormat.yMEd().format(DateTime.parse(cart.date)))
            ],
          )
        ]),
      ),
    );
  }
}
