import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nftify/theme.dart';
import 'package:provider/src/provider.dart';
import 'package:shimmer/shimmer.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({Key? key}) : super(key: key);

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double horizontalDragPosition = 0;
  bool showText = true;
  final GlobalKey _slideKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      height: 60,
      decoration: BoxDecoration(
        color: const Color(0xffD499E2),
        borderRadius: BorderRadius.circular(
            (MediaQuery.of(context).size.width * 0.75 + 80) / 2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          GestureDetector(
            onPanUpdate: (details) {
              if (!(details.globalPosition.dx >=
                      (MediaQuery.of(context).size.width -
                                  MediaQuery.of(context).size.width * 0.75) /
                              2 +
                          MediaQuery.of(context).size.width * 0.75 -
                          55) &&
                  details.localPosition.dx > 0) {
                setState(() {
                  horizontalDragPosition = details.localPosition.dx;
                  showText = false;
                });
                RenderBox? box =
                    _slideKey.currentContext?.findRenderObject() as RenderBox?;
                Offset? position = box?.localToGlobal(Offset.zero);
                print(position?.dx);
                print("Horizontal" + horizontalDragPosition.toString());
                if (position?.dx != null &&
                    horizontalDragPosition + 55 > position!.dx) {}
              } else {
                Navigator.pushNamed(context, 'NftHome');
                setState(() {
                  horizontalDragPosition = 0;
                  showText = true;
                });
              }
            },
            onPanEnd: (details) {
              setState(() {
                horizontalDragPosition = 0;
                showText = true;
              });
            },
            child: Transform(
              transform:
                  Matrix4.translationValues(horizontalDragPosition, 0, 0),
              child: CircleAvatar(
                backgroundColor: Theme.of(context).textTheme.bodyText1!.color,
                radius: 25,
                child: const Icon(Icons.arrow_forward),
              ),
            ),
          ),
          if (showText)
            Expanded(
              child: Center(
                child: Shimmer.fromColors(
                  baseColor:
                      context.watch<ThemeProvider>().currentTheme == 'dark'
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).disabledColor,
                  highlightColor: Colors.grey,
                  child: Text(
                    "Let's Get Started",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          if (!showText)
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: DottedBorder(
                  borderType: BorderType.Circle,
                  dashPattern: const [6, 3, 6, 3],
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    width: 50,
                    height: 50,
                    key: _slideKey,
                    margin: const EdgeInsets.only(right: 2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          style: BorderStyle.none),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
