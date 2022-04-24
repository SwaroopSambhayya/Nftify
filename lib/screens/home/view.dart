import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:nftify/screens/components/custom_card.dart';
import 'package:nftify/screens/components/rounded_icon_button.dart';
import 'package:nftify/screens/components/search_field.dart';
import 'package:nftify/screens/home/componets/categories.dart';
import 'package:nftify/screens/home/componets/custom_bottom_bar.dart';
import 'package:nftify/screens/home/componets/header.dart';
import 'package:tcard/tcard.dart';

class NftHome extends StatefulWidget {
  const NftHome({Key? key}) : super(key: key);

  @override
  State<NftHome> createState() => _NftHomeState();
}

class _NftHomeState extends State<NftHome> {
  List<Map<String, dynamic>> nfts = [
    {
      "cardName": "Bored Ape Yacht Club",
      "owner": "alankabalan",
      "url":
          "https://lh3.googleusercontent.com/-19OnF4JPSYKb_Iz4DqQcmimQY-QHf9Qc-2VIDGQibxzLEiFkvAXCE0KE1u1XzttnkMZoc7xukRx5Cs3oburrqdlNgLv4f8bIuQ1z2k=s0",
      "currentBid": "2.099",
      "currency": "ETH"
    },
    {
      "cardName": "CloneX",
      "owner": "sen3_vault",
      "url":
          "https://lh3.googleusercontent.com/eblhqfZIUgon6zfE8uAzBygABxdOb7WjtHff0Jt8aliTAoswNFY54fCWq3akaJ7uu0cFk1C2e-Mkl4BYP9vI2FpyqGoHG-ctV_IcVg=s0",
      "currentBid": "5.08",
      "currency": "ETH"
    },
    {
      "cardName": "Bored Ape Yacht Club",
      "owner": "Dadjudicator",
      "url":
          "https://lh3.googleusercontent.com/jY3UkYH6v9OvQmTs7Fgv06DXB7IxEE1OO898p9XbB5cUlTAIML2QeUCFMOZajf-kWbtyXMM4rFKYAJoKHfShPSJPl9T7qenORAq9=s0",
      "currentBid": "3.02",
      "currency": "ETH"
    }
  ];
  List<CustomCard> customCards = [];

  @override
  void initState() {
    customCards = nfts
        .map(
          (ele) => CustomCard(
            cardName: ele["cardName"],
            owner: ele["owner"],
            url: ele["url"],
            currentBid: ele["currentBid"],
            currency: ele["currency"],
          ),
        )
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 33, bottom: 25),
        child: Stack(
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    children: [
                      const Header(),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 20),
                        child: Row(
                          children: [
                            const Expanded(
                              child: SearchField(),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: const RoundedIconButton(
                                iconData: IconlyLight.notification,
                                size: Size(60, 60),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Categories(),
                      Container(
                        margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20)
                            .copyWith(bottom: 60),
                        child: TCard(
                          cards: customCards,
                          lockYAxis: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Positioned(
              bottom: 0,
              left: 20,
              right: 20,
              child: CustomBottomBar(),
            )
          ],
        ),
      ),
    );
  }
}
