import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nftify/screens/components/glassmorphic_bid.dart';

class PlaceBid extends StatefulWidget {
  final String currency;
  final String bid;
  const PlaceBid({Key? key, required this.bid, required this.currency})
      : super(key: key);

  @override
  State<PlaceBid> createState() => _PlaceBidState();
}

class _PlaceBidState extends State<PlaceBid> {
  Timer? countdownTimer;

  Duration myDuration = Duration(hours: 3, minutes: 20, seconds: 59);
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      startTimer();
    });
  }

  @override
  void dispose() {
    stopTimer();
    super.dispose();
  }

  /// Timer related methods ///
  // Step 3
  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  // Step 4
  void stopTimer() {
    countdownTimer!.cancel();
  }

  // Step 5
  void resetTimer() {
    stopTimer();
    setState(() => myDuration = Duration(days: 5));
  }

  // Step 6
  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  String strDigits(int n) => n.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20)
          .copyWith(bottom: 60),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Theme.of(context).colorScheme.secondary),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "${hours}h   :    ${minutes}m   :    ${seconds}s",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: GlassmorphicBid(bid: widget.bid, currency: widget.currency),
          )
        ],
      ),
    );
  }
}
