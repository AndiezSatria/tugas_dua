import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tugas_dua/themes/styles.dart';
import 'package:tugas_dua/utils/data_dummy.dart';

class PromoSliderWidget extends StatefulWidget {
  const PromoSliderWidget({Key? key}) : super(key: key);

  @override
  _PromoSliderWidgetState createState() => _PromoSliderWidgetState();
}

class _PromoSliderWidgetState extends State<PromoSliderWidget> {
  final CarouselController _controller = CarouselController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: CarouselSlider(
            items: listSlider,
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: false,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: listSlider.asMap().entries.map(
            (entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == entry.key ? primary50 : neutralGrey,
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}
