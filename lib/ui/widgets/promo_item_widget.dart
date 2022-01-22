import 'package:flutter/material.dart';

class PromoItemWidget extends StatelessWidget {
  final String imgAssets;
  const PromoItemWidget({
    Key? key,
    required this.imgAssets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 160,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(6.0),
        ),
        image: DecorationImage(
          image: AssetImage(imgAssets),
        ),
      ),
    );
  }
}
