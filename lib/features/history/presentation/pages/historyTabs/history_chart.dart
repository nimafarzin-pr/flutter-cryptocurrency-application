// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coin_status/features/history/presentation/bloc/chart_status.dart';
import 'package:coin_status/features/history/presentation/pages/history_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/formater.dart';
import '../../../../../core/widgets/error_container.dart';
import '../../../../../core/widgets/loading_container.dart';
import '../../../../../core/widgets/text_widget.dart';
import '../../bloc/history_bloc.dart';
import '../../bloc/history_state.dart';
import '../../widgets/line_chart.dart';

class ChartTab extends StatefulWidget {
  const ChartTab({
    Key? key,
    required this.name,
    required this.price,
    required this.symbolId,
    required this.percentChange,
    required this.tabListItem,
  }) : super(key: key);

  final String name;
  final String price;
  final String symbolId;
  final double percentChange;
  final List<TimeInterval> tabListItem;

  @override
  State<ChartTab> createState() => _HistoryState();
}

class _HistoryState extends State<ChartTab> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                fontSize: 20,
                text: widget.name,
                color: Colors.white,
              ),
              CustomText(
                text: widget.price.toString(),
                color: Colors.white,
              ),
            ],
          ),
          const SizedBox(height: 20),
          CustomText(
            text: '${Formatter.toPercent(widget.percentChange)} %',
            color: widget.percentChange.isNegative
                ? Colors.red
                : Colors.greenAccent,
          ),
          const SizedBox(height: 20),
          Expanded(
            child: DefaultTabController(
              length: widget.tabListItem.length,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.black,
                  toolbarHeight: 0,
                  shadowColor: Colors.blueGrey,
                  bottom: TabBar(
                    onTap: (value) {
                      context.read<HistoryBloc>().add(GetHistory(
                          interval: widget.tabListItem[value].name.toString(),
                          symbolId: widget.symbolId));
                    },
                    isScrollable: true,
                    tabs: widget.tabListItem
                        .map((e) => Tab(text: e.name.toString()))
                        .toList(),
                  ),
                ),
                body: BlocBuilder<HistoryBloc, HistoryState>(
                  builder: (context, state) {
                    if (state.chartStatus is ChartStatusLoaded) {
                      final dataList = state.chartStatus as ChartStatusLoaded;
                      final List<double>? data =
                          dataList.data?.data?.map((e) => e.priceUsd!).toList();
                      return Container(
                        color: Colors.red,
                        width: double.infinity,
                        // height: 400,
                        child: LineChartWidget(
                          color: widget.percentChange.isNegative
                              ? Colors.redAccent
                              : const Color(0xff02d39a),
                          data: data ?? [],
                        ),
                      );
                    } else if (state.chartStatus is ChartStatusError) {
                      final error = state.chartStatus as ChartStatusError;
                      return ErrorContainer(text: error.message);
                    } else {
                      return const LoadingContainer();
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
