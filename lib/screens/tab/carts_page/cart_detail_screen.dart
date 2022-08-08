import 'package:commercial_app/models/carts/cart.dart';
import 'package:commercial_app/models/products/product_item.dart';
import 'package:commercial_app/models/users/user_item.dart';
import 'package:commercial_app/repository/repository.dart';
import 'package:commercial_app/screens/tab/home_page/widgets/product_list_item.dart';
import 'package:flutter/material.dart';

class CartDetailScreen extends StatefulWidget {
  const CartDetailScreen(
      {Key? key, required this.cart, required this.myRepository})
      : super(key: key);

  final Cart cart;
  final MyRepository myRepository;

  @override
  State<CartDetailScreen> createState() => _CartDetailScreenState();
}

class _CartDetailScreenState extends State<CartDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User cart detail"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 35),
          const Text(
            "Foydalanuvchi ma'lumotlari",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25),
          ),
          getUserInfo(),
          const Text(
            "Olgan mahsulotlari",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25),
          ),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(16),
              physics: const BouncingScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              mainAxisSpacing: 20,
              crossAxisSpacing: 15,
              children: List.generate(
                widget.cart.products.length,
                (index) => FutureBuilder(
                  future: widget.myRepository
                      .getSingleProduct(widget.cart.products[index].productId),
                  builder: (BuildContext context,
                      AsyncSnapshot<ProductItem> snapshot) {
                    if (snapshot.hasData) {
                      var product = snapshot.data!;
                      return ProductListItem(
                        productItem: product,
                        onTap: () {},
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  FutureBuilder getUserInfo() {
    return FutureBuilder<UserItem>(
      future: widget.myRepository.getSingleUser(widget.cart.userId),
      builder: (BuildContext context, AsyncSnapshot<UserItem> snapshot) {
        if (snapshot.hasData) {
          var userInfo = snapshot.data!;
          return Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                spreadRadius: 8,
                blurRadius: 10,
                offset: Offset(1, 4),
                color: Colors.grey.shade300,
              )
            ], borderRadius: BorderRadius.circular(16), color: Colors.white),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Username "), Text(userInfo.username)],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Email "), Text(userInfo.email)],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Phone "), Text(userInfo.phone)],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("City "), Text(userInfo.addressItem.city)],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Zipcode "),
                    Text(userInfo.addressItem.zipcode)
                  ],
                ),
              ],
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
    );
  }
}
