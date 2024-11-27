import 'package:flutter/material.dart';
import '../../constants/constants.dart';

class GifLoader extends StatelessWidget {
  final Alignment alignment;
  const GifLoader({
    super.key,
    required this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: alignment,
      child: Image.asset(
        Constants.gifLoader,
        width: 50,
        height: 50,
      ),
    );
  }
}
