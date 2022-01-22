import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_dua/models/food.dart';
import 'package:tugas_dua/themes/styles.dart';

class FoodDetailBottomSheet extends StatefulWidget {
  final Food food;
  const FoodDetailBottomSheet({
    Key? key,
    required this.food,
  }) : super(key: key);

  @override
  _FoodDetailBottomSheetState createState() => _FoodDetailBottomSheetState();
}

class _FoodDetailBottomSheetState extends State<FoodDetailBottomSheet> {
  int _totalFood = 1;
  final RegExp _reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(24.0),
                        topRight: Radius.circular(24.0),
                      ),
                      image: DecorationImage(
                        image: AssetImage(widget.food.imgAsset),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(24.0),
                              topRight: Radius.circular(24.0),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.9),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 12),
                    width: 40,
                    height: 4,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: neutralGrey,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            widget.food.name,
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: 24.0,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                widget.food.rating == 0
                                    ? Icons.star_border
                                    : widget.food.rating <= 0.5
                                        ? Icons.star_half
                                        : Icons.star,
                                color: const Color(0xFFF0C324),
                                size: 20.0,
                              ),
                              Icon(
                                widget.food.rating <= 1
                                    ? Icons.star_border
                                    : widget.food.rating - 1 <= 0.5
                                        ? Icons.star_half
                                        : Icons.star,
                                color: const Color(0xFFF0C324),
                                size: 20.0,
                              ),
                              Icon(
                                widget.food.rating <= 2
                                    ? Icons.star_border
                                    : widget.food.rating - 2 <= 0.5
                                        ? Icons.star_half
                                        : Icons.star,
                                color: const Color(0xFFF0C324),
                                size: 20.0,
                              ),
                              Icon(
                                widget.food.rating <= 3
                                    ? Icons.star_border
                                    : widget.food.rating - 3 <= 0.5
                                        ? Icons.star_half
                                        : Icons.star,
                                color: const Color(0xFFF0C324),
                                size: 20.0,
                              ),
                              Icon(
                                widget.food.rating <= 4
                                    ? Icons.star_border
                                    : widget.food.rating - 4 <= 0.5
                                        ? Icons.star_half
                                        : Icons.star,
                                color: const Color(0xFFF0C324),
                                size: 20.0,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                widget.food.rating.toString(),
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  color: neutralGrey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 27),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            "Rp ${widget.food.price.toString().replaceAllMapped(_reg, (Match match) => '${match[1]}.')}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.inter(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 40.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              if (_totalFood > 1) {
                                setState(() {
                                  _totalFood--;
                                });
                              }
                            },
                            icon: Icon(
                              Icons.remove_circle,
                              color: _totalFood == 1 ? neutralGrey : primary50,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Text(
                            _totalFood.toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 16),
                          IconButton(
                            onPressed: () {
                              if (_totalFood < 100) {
                                setState(() {
                                  _totalFood++;
                                });
                              }
                            },
                            icon: Icon(
                              Icons.add_circle,
                              color:
                                  _totalFood == 100 ? neutralGrey : primary50,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context, _totalFood);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  height: 45,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(6.0),
                    ),
                    color: primary50,
                  ),
                  child: Center(
                    child: Text(
                      "Place Order",
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
