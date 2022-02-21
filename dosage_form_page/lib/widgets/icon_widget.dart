import 'package:dosage_form_page/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';

class IconWidget extends StatelessWidget {
  final String icon;
  const IconWidget({
    Key? key,
    required this.icon,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 70,
          width: 70,
          margin: EdgeInsets.only(
              left: 20,
              right: 8,
              top: 15),
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            image: DecorationImage(
              image: AssetImage(icon),
            ),
          ),
        ),
      ],
    );
  }
}
