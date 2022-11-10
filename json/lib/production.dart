import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
part 'production.g.dart';

@JsonSerializable()
class Production {
  Production({
    required this.id,
    required this.name,
    this.description,
    this.price,
    this.cost,
    this.madein,
  });
  factory Production.fromJson(Map<String, dynamic> json) =>
      _$ProductionFromJson(json);

  @JsonKey(required: true)
  final String id;
  @JsonKey(required: true)
  final String name;
  @JsonKey(name: "mota", fromJson: check)
  final String? description;
  @JsonKey(name: 'detail', fromJson: _fromJsonPrice)
  final double? price;
  @JsonKey(name: 'detail', fromJson: _fromJsoncost)
  final double? cost;
  // @JsonKey(
  //   name: 'detail',
  // )
  final String? madein;
  Map<String, dynamic> toJson() => _$ProductionToJson(this);
}

// String _fromJsonDescription(String content) {
//   return _fromJsonDescription(content) ;
// }
String? parseHtmlToText(String? content) {
  return content ?? " ";
}

double _fromJsonPrice(Map<String, dynamic> detail) {
  try {
    double price = (detail['price'] as num).toDouble();

    return price;
  } catch (e) {
    double a = -1.0;
    print(e);
    return a;
  }
}
double _fromJsoncost(Map<String, dynamic> detail) {
  try {
    double cost = (detail['cost'] as num).toDouble();

    return cost;
  } catch (e) {
    double a = -1.0;
    print(e);
    return a;
  }
}

String check(dynamic a) {
  if (a == null) {
    return a = "lỗi";
  } else {
    try {
      if (a is List && a.length >= 1) {
        a = a[0];
      }
      var re = "&desciption&";
      a = a.replaceAll(RegExp(re), '');
      return a;
    } catch (e) {
      return a = "lỗi";
    }
  }
}
