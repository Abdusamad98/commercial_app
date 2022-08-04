import 'package:commercial_app/models/carts/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart.g.dart';

@JsonSerializable()
class Cart {
  @JsonKey(defaultValue: 0, name: "id")
  int id;

  @JsonKey(defaultValue: 0, name: "userId")
  int userId;

  @JsonKey(defaultValue: "", name: "date")
  String date;

  @JsonKey(defaultValue: 0, name: "__v")
  int v;

  @JsonKey(defaultValue: [], name: "products")
  List<Product> products;

  Cart({
    required this.id,
    required this.userId,
    required this.date,
    required this.v,
    required this.products,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
  Map<String, dynamic> toJson() => _$CartToJson(this);
}
