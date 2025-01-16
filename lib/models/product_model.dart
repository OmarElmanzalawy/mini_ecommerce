import 'dart:convert';

class ProductModel {

  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final double rate;
  final int count;

  ProductModel({required this.id, required this.title, required this.price, required this.description, required this.category, required this.image,required this.rate, required this.count,});

  factory ProductModel.fromJson(Map<String,dynamic> json){
    final Map<String,dynamic> rating = json['rating'];
    return ProductModel(
      id: json['id'], 
      title: json['title'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      image: json[''],
      rate: rating['rate'],
      count: rating['count']
      );
  }

}