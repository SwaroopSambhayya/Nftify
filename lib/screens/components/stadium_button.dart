import 'package:flutter/material.dart';

class StadiumButton extends StatelessWidget {
  final String title;
  final bool active;
  final void Function() onPress;
  const StadiumButton(
      {Key? key,
      required this.title,
      this.active = false,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(110, 55),
        shape: const StadiumBorder(),
        primary: active ? null : Theme.of(context).colorScheme.secondary,
      ),
      child: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color:
                active ? null : Theme.of(context).textTheme.bodyText1!.color),
      ),
    );
  }
}
