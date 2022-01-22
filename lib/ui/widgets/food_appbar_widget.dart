import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodAppBarWidget extends StatelessWidget {
  final Function onBackButtonPressed;
  const FoodAppBarWidget({
    Key? key,
    required this.onBackButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.fromLTRB(8.0, 16.0, 20.0, 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.5,
            blurRadius: 6,
            offset: const Offset(0, 1),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  onBackButtonPressed();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "Food",
                style: GoogleFonts.inter(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SvgPicture.asset(
            "assets/icons/cart_empty.svg",
            width: 24.0,
            height: 24.0,
          ),
        ],
      ),
    );
  }
}
