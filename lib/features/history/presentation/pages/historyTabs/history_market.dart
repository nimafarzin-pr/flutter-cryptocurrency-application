import '../../../../../core/widgets/loading_container.dart';

import '../../bloc/history_bloc.dart';
import '../../bloc/history_state.dart';
import '../../bloc/market_status.dart';
import '../../../../../core/widgets/market_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MarketTab extends StatefulWidget {
  const MarketTab({super.key});

  @override
  State<MarketTab> createState() => _MarketTabState();
}

class _MarketTabState extends State<MarketTab>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<HistoryBloc, HistoryState>(
      builder: (context, state) {
        if (state.marketStatus is MarketStatusLoaded) {
          final data = state.marketStatus as MarketStatusLoaded;
          return ListView.builder(
            itemCount: data.data.data?.length,
            itemBuilder: (context, index) {
              final item = data.data.data![index];
              final timestamp = data.data.timestamp!;
              final percentDouble = double.tryParse(item.volumePercent!);
              var date = DateTime.fromMicrosecondsSinceEpoch(timestamp * 1000);
              return MarketItem(
                item: item,
                time: date.toLocal().toString(),
                percent: percentDouble ?? 0.0,
              );
            },
          );
        } else if (state.marketStatus is MarketStatusError) {
          final error = state.marketStatus as MarketStatusError;

          return Center(child: Text(error.message));
        } else {
          return const LoadingContainer();
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
