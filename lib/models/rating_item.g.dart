// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingItem _$RatingItemFromJson(Map<String, dynamic> json) => RatingItem(
      count: json['count'] as int? ?? 0,
      rate: (json['rate'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$RatingItemToJson(RatingItem instance) =>
    <String, dynamic>{
      'rate': instance.rate,
      'count': instance.count,
    };
