import 'package:dosage_form_page/utils/dimensions.dart';
import 'package:dosage_form_page/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'icon_widget.dart';

class FormWidget extends StatelessWidget {
  final String icon;
  final String text;
  const FormWidget({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => {},
      child: Column(
        children: <Widget>[
          Container(
            height: Dimensions.factor45,
            width: Dimensions.factor45,
            // margin: EdgeInsets.all(Dimensions.factor10),
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              image: DecorationImage(
                image: AssetImage(icon),
              ),
            ),
          ),
          SizedBox(height: Dimensions.factor5,),
          SmallText(text: text),
        ],
      ),
    );

  }
}
