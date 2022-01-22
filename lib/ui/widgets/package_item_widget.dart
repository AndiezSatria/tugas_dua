import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_dua/models/meal_package.dart';

class PackageItemWidget extends StatelessWidget {
  final MealPackage item;
  final Function onClick;
  PackageItemWidget({
    Key? key,
    required this.item,
    required this.onClick,
  }) : super(key: key);

  final RegExp _reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick;
      },
      child: Container(
        width: 160,
        height: 262,
        margin: const EdgeInsets.only(bottom: 8.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(6.0),
          ),
          color: Colors.white,
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
            Stack(
              alignment: Alignment.topRight,
              children: [
                SizedBox(
                  width: 160,
                  height: 180,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(6.0),
                      topRight: Radius.circular(6.0),
                    ),
                    child: Image.asset(
                      item.imgAssets,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  height: 24,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(6.0),
                      bottomLeft: Radius.circular(6.0),
                    ),
                    color: Colors.black87,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color(0xFFF0C324),
                        size: 16.0,
                      ),
                      Text(
                        item.rating.toString(),
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                item.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                item.description,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: const Color(0xFF756F6F),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Rp ${item.price.toString().replaceAllMapped(_reg, (Match match) => '${match[1]}.')}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
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
