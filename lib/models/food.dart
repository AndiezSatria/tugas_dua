enum Category {
  DinnerFood,
  EconomicFood,
  HotFood,
  FamilyFood,
  ColdFood,
}

class Food {
  String name;
  double rating;
  int price;
  int total;
  String imgAsset;
  Category category;

  Food({
    required this.name,
    required this.rating,
    required this.price,
    required this.imgAsset,
    required this.category,
    this.total = 1,
  });
}

class FoodCategory {
  String name;
  Category category;
  bool isSelected;

  FoodCategory({
    required this.name,
    required this.category,
    this.isSelected = false,
  });
}
