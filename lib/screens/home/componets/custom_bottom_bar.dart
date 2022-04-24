// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:nftify/screens/components/rounded_icon_button.dart';
import 'package:nftify/theme.dart';
import 'package:provider/provider.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

enum Tabs { Home, Chat, Wallet, Favourites, Settings }

class _CustomBottomBarState extends State<CustomBottomBar> {
  Tabs active = Tabs.Home;
  setActiveTabState(Tabs tab) {
    setState(() {
      active = tab;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(5).copyWith(top: 8, bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RoundedIconButton(
              size: const Size(55, 55),
              iconColor:
                  active == Tabs.Home ? Theme.of(context).primaryColor : null,
              onPress: () => setActiveTabState(Tabs.Home),
              elevation: 0,
              iconData:
                  active == Tabs.Home ? IconlyBold.home : IconlyLight.home,
              backgroundColor: active == Tabs.Home
                  ? Theme.of(context).colorScheme.primaryVariant
                  : Colors.transparent),
          RoundedIconButton(
              size: const Size(55, 55),
              elevation: 0,
              iconColor:
                  active == Tabs.Chat ? Theme.of(context).primaryColor : null,
              onPress: () => setActiveTabState(Tabs.Chat),
              iconData:
                  active == Tabs.Chat ? IconlyBold.chat : IconlyLight.chat,
              backgroundColor: active == Tabs.Chat
                  ? Theme.of(context).colorScheme.primaryVariant
                  : Colors.transparent),
          RoundedIconButton(
              size: const Size(55, 55),
              elevation: 0,
              iconColor:
                  active == Tabs.Wallet ? Theme.of(context).primaryColor : null,
              onPress: () => setActiveTabState(Tabs.Wallet),
              iconData: active == Tabs.Wallet
                  ? IconlyBold.wallet
                  : IconlyLight.wallet,
              backgroundColor: active == Tabs.Wallet
                  ? Theme.of(context).colorScheme.primaryVariant
                  : Colors.transparent),
          RoundedIconButton(
              size: const Size(55, 55),
              elevation: 0,
              iconColor: active == Tabs.Favourites
                  ? Theme.of(context).primaryColor
                  : null,
              onPress: () => setActiveTabState(Tabs.Favourites),
              iconData: active == Tabs.Favourites
                  ? IconlyBold.heart
                  : IconlyLight.heart,
              backgroundColor: active == Tabs.Favourites
                  ? Theme.of(context).colorScheme.primaryVariant
                  : Colors.transparent),
          RoundedIconButton(
            size: const Size(55, 55),
            elevation: 0,
            onPress: () => context.read<ThemeProvider>().toggleTheme(),
            iconData: context.watch<ThemeProvider>().currentTheme == 'dark'
                ? Icons.light_mode_outlined
                : Icons.dark_mode_outlined,
          )
        ],
      ),
    );
  }
}
