import 'package:flutter/material.dart';
import 'package:tugas_dua/ui/pages/food_page.dart';
import 'package:tugas_dua/ui/widgets/home_appbar_widget.dart';
import 'package:tugas_dua/ui/widgets/menu_item_widget.dart';
import 'package:tugas_dua/ui/widgets/package_item_widget.dart';
import 'package:tugas_dua/ui/widgets/promo_slider_widget.dart';
import 'package:tugas_dua/utils/data_dummy.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            const HomeAppBarWidget(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const PromoSliderWidget(),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MenuItemWidget(
                          title: "Food",
                          svgAsset: "assets/icons/food.svg",
                          onClick: () {
                            Navigator.pushNamed(context, FoodPage.routeName);
                          },
                        ),
                        MenuItemWidget(
                          title: "Table",
                          svgAsset: "assets/icons/table.svg",
                          onClick: () {},
                        ),
                        MenuItemWidget(
                          title: "Payment",
                          svgAsset: "assets/icons/payment.svg",
                          onClick: () {},
                        ),
                        MenuItemWidget(
                          title: "More",
                          svgAsset: "assets/icons/more.svg",
                          onClick: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 40.0),
                    SizedBox(
                      height: 265,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: listPackage.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: index == listPackage.length - 1
                                ? const EdgeInsets.symmetric(horizontal: 16.0)
                                : const EdgeInsets.only(left: 16.0),
                            child: PackageItemWidget(
                              item: listPackage[index],
                              onClick: () {},
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
