import 'package:commercial_app/repository/repository.dart';
import 'package:flutter/material.dart';

class CartsScreen extends StatefulWidget {
  const CartsScreen({Key? key,required this.myRepository}) : super(key: key);


  final MyRepository myRepository;

  @override
  State<CartsScreen> createState() => _CartsScreenState();
}

class _CartsScreenState extends State<CartsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Carts"),),
    );
  }
}
