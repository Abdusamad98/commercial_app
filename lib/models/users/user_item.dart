import 'package:commercial_app/models/users/address_item.dart';
import 'package:commercial_app/models/users/name_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_item.g.dart';

@JsonSerializable()
class UserItem {
  @JsonKey(name: 'address')
  AddressItem addressItem;

  @JsonKey(name: 'name')
  NameItem nameItem;

  @JsonKey(defaultValue: 0, name: 'id')
  int id;

  @JsonKey(defaultValue: "", name: 'email')
  String email;

  @JsonKey(defaultValue: "", name: 'username')
  String username;

  @JsonKey(defaultValue: "", name: 'password')
  String password;

  @JsonKey(defaultValue: "", name: 'phone')
  String phone;

  @JsonKey(defaultValue: 0, name: '__v')
  int vvv;

  UserItem({
    required this.nameItem,
    required this.addressItem,
    required this.password,
    required this.username,
    required this.id,
    required this.phone,
    required this.email,
    required this.vvv,
  });

  factory UserItem.fromJson(Map<String, dynamic> json) =>
      _$UserItemFromJson(json);

  Map<String, dynamic> toJson() => _$UserItemToJson(this);
}
