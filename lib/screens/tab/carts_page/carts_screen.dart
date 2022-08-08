import 'package:commercial_app/models/carts/cart.dart';
import 'package:commercial_app/repository/repository.dart';
import 'package:commercial_app/screens/tab/carts_page/cart_detail_screen.dart';
import 'package:commercial_app/screens/tab/carts_page/widgets/cart_screen_item.dart';
import 'package:flutter/material.dart';

class CartsScreen extends StatefulWidget {
  const CartsScreen({Key? key, required this.myRepository}) : super(key: key);

  final MyRepository myRepository;

  @override
  State<CartsScreen> createState() => _CartsScreenState();
}

class _CartsScreenState extends State<CartsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Carts"),
      ),
      body: FutureBuilder<List<Cart>>(
        future: widget.myRepository.getAllCarts(),
        builder: (BuildContext context, AsyncSnapshot<List<Cart>> snapshot) {
          if (snapshot.hasData) {
            var carts = snapshot.data!;
            return ListView(
              children: List.generate(
                carts.length,
                (index) => CartScreenItem(
                  cart: carts[index],
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return CartDetailScreen(
                        cart: carts[index],
                        myRepository: widget.myRepository,
                      );
                    }));
                  },
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
