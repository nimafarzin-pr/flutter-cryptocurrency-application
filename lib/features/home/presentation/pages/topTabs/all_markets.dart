import '../../../data/models/markets_model.dart';
import '../../bloc/home_bloc.dart';
import '../../bloc/markets_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/dialogs/custom_generic_dialog.dart';
import '../../../../../core/widgets/market_item.dart';

class AllMarkets extends StatefulWidget {
  const AllMarkets({super.key});

  @override
  State<AllMarkets> createState() => _AllMarketsState();
}

class _AllMarketsState extends State<AllMarkets>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator(
      onRefresh: () async {
        context.read<HomeBloc>().add(GetAllMarketsEvent());
      },
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state.coinListStatus is MarketsListError) {
            final error = state.coinListStatus as MarketsListError;
            customGenericDialog(message: error.message, context: context);
          }
        },
        builder: (context, state) {
          if (state.marketsStatus is MarketsListLoaded) {
            final data = state.marketsStatus as MarketsListLoaded;
            return ListView.builder(
              itemCount: data.data.data?.length,
              itemBuilder: (context, index) {
                final item = data.data.data![index];
                final timestamp = data.data.timestamp!;
                final percentDouble =
                    double.tryParse(item.percentExchangeVolume!);
                var date =
                    DateTime.fromMicrosecondsSinceEpoch(timestamp * 1000);
                return MarketItem<MarketsSubData>(
                  item: item,
                  time: date.toLocal().toString(),
                  percent: percentDouble ?? 0.0,
                );
              },
            );
          } else if (state.marketsStatus is MarketsListError) {
            final error = state.marketsStatus as MarketsListError;
            return Center(child: Text(error.message));
          } else {
            return const SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
