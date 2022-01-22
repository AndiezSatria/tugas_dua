import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hi, Michael",
                style: GoogleFonts.inter(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "Get your favorite food here!",
                style: GoogleFonts.inter(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SvgPicture.asset(
            "assets/icons/cart.svg",
            width: 28.0,
            height: 28.0,
          ),
        ],
      ),
    );
  }
}
