import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:nftify/screens/components/rounded_icon_button.dart';
import 'package:nftify/screens/components/stadium_button.dart';
import 'package:nftify/screens/nftDetail/components/description.dart';
import 'package:nftify/screens/nftDetail/components/place_bid.dart';
import 'package:nftify/theme.dart';

class NftDetailScreen extends StatelessWidget {
  final String cardName;
  final String owner;
  final String url;
  final String currentBid;
  final String currency;
  const NftDetailScreen(
      {Key? key,
      required this.cardName,
      required this.owner,
      required this.currentBid,
      required this.currency,
      required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: url,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.network(
                      url,
                      fit: BoxFit.contain,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ),
                Positioned(
                  left: 15,
                  top: 50,
                  child: RoundedIconButton(
                    size: const Size(55, 55),
                    elevation: 0,
                    onPress: () {
                      Navigator.pop(context);
                    },
                    iconData: IconlyLight.arrowLeft,
                    backgroundColor: Colors.transparent,
                    border: Border.all(
                        color: getColorForTheme(
                          context,
                        ),
                        width: 0.5),
                  ),
                ),
                Positioned(
                  right: 15,
                  top: 50,
                  child: RoundedIconButton(
                    size: const Size(55, 55),
                    elevation: 0,
                    iconData: IconlyLight.heart,
                    backgroundColor: Colors.transparent,
                    border: Border.all(
                        color: getColorForTheme(
                          context,
                        ),
                        width: 0.5),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(20).copyWith(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cardName,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '@' + owner,
                          style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).disabledColor),
                        )
                      ],
                    ),
                  ),
                  StadiumButton(
                    title: "Follow",
                    onPress: () {},
                    active: true,
                  )
                ],
              ),
            ),
            const DecriptionSection(),
            PlaceBid(
              currency: currency,
              bid: currentBid,
            )
          ],
        ),
      ),
    );
  }
}
