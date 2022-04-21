import 'package:flutter/material.dart';
import 'package:nftify/theme.dart';

class RoundedIconButton extends StatelessWidget {
  final IconData iconData;
  final Size size;
  final Color? backgroundColor;
  final double? elevation;
  final BoxBorder? border;
  const RoundedIconButton(
      {Key? key,
      required this.size,
      required this.iconData,
      this.border,
      this.elevation,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, border: border),
      child: ElevatedButton(
        onPressed: () {},
        child: Icon(
          iconData,
          color: getColorForTheme(context),
        ),
        style: ElevatedButton.styleFrom(
            fixedSize: size,
            elevation: elevation,
            shape: const CircleBorder(),
            primary:
                backgroundColor ?? Theme.of(context).colorScheme.secondary),
      ),
    );
  }
}
