import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: const SizedBox(
          width: 70,
          child: Icon(IconlyLight.search),
        ),
        hintText: "Search artworks",
        filled: true,
        fillColor: Theme.of(context).colorScheme.secondary,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent, width: 0),
          borderRadius: BorderRadius.circular(100),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide.none),
      ),
    );
  }
}
