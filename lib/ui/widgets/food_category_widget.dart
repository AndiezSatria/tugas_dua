import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_dua/models/food.dart';
import 'package:tugas_dua/themes/styles.dart';

class FoodCategoryWidget extends StatelessWidget {
  final FoodCategory foodCategory;
  const FoodCategoryWidget({
    Key? key,
    required this.foodCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
        color: !foodCategory.isSelected ? const Color(0xFFF3F1F1) : primary50,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            foodCategory.name,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: !foodCategory.isSelected ? Colors.black : Colors.white,
            ),
          ),
          !foodCategory.isSelected
              ? const SizedBox()
              : const SizedBox(width: 5),
          !foodCategory.isSelected
              ? const SizedBox()
              : SvgPicture.asset(
                  "assets/icons/close_circle.svg",
                  width: 14,
                  height: 14,
                ),
        ],
      ),
    );
  }
}
