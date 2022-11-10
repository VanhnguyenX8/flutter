import 'dart:ffi';

class Production {
  String? id;
  String? name;
  String? description;
  double? price;
  double? cost;
  String? madeIn;

  Production({
    this.id,
    this.name,
    this.description,
    this.price,
    this.cost,
    this.madeIn,
  });

  factory Production.fromJson(Map<String, dynamic> json) {
    return Production(
      id: json['id'],
      name: json['name'],
      description: json['mo_ta'],
      price: json['detail']['price'] == null ? 0 : 1,
      cost: json['detail']['cost'] == null ? 0 : 1,
      madeIn: json['detail']['made_in']['code'],
    );
  }
}
