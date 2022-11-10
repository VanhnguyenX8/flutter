import 'dart:convert';

import 'package:flutter/material.dart';

import 'production.dart';
// import 'package:json/models/jsontext3.dart';
void main() {
 
  var jsonString = {"id": "123","name": "Production","mota": ['&desciption&adasdasdas'],"detail": { "price": 100, "cost": 50,"made_in": {"id": 1234,"code": "VN"}}};
// Map<String, dynamic> productionMap = jsonDecode(jsonString) ;
// Map production = jsonDecode(jsonString);
// String productionString = jsonEncode(jsonString);
// var mapobject = jsonDecode(productionString);
// var production = Production.fromJson(mapobject);

// print(production.madeIn);
  
// }
var obj = Production.fromJson(jsonString);    

print('bảng hiển thị:');
print("id : ${obj.id}");
print("name : ${obj.name}");
print("mo ta: ${obj.description}");
print("giá cả: ${obj.price}");
print("cost: ${obj.cost}");
// print('made in: ${obj.madeIn}');
}



