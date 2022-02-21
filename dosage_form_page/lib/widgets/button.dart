import 'dart:ui';

import 'package:dosage_form_page/utils/dimensions.dart';
import 'package:dosage_form_page/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'big_text.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  const ButtonWidget({
    Key? key,
    required this.text,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
          children: <Widget>[
            Container(
              child: OutlinedButton(
                style:OutlinedButton.styleFrom(
                  minimumSize: Size(Dimensions.factor340,Dimensions.factor60),
                  backgroundColor:Color(0xFF43B0D9),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(60)),
                  ),
                ),
                onPressed: () { print("button "+text); },
                child: BigText(text: text, color: Colors.white),
              ),

            ),
          ]
    );
  }
}