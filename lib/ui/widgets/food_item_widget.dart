import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_dua/models/food.dart';
import 'package:tugas_dua/themes/styles.dart';

class FoodItemWidget extends StatelessWidget {
  final Food food;
  final Function onClick;
  FoodItemWidget({
    Key? key,
    required this.food,
    required this.onClick,
  }) : super(key: key);

  final RegExp _reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(6.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0.3,
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                child: Image.asset(
                  food.imgAsset,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                food.name,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star,
                    color: Color(0xFFF0C324),
                    size: 16.0,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    food.rating.toString(),
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: neutralGrey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Rp ${food.price.toString().replaceAllMapped(_reg, (Match match) => '${match[1]}.')}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
