import 'package:flutter/material.dart';
import 'package:nftify/screens/onboarding/components/custom_slider.dart';
import 'package:nftify/screens/onboarding/components/render_svg.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  double currentSlideValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              const Positioned(
                top: -20,
                right: 0,
                child: RenderSvg(),
              ),
              Positioned(
                top: 30,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/nftible.png',
                        fit: BoxFit.contain,
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      const Text(
                        'nftify',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned.fill(
                top: MediaQuery.of(context).size.height * 0.27,
                left: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "DISCOVER, COLLECT, AND SELL NFTS",
                      style:
                          TextStyle(fontSize: 65, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "nftify is the world's first and largest NFT market",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 30,
                left: (MediaQuery.of(context).size.width -
                        MediaQuery.of(context).size.width * 0.75) /
                    2,
                child: const CustomSlider(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
