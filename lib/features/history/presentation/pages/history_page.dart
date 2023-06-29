import 'historyTabs/history_chart.dart';
import 'historyTabs/history_market.dart';
import 'package:flutter/material.dart';

enum TimeInterval { m1, m5, m15, m30, h1, h2, h6, h12, d1 }

class HistoryPage extends StatelessWidget {
  const HistoryPage({
    super.key,
    required this.name,
    required this.price,
    required this.percentChange,
    required this.symbolId,
  });
  final String name;
  final String price;
  final String symbolId;
  final double percentChange;

  @override
  Widget build(BuildContext context) {
    final tabListItem = TimeInterval.values.reversed.toList();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: Text('$name History'),
            backgroundColor: Colors.black,
            toolbarHeight: 50,
            shadowColor: Colors.blueGrey,
            bottom:
                const TabBar(tabs: [Tab(text: 'Chart'), Tab(text: 'Markets')]),
          ),
          body: TabBarView(
            children: [
              ChartTab(
                name: name,
                price: price,
                symbolId: symbolId,
                percentChange: percentChange,
                tabListItem: tabListItem,
              ),
              const MarketTab(),
            ],
          )),
    );
  }
}
