import 'package:candlesticks/candlesticks.dart';
import '../bloc/candlestick_bloc.dart';
import '../bloc/candlestick_ohlc_status.dart';
import '../bloc/candlestick_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dialogs/custom_generic_dialog.dart';
import '../../../../core/widgets/loading_container.dart';

/// api priority
// [
//   CloseTime,
//   OpenPrice,
//   HighPrice,
//   LowPrice,
//   ClosePrice,
//   Volume,
//   QuoteVolume
// ]

class CandleStickChartPage extends StatefulWidget {
  final String title;

  const CandleStickChartPage({super.key, required this.title});

  @override
  State<CandleStickChartPage> createState() => _CandleStickChartPageState();
}

class _CandleStickChartPageState extends State<CandleStickChartPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  List<Candle> getTimePeriod({required OHLCLoaded data, required int index}) {
    final List<List<double>> w1 = data.data.result.the604800;
    final List<List<double>> d1 = data.data.result.the86400;
    final List<List<double>> h1 = data.data.result.the3600;

    final List<List<List<double>>> allData = [h1, d1, w1];

    final List<Candle> candles = allData[index].map((e) {
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(e.first.round());
      return Candle(
          date: dateTime,
          high: e[2],
          low: e[3],
          open: e[1],
          close: e[4],
          volume: e[5]);
    }).toList();
    return candles;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black,
      ),
      body: BlocConsumer<CandlestickBloc, CandlestickState>(
        listener: (context, state) {
          if (state.ohlcStatus is OHLCError) {
            final error = state.candlestickListStatus as OHLCError;
            customGenericDialog(message: error.message, context: context);
          }
        },
        builder: (context, state) {
          if (state.ohlcStatus is OHLCLoaded) {
            final data = state.ohlcStatus as OHLCLoaded;
            return DefaultTabController(
              length: 3,
              child: Scaffold(
                backgroundColor: Colors.black,
                appBar: AppBar(
                  backgroundColor: Colors.black,
                  toolbarHeight: 10,
                  shadowColor: Colors.blueGrey,
                  bottom: const TabBar(
                    tabs: [Tab(text: "h1"), Tab(text: "d1"), Tab(text: "w1")],
                  ),
                ),
                body: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Builder(builder: (context) {
                      final List<Candle> candles =
                          getTimePeriod(data: data, index: 0);
                      return Candlesticks(
                        candles: candles,
                      );
                    }),
                    Builder(builder: (context) {
                      final List<Candle> candles =
                          getTimePeriod(data: data, index: 1);
                      return Candlesticks(
                        candles: candles,
                      );
                    }),
                    Builder(builder: (context) {
                      final List<Candle> candles =
                          getTimePeriod(data: data, index: 2);
                      return Candlesticks(
                        candles: candles,
                      );
                    })
                  ],
                ),
              ),
            );
          } else if (state.ohlcStatus is OHLCError) {
            final error = state.ohlcStatus as OHLCError;
            return Center(child: Text(error.message));
          } else {
            return const LoadingContainer();
          }
        },
      ),
    );
  }
}
