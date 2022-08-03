import 'package:json_annotation/json_annotation.dart';

part 'name_item.g.dart';


@JsonSerializable(explicitToJson: true)
class NameItem {
  @JsonKey(defaultValue: "", name: 'firstname')
  String firstname;

  @JsonKey(defaultValue: "", name: 'lastname')
  String lastname;

  NameItem({
    required this.lastname,
    required this.firstname,
  });

  factory NameItem.fromJson(Map<String, dynamic> json) =>
      _$NameItemFromJson(json);

  Map<String, dynamic> toJson() => _$NameItemToJson(this);
}
