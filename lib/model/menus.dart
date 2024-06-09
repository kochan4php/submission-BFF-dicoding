import 'package:restaurant_app/model/drink.dart';
import 'package:restaurant_app/model/food.dart';

class Menus {
  final List<Food> foods;
  final List<Drink> drinks;

  Menus({required this.foods, required this.drinks});

  factory Menus.fromJson(Map<String, dynamic> json) {
    return Menus(
      foods: List<Food>.from((json['foods'] as List).map(
        (item) => Food.fromJson(item),
      )),
      drinks: List<Drink>.from((json['drinks'] as List).map(
        (item) => Drink.fromJson(item),
      )),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'foods': List<Food>.from(foods.map((item) => item.toJson())),
      'drinks': List<Drink>.from(drinks.map((item) => item.toJson())),
    };
  }
}
