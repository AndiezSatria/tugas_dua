import 'package:flutter/material.dart';
import 'package:tugas_dua/models/food.dart';
import 'package:tugas_dua/themes/styles.dart';
import 'package:tugas_dua/ui/pages/food_detail_bottom_sheet.dart';
import 'package:tugas_dua/ui/widgets/food_appbar_widget.dart';
import 'package:tugas_dua/ui/widgets/food_category_widget.dart';
import 'package:tugas_dua/ui/widgets/food_item_widget.dart';
import 'package:tugas_dua/utils/data_dummy.dart';

class FoodPage extends StatefulWidget {
  static const String routeName = "/food_page";
  const FoodPage({Key? key}) : super(key: key);

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  String _searchText = "";
  final List<Category> _selectedCategories = [];
  final TextEditingController _editingController = TextEditingController();

  void onItemClicked(Food food) async {
    final result = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      builder: (context) {
        return FoodDetailBottomSheet(
          food: food,
        );
      },
    );
    if (result != null) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text('Success Place $result Order'),
            action: SnackBarAction(
              label: "Cart",
              onPressed: () {},
              textColor: primary30,
            ),
            backgroundColor: secondary50,
            behavior: SnackBarBehavior.floating,
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FoodAppBarWidget(
              onBackButtonPressed: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _searchText = value.trim();
                  });
                },
                controller: _editingController,
                decoration: const InputDecoration(
                    labelText: "Search Food",
                    hintText: "Search Food",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)))),
              ),
            ),
            const SizedBox(height: 8.0),
            SizedBox(
              height: 30,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: listCategory.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        listCategory[index].isSelected =
                            !listCategory[index].isSelected;
                        if (listCategory[index].isSelected) {
                          _selectedCategories.add(listCategory[index].category);
                        } else {
                          _selectedCategories
                              .remove(listCategory[index].category);
                        }
                      });
                    },
                    child: Container(
                      margin: index == listCategory.length - 1
                          ? const EdgeInsets.symmetric(horizontal: 12.0)
                          : const EdgeInsets.only(left: 12.0),
                      child: FoodCategoryWidget(
                        foodCategory: listCategory[index],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 0,
                mainAxisSpacing: 16,
                childAspectRatio: 0.8,
                children: _selectedCategories.isNotEmpty
                    ? _searchText != ""
                        ? listFood
                            .where((food) =>
                                _selectedCategories.contains(food.category))
                            .toList()
                            .where((food) => food.name
                                .toLowerCase()
                                .contains(_searchText.toLowerCase()))
                            .map((food) {
                            return FoodItemWidget(
                              food: food,
                              onClick: () {
                                onItemClicked(food);
                              },
                            );
                          }).toList()
                        : listFood
                            .where((food) =>
                                _selectedCategories.contains(food.category))
                            .toList()
                            .map((food) {
                            return FoodItemWidget(
                              food: food,
                              onClick: () {
                                onItemClicked(food);
                              },
                            );
                          }).toList()
                    : _searchText != ""
                        ? listFood
                            .where((food) => food.name
                                .toLowerCase()
                                .contains(_searchText.toLowerCase()))
                            .map((food) {
                            return FoodItemWidget(
                              food: food,
                              onClick: () {
                                onItemClicked(food);
                              },
                            );
                          }).toList()
                        : listFood.map((food) {
                            return FoodItemWidget(
                              food: food,
                              onClick: () {
                                onItemClicked(food);
                              },
                            );
                          }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _editingController.clear();
    super.dispose();
  }
}
