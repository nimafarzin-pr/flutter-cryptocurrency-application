import '../../../../core/widgets/loading_container.dart';
import '../bloc/candlestick_bloc.dart';
import '../bloc/candlestick_list_status.dart';
import '../bloc/candlestick_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/dialogs/custom_generic_dialog.dart';
import '../../../../core/router/routes.dart';
import '../widgets/candlestick_list_item.dart';

class CandleStickMarketList extends StatefulWidget {
  const CandleStickMarketList({super.key});

  @override
  State<CandleStickMarketList> createState() => _CandleStickMarketListState();
}

class _CandleStickMarketListState extends State<CandleStickMarketList>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.black, title: const Text('Markets')),
      backgroundColor: Colors.black,
      body: BlocConsumer<CandlestickBloc, CandlestickState>(
        listener: (context, state) {
          if (state.candlestickListStatus is CandlestickListError) {
            final error = state.candlestickListStatus as CandlestickListError;
            customGenericDialog(message: error.message, context: context);
          }
        },
        builder: (context, state) {
          if (state.candlestickListStatus is CandlestickListLoaded) {
            final data = state.candlestickListStatus as CandlestickListLoaded;
            return ListView.builder(
              itemCount: data.data.result?.length,
              itemBuilder: (context, index) {
                final item = data.data.result![index];
                return CandleStickMarketListItem(
                  item: item,
                  onTap: () {
                    context.goNamed(Routes.name[RouteName.ohlcInfo]!,
                        extra: <String, dynamic>{
                          'pair': item.pair,
                          'exchange': item.exchange ?? '',
                        });
                  },
                );
              },
            );
          } else if (state.candlestickListStatus is CandlestickListError) {
            final error = state.candlestickListStatus as CandlestickListError;
            return Center(child: Text(error.message));
          } else {
            return const LoadingContainer();
          }
        },
      ),
    );
  }
}
