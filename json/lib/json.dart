// import 'package:json_annotation/json_annotation.dart';
// part 'json.g.dart';

// @JsonSerializable()
// class Production {
//   Production({
//     this.id,
//     this.name,
//     this.description,
//     required this.price,
//     required this.cost,
//     // this.madeIn,
//   });
//   factory Production.fromJson(Map<String, dynamic> json) =>
//       _$ProductionFromJson(json);
//   @JsonKey(defaultValue: '', name: 'mo_ta')
//   final String? description;
//   @JsonKey(required: true)
//   final String? id;
//   @JsonKey(required: true)
//   final String? name;
//   @JsonKey(fromJson: xuly)
//   final Detail cost;
//   // @JsonKey(fromJson: double.tryParse)
//   final Detail price;
//  xuly(Map<String, dynamic> json)
//       : name = json['name'],
//         price = json['price'];
//   // final Madein? madeIn;

//   Map<String, dynamic> toJson() => _$ProductionToJson(this);

//   static xuly(Map<String, dynamic> json) {
//     price = json['price'];
//   }
// }
 
// class Detail {
//   Detail(this.price,
//   // this.cost 
//   );
//   factory Detail.fromJson( double price) => Detail(price);
//   // factory Detail.fromJson(Map<double,double> json) => Detail(json);
//   final double price;
//   // final double cost;
  
//   double toJson() => price;
  
// }
// // class Madein {
// //   const Madein({
// //     this.madeIn,
// //   });
// //   factory Madein.fromJson(Map<String, dynamic> json) => _$MadeinFromJson(json);
// //   final String? madeIn;
  
// // }
