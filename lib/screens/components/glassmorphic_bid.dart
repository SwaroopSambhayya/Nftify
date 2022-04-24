import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class GlassmorphicBid extends StatelessWidget {
  const GlassmorphicBid({
    Key? key,
    required this.bid,
    required this.currency,
  }) : super(key: key);

  final String bid;
  final String currency;

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: MediaQuery.of(context).size.width,
      height: 70,
      borderRadius: 50,
      blur: 20,
      alignment: Alignment.bottomCenter,
      border: 0,
      linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFffffff).withOpacity(0.1),
            const Color(0xFFFFFFFF).withOpacity(0.05),
          ],
          stops: const [
            0.1,
            1,
          ]),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color(0xFFffffff).withOpacity(0.5),
          const Color((0xFFFFFFFF)).withOpacity(0.5),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8).copyWith(left: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Current Bid",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).disabledColor),
                ),
                Text(
                  bid + " " + currency,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w800),
                )
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(120, 55),
                shape: const StadiumBorder(),
                primary: Theme.of(context).textTheme.bodyText1!.color,
              ),
              child: Text(
                "Place a bid",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
