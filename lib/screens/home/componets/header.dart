import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Hey Swaroop",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              Text(
                "38.6M+ items in market",
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
          const CircleAvatar(
            minRadius: 32,
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1488426862026-3ee34a7d66df?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80'),
          )
        ],
      ),
    );
  }
}
