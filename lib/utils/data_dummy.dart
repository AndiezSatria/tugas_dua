import 'package:flutter/material.dart';
import 'package:tugas_dua/models/food.dart';
import 'package:tugas_dua/models/meal_package.dart';
import 'package:tugas_dua/ui/widgets/promo_item_widget.dart';

final List<Widget> listSlider = [
  const PromoItemWidget(imgAssets: "assets/images/slider_one.png"),
  const PromoItemWidget(imgAssets: "assets/images/slider_two.png"),
  const PromoItemWidget(imgAssets: "assets/images/slider_three.png"),
];

final List<MealPackage> listPackage = [
  MealPackage(
      name: "Family Package",
      description: "1 large table 6 chairs",
      price: 320000,
      rating: 4.7,
      imgAssets: "assets/images/package_one.png"),
  MealPackage(
      name: "Single Breakfast",
      description: "1 table 1 chair",
      price: 70000,
      rating: 4.9,
      imgAssets: "assets/images/package_two.png"),
  MealPackage(
      name: "Date Package",
      description: "1 table 2 chairs",
      price: 130000,
      rating: 4.3,
      imgAssets: "assets/images/package_one.png"),
  MealPackage(
      name: "Family Package",
      description: "1 large table 6 chairs",
      price: 320000,
      rating: 4.7,
      imgAssets: "assets/images/package_two.png"),
];

final List<FoodCategory> listCategory = [
  FoodCategory(name: "Dinner Food", category: Category.DinnerFood),
  FoodCategory(name: "Economic Food", category: Category.EconomicFood),
  FoodCategory(name: "Hot Food", category: Category.HotFood),
  FoodCategory(name: "Family Food", category: Category.FamilyFood),
  FoodCategory(name: "Cold Food", category: Category.ColdFood),
];

final List<Food> listFood = [
  Food(
    name: "Noodle Ex",
    rating: 4.9,
    price: 16500,
    imgAsset: "assets/images/food.png",
    category: Category.FamilyFood,
  ),
  Food(
    name: "Meatball Sweaty",
    rating: 4.4,
    price: 21000,
    imgAsset: "assets/images/food.png",
    category: Category.HotFood,
  ),
  Food(
    name: "Burger Ulala",
    rating: 4.3,
    price: 45000,
    imgAsset: "assets/images/food.png",
    category: Category.DinnerFood,
  ),
  Food(
    name: "Noodle Kere",
    rating: 4.7,
    price: 5000,
    imgAsset: "assets/images/food.png",
    category: Category.EconomicFood,
  ),
  Food(
    name: "Shoto",
    rating: 3.5,
    price: 22500,
    imgAsset: "assets/images/food.png",
    category: Category.HotFood,
  ),
  Food(
    name: "Ice Cream Vanilla",
    rating: 4.0,
    price: 8000,
    imgAsset: "assets/images/food.png",
    category: Category.ColdFood,
  ),
  Food(
    name: "Duck Burning",
    rating: 4.1,
    price: 35500,
    imgAsset: "assets/images/food.png",
    category: Category.FamilyFood,
  ),
  Food(
    name: "Chicken College",
    rating: 5,
    price: 3250000,
    imgAsset: "assets/images/food.png",
    category: Category.ColdFood,
  ),
  Food(
    name: "Margarita",
    rating: 2.1,
    price: 59000,
    imgAsset: "assets/images/food.png",
    category: Category.EconomicFood,
  ),
  Food(
    name: "Sunset Drips",
    rating: 1.7,
    price: 150000,
    imgAsset: "assets/images/food.png",
    category: Category.HotFood,
  ),
];
