import 'dart:convert';

import 'package:commercial_app/models/product_item.dart';
import 'package:http/http.dart' as https;
import 'package:http/http.dart';

class ApiProvider {
  // Serverdan barcha mahsulotlarni olib keladi
  Future<List<ProductItem>> getProductsList() async {
    try {
      Response response =
          await https.get(Uri.parse("https://fakestoreapi.com/products"));
      if (response.statusCode == 200) {
        List<ProductItem> products = (jsonDecode(response.body) as List?)
                ?.map((item) => ProductItem.fromJson(item))
                .toList() ??
            [];
        return products;
      } else {
        throw Exception();
      }
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }

  //Serverdan bergan sonimizcha mahsulot olib keladi
  Future<List<ProductItem>> getLimitedList({required limitedCount}) async {
    try {
      Response response = await https.get(
          Uri.parse("https://fakestoreapi.com/products?limit=$limitedCount"));
      if (response.statusCode == 200) {
        List<ProductItem> products = (jsonDecode(response.body) as List?)
                ?.map((item) => ProductItem.fromJson(item))
                .toList() ??
            [];
        return products;
      } else {
        throw Exception();
      }
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }

  // Serverdan yagona mahsulot haqida ma'lumot qaytaradi
  Future<ProductItem> getSingleProduct({
    required int productId,
  }) async {
    try {
      Response response = await https
          .get(Uri.parse("https://fakestoreapi.com/products/$productId"));
      if (response.statusCode == 200) {
        return ProductItem.fromJson(jsonDecode(response.body));
      } else {
        throw Exception();
      }
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }

  //Serverga yagona mahsulot qo'shish

  Future<ProductItem> addNewProductToServer(
      {required ProductItem productItem}) async {
    try {
      Response response = await https
          .post(Uri.parse("https://fakestoreapi.com/products"), body: {
        "title": productItem.title,
        "price": productItem.price,
        "description": productItem.description,
        "image": productItem.image,
        "category": productItem.category
      });
      if (response.statusCode == 200) {
        return ProductItem.fromJson(jsonDecode(response.body));
      } else {
        throw Exception();
      }
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }

  //Get All Categories

  Future<List<String>> getAllCategories() async {
    try {
      Response response = await https
          .get(Uri.parse("https://fakestoreapi.com/products/categories"));
      if (response.statusCode == 200) {
        return (jsonDecode(response.body) as List<dynamic>?)
                ?.map((e) => e as String)
                .toList() ??
            [];
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<ProductItem>> getSpecificCategoryProducts({
    required String categoryName,
  }) async {
    try {
      Response response = await https.get(Uri.parse(
          "https://fakestoreapi.com/products/category/$categoryName"));
      if (response.statusCode == 200) {
        List<ProductItem> products = (jsonDecode(response.body) as List?)
                ?.map((item) => ProductItem.fromJson(item))
                .toList() ??
            [];
        print("Products:${products.toString()}");
        return products;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

// Delete productfrom server
  Future<ProductItem> deleterProduct(int productId) async {
    try {
      Response response = await https
          .delete(Uri.parse("https://fakestoreapi.com/products/$productId"));
      if (response.statusCode == 200) {
        return ProductItem.fromJson(jsonDecode(response.body));
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<String> loginUser({
    required String username,
    required String password,
  }) async {
    try {
      Response response = await https.post(
          Uri.parse("https://fakestoreapi.com/auth/login"),
          body: {"username": username, "password": password});
      if (response.statusCode == 200) {
        return jsonDecode(response.body)['token'];
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
