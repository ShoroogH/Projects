import 'package:dosage_form_page/utils/dimensions.dart';
import 'package:dosage_form_page/widgets/big_text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:dosage_form_page/widgets/form_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageBody extends StatefulWidget {
  const PageBody({Key? key}) : super(key: key);

  @override
  _PageBodyState createState() => _PageBodyState();
}

class _PageBodyState extends State<PageBody> {
  PageController pageController = PageController(viewportFraction: 0.8);
  var _currPageValue = 0.0;
  double _height = Dimensions.factor510;
  double _scaleFactor = 0.95;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  //dispose means when we leave the page we make it inactive
  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.factor600,
      width: Dimensions.screenWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Slider section
          SizedBox(height: Dimensions.factor5,),
          Container(
            height: Dimensions.factor510,
            width: Dimensions.screenWidth,
            child: PageView.builder(
                controller: pageController,
                itemCount: preferences.length,
                // pageSnapping: true,
                itemBuilder: (context, position) {
                  final preference = preferences[position];
                  return _buildPageItem(preference, position);
                }),

          ),
          SizedBox(height: Dimensions.factor10,),
          // Dots
          Container(
            width: Dimensions.screenWidth,
            child: new DotsIndicator(
              dotsCount: preferences.length,
              position: _currPageValue,
              decorator: DotsDecorator(
                spacing: const EdgeInsets.all(20),
                color: Color(0xFFBDE4F1),
                activeColor: Color(0xFF43B0D9),
                size: const Size.square(10),
                // size: const Size.square(20),
                activeSize: const Size(20.0, 20.0),
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget _buildPageItem(Container preference, int index) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      // matrix = Matrix4.diagonal3Values(1.0, currScale, 1.0);
      matrix = Matrix4.diagonal3Values(1.0, currScale, 1.0)
        ..setTranslationRaw(0, currTrans, 0);
    }
    else if (index == _currPageValue.floor() + 1) {
      var currScale = _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1.0, currScale, 1.0)
        ..setTranslationRaw(0, currTrans, 0);

    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1.0, currScale, 1.0)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = _scaleFactor;
      matrix = Matrix4.diagonal3Values(1.0, currScale, 1.0)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }
    return Transform(
      transform: matrix,
      child: Container(
        margin: EdgeInsets.only(
            left: Dimensions.factor15,
            right: Dimensions.factor15,
            bottom: Dimensions.factor10,
            top: Dimensions.factor10
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.factor10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Color(0xFF000000),
                offset: Offset(0, 0),
                blurRadius: 5.0,
            ),
          ],
        ),
        // inside the box, preferences
        child: preference,
      ),

    );
  }

  //preferences (pages)
  final List<Container> preferences = [
    // preference 1
    Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: Dimensions.newfactor100,
                child: FormWidget(
                    icon: "assets/image/prefrences_icons-02.png",
                    text: "Effervescent"
                ),
              ),
              Container(
                width: Dimensions.newfactor70,
                child: FormWidget(
                    icon: "assets/image/prefrences_icons-04.png",
                    text: "Tablet"
                ),
              ),
              Container(
                width: Dimensions.newfactor85,
                child: FormWidget(
                    icon: "assets/image/prefrences_icons-05.png",
                    text: "Soft gel\ncapsules"
                ),
              ),
            ],
          ),
          SizedBox(height: Dimensions.factor50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: Dimensions.newfactor100,
                child: FormWidget(
                    icon: "assets/image/prefrences_icons-07.png",
                    text: "Oral Solution"
                ),
              ),
              Container(
                width: Dimensions.newfactor76,
                child: FormWidget(
                    icon: "assets/image/prefrences_icons-01.png",
                    text: "Drops"
                ),
              ),
              Container(
                width: Dimensions.newfactor76,
                child: FormWidget(
                    icon: "assets/image/prefrences_icons-06.png",
                    text: "Gummy Bear"
                ),
              ),
              SizedBox(width: Dimensions.factor5,),
            ],
          ),
          SizedBox(height: Dimensions.factor50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: Dimensions.newfactor95,
                child: FormWidget(
                    icon: "assets/image/prefrences_icons16-16.png",
                    text: "Powder\nFormula"
                ),
              ),
              Container(
                width: Dimensions.newfactor76,
                child: FormWidget(
                    icon: "assets/image/prefrences_icons-03.png",
                    text: "Capsule"
                ),
              ),
              Container(
                width: Dimensions.newfactor85,
                child: FormWidget(
                    icon: "assets/image/prefrences_icons-08.png",
                    text: "Oral\nAmpoule"
                ),
              ),
            ],
          ),
        ],
      ),
    ),
    // preference 2
    Container(),
    // preference 3
    Container(),
    // preference 4
    Container(),
  ];
}

