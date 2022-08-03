import 'package:commercial_app/models/products/rating_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_item.g.dart';

@JsonSerializable()
class ProductItem {
  @JsonKey(defaultValue: 0, name: 'id')
  int id;

  @JsonKey(defaultValue: '', name: 'title')
  String title;

  @JsonKey(defaultValue: 0.0, name: 'price')
  double price;

  @JsonKey(defaultValue: '', name: 'description')
  String description;

  @JsonKey(defaultValue: '', name: 'category')
  String category;

  @JsonKey(defaultValue: '', name: 'image')
  String image;

  @JsonKey(name: 'rating')
  RatingItem ratingItem;

  ProductItem({
    required this.ratingItem,
    required this.id,
    required this.description,
    required this.title,
    required this.category,
    required this.image,
    required this.price,
  });

  factory ProductItem.fromJson(Map<String, dynamic> json) =>
      _$ProductItemFromJson(json);

  Map<String, dynamic> toJson() => _$ProductItemToJson(this);

  @override
  String toString() => '''
      id:$id,
      ratingItem:${ratingItem.rate},
      descriptionL:$description,
      title:$title,
      category:$category,
      image:$image,
      price:$price,
  ''';
}
