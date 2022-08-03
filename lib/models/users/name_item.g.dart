// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'name_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NameItem _$NameItemFromJson(Map<String, dynamic> json) => NameItem(
      lastname: json['lastname'] as String? ?? '',
      firstname: json['firstname'] as String? ?? '',
    );

Map<String, dynamic> _$NameItemToJson(NameItem instance) => <String, dynamic>{
      'firstname': instance.firstname,
      'lastname': instance.lastname,
    };
