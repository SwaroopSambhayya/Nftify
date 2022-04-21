import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RenderSvg extends StatelessWidget {
  const RenderSvg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height / 4,
          child: SvgPicture.asset(
            'assets/dumble.svg',
            semanticsLabel: 'Dumble',
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height / 3,
          child: Transform(
            transform: Matrix4.translationValues(40, -70, 20),
            child: SvgPicture.asset(
              'assets/dumble.svg',
              semanticsLabel: 'Dumble',
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height / 4,
          child: Transform(
            transform: Matrix4.translationValues(180, -100, 20),
            child: SvgPicture.asset(
              'assets/dumble.svg',
              semanticsLabel: 'Dumble',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}
