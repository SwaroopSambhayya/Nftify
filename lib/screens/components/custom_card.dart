import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:nftify/screens/components/glassmorphic_bid.dart';
import 'package:nftify/screens/components/loading_card.dart';
import 'package:nftify/screens/components/rounded_icon_button.dart';
import 'package:nftify/screens/nftDetail/view.dart';
import 'package:nftify/theme.dart';

class CustomCard extends StatefulWidget {
  final String cardName;
  final String owner;
  final String url;
  final String currentBid;
  final String currency;
  const CustomCard(
      {Key? key,
      required this.cardName,
      required this.owner,
      required this.currentBid,
      required this.currency,
      required this.url})
      : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool isAllLoaded = false;
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          isAllLoaded = true;
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) {
                return AnimatedBuilder(
                    animation: animation,
                    builder: (BuildContext context, Widget? child) {
                      return Opacity(
                        opacity: animation.value,
                        child: NftDetailScreen(
                            cardName: widget.cardName,
                            owner: widget.owner,
                            currentBid: widget.currentBid,
                            currency: widget.currency,
                            url: widget.url),
                      );
                    });
              },
              transitionDuration: const Duration(milliseconds: 600),
            ),
          );
        },
        child: AspectRatio(
          aspectRatio: 1,
          child: Stack(
            children: [
              Positioned.fill(
                child: Hero(
                  tag: widget.url,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Image.network(
                      widget.url,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }

                        return const LoadingCard();
                      },
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 10, top: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (isAllLoaded) ...[
                            FittedBox(
                              child: Text(
                                widget.cardName,
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            FittedBox(
                              child: Text(
                                '@' + widget.owner,
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        ],
                      ),
                    ),
                    if (isAllLoaded)
                      RoundedIconButton(
                        size: const Size(55, 55),
                        elevation: 0,
                        iconData: IconlyLight.heart,
                        backgroundColor: Colors.transparent,
                        border: Border.all(
                            color: getColorForTheme(
                              context,
                            ),
                            width: 0.5),
                      )
                  ],
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                left: 10,
                child: GlassmorphicBid(
                    bid: widget.currentBid, currency: widget.currency),
              )
            ],
          ),
        ),
      ),
    );
  }
}
