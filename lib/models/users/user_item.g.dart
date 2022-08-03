// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserItem _$UserItemFromJson(Map<String, dynamic> json) => UserItem(
      nameItem: NameItem.fromJson(json['name'] as Map<String, dynamic>),
      addressItem:
          AddressItem.fromJson(json['address'] as Map<String, dynamic>),
      password: json['password'] as String? ?? '',
      username: json['username'] as String? ?? '',
      id: json['id'] as int? ?? 0,
      phone: json['phone'] as String? ?? '',
      email: json['email'] as String? ?? '',
      vvv: json['__v'] as int? ?? 0,
    );

Map<String, dynamic> _$UserItemToJson(UserItem instance) => <String, dynamic>{
      'address': instance.addressItem,
      'name': instance.nameItem,
      'id': instance.id,
      'email': instance.email,
      'username': instance.username,
      'password': instance.password,
      'phone': instance.phone,
      '__v': instance.vvv,
    };
