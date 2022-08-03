// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geolocation_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeolocationItem _$GeolocationItemFromJson(Map<String, dynamic> json) =>
    GeolocationItem(
      lat: json['lat'] as String? ?? '',
      long: json['long'] as String? ?? '',
    );

Map<String, dynamic> _$GeolocationItemToJson(GeolocationItem instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'long': instance.long,
    };
