import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingCard extends StatelessWidget {
  const LoadingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      print(constraints.maxWidth);
      return Shimmer.fromColors(
          child: Container(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            color: Colors.grey,
          ),
          baseColor: Theme.of(context).colorScheme.secondary,
          highlightColor: Theme.of(context).scaffoldBackgroundColor);
    });
  }
}
