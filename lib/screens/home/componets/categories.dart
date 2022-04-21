import 'package:flutter/material.dart';
import 'package:nftify/screens/components/stadium_button.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final data = ["Popular", "Trending", "Latest"];
  String active = "";

  @override
  void initState() {
    active = data[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.only(left: 20),
        child: Row(
          children: data
              .map(
                (ele) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: StadiumButton(
                    title: ele,
                    active: ele == active,
                    onPress: () => setState(() {
                      active = ele;
                    }),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
