import 'package:commercial_app/models/users/geolocation_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address_item.g.dart';

@JsonSerializable(explicitToJson: true)
class AddressItem {
  @JsonKey(name: 'geolocation')
  GeolocationItem geolocationItem;

  @JsonKey(defaultValue: "", name: 'city')
  String city;

  @JsonKey(defaultValue: "", name: 'street')
  String street;

  @JsonKey(defaultValue: 0, name: 'number')
  int number;

  @JsonKey(defaultValue: "", name: 'zipcode')
  String zipcode;

  AddressItem({
    required this.geolocationItem,
    required this.street,
    required this.number,
    required this.city,
    required this.zipcode,
  });

  factory AddressItem.fromJson(Map<String, dynamic> json) =>
      _$AddressItemFromJson(json);

  Map<String, dynamic> toJson() => _$AddressItemToJson(this);
}
