// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Production _$ProductionFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'name'],
  );
  return Production(
    id: json['id'] as String,
    name: json['name'] as String,
    description: check(json['mota']),
    price: _fromJsonPrice(json['detail'] as Map<String, dynamic>),
    cost: _fromJsoncost(json['detail'] as Map<String, dynamic>),
    madein: json['madein'] as String?,
  );
}

Map<String, dynamic> _$ProductionToJson(Production instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'mota': instance.description,
      'detail': instance.price,
      'detail1': instance.cost,
      'madein': instance.madein,
    };
