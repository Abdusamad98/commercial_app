import 'package:json_annotation/json_annotation.dart';

part 'rating_item.g.dart';

@JsonSerializable(explicitToJson: true)
class RatingItem {
  @JsonKey(defaultValue: 0.0, name: 'rate')
  double rate;

  @JsonKey(defaultValue: 0, name: 'count')
  int count;

  RatingItem({
    required this.count,
    required this.rate,
  });

  factory RatingItem.fromJson(Map<String, dynamic> json) =>
      _$RatingItemFromJson(json);

  Map<String, dynamic> toJson() => _$RatingItemToJson(this);
}

