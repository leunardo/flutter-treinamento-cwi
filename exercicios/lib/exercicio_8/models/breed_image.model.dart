import 'package:json_annotation/json_annotation.dart';

part 'breed_image.model.g.dart';

@JsonSerializable(nullable: false)
class BreedImage {
  String message;
  String success;

  BreedImage(this.message, this.success);

  factory BreedImage.fromJson(Map<String, dynamic> json) =>
      _$BreedImageFromJson(json);
  Map<String, dynamic> toJson() => _$BreedImageToJson(this);
}
