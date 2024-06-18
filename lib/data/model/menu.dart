import 'package:restaurant_app/data/model/drink.dart';
import 'package:restaurant_app/data/model/food.dart';

class Menu {
  final List<Food> foods;
  final List<Drink> drinks;

  Menu({required this.foods, required this.drinks});

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
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
