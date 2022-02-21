import 'package:dosage_form_page/home/page_body.dart';
import 'package:dosage_form_page/utils/dimensions.dart';
import 'package:dosage_form_page/widgets/big_text.dart';
import 'package:dosage_form_page/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F8F4),
      body: Column(
        children: [
          SizedBox(height: Dimensions.factor30,),
          //App Bar
          Stack(
              children: [
                Container(
                  width: double.maxFinite,
                  height: Dimensions.factor100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/image/header1.png"),
                    ),
                  ),
                  padding: EdgeInsets.only(
                      left:Dimensions.factor109,
                      right: Dimensions.factor109,
                      top: Dimensions.factor30
                  ),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.factor30
                    ),
                    child: BigText(text: "Select Dosage form", color: Colors.white,),
                  ),
                ),
              ],
          ),

          // showing the body
          Container(child: PageBody(),),

          // Button
          Container(
            child: ButtonWidget(text: "Next"),
          ),
        ],
      ),
    );
  }
}
