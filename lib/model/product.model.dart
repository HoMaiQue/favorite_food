import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  String id;
  String category_id;
  String title;
  String intro;
  String ingredients;
  String instructions;
  String views;
  String favorite;
  Product({
    required this.id,
    required this.category_id,
    required this.title,
    required this.intro,
    required this.ingredients,
    required this.instructions,
    required this.views,
    required this.favorite,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'category_id': category_id,
      'title': title,
      'intro': intro,
      'ingredients': ingredients,
      'instructions': instructions,
      'views': views,
      'favorite': favorite,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as String,
      category_id: map['category_id'] as String,
      title: map['title'] as String,
      intro: map['intro'] as String,
      ingredients: map['ingredients'] as String,
      instructions: map['instructions'] as String,
      views: map['views'] as String,
      favorite: map['favorite'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
