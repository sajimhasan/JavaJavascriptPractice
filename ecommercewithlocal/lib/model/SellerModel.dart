import 'package:flutter/foundation.dart';

class Sellermodel {
  final int? id;
  final String? sellerName;
  final String? shopName;
  final String? password;
  final DateTime? local_date_time;
  final double? rate;
  final int? soldProduct;
  final List? review;

 Sellermodel({
  required this.id,
  this.local_date_time,
  required this.shopName,
  required this.password,
  this.rate,
 this.soldProduct,
  required this.sellerName,
  this.review
     });
     factory Sellermodel.fromjson(Map<String , dynamic> json){
      return Sellermodel(id: json['id'] ?? 0,
       shopName: json['shopName'],
       password: json['password'], 
       local_date_time:  json['local_date_time'] != null
          ? DateTime.parse(json['local_date_time'])
          : null,
          rate: json['rate'],
          soldProduct: json['soldProduct'] ?? 0,
          review: json['review'],
       sellerName: json['sellerName']);
     }

     Map<String, dynamic > tojson(){
      return { 
        
        'id': id,
        'shopName': shopName,
        'password': password ,
        'local_date_time': local_date_time?.toIso8601String(),
        'rate':rate,
        'soleProduct': soldProduct,
        'review': review,
        'sellerName': sellerName

      };
     }
}