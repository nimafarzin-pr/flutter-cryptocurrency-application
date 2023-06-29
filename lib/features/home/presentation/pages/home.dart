import 'topTabs/all_coin.dart';
import 'topTabs/all_markets.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          toolbarHeight: 10,
          shadowColor: Colors.blueGrey,
          bottom: const TabBar(
            tabs: [Tab(text: "All Coin"), Tab(text: "Markets Status")],
          ),
        ),
        body: const TabBarView(
          children: [
            AllCoins(),
            AllMarkets(),
          ],
        ),
      ),
    );
  }
}
