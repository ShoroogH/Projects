import 'package:dosage_form_page/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  double height;
  SmallText({Key? key,
    this.color = const Color(0xFF000000),
    required this.text,
    this.size = 0,
    this.height = 1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontSize: size == 0?Dimensions.factor11: size,
        height: height,
        fontFamily: 'Arial Rounded MT Bold',
        // fontWeight:  FontWeight.w500,
      ),
    );
  }
}
