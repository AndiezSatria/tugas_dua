import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuItemWidget extends StatelessWidget {
  final String title;
  final String svgAsset;
  final Function onClick;
  const MenuItemWidget({
    Key? key,
    required this.title,
    required this.svgAsset,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 48.0,
            height: 48.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 1.0,
                color: const Color(0xFFF4F0F0),
              ),
              color: Colors.white,
            ),
            child: Center(
              child: SvgPicture.asset(
                svgAsset,
                width: 24,
                height: 24,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
