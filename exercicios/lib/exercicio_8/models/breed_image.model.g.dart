// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breed_image.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreedImage _$BreedImageFromJson(Map<String, dynamic> json) {
  return BreedImage(
    json['message'] as String,
    json['success'] as String,
  );
}

Map<String, dynamic> _$BreedImageToJson(BreedImage instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
    };
