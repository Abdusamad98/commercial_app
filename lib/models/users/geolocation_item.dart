import 'package:json_annotation/json_annotation.dart';

part 'geolocation_item.g.dart';

@JsonSerializable(explicitToJson: true)
class GeolocationItem {
  @JsonKey(defaultValue: "", name: 'lat')
  String lat;

  @JsonKey(defaultValue: "", name: 'long')
  String long;

  GeolocationItem({
    required this.lat,
    required this.long,
  });

  factory GeolocationItem.fromJson(Map<String, dynamic> json) =>
      _$GeolocationItemFromJson(json);

  Map<String, dynamic> toJson() => _$GeolocationItemToJson(this);
}
