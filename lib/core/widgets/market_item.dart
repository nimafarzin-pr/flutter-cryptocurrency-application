import 'package:flutter/material.dart';

import '../../features/history/data/models/market_model.dart';
import '../../features/home/data/models/markets_model.dart';
import '../utils/formater.dart';
import 'text_widget.dart';

class MarketItem<T> extends StatefulWidget {
  const MarketItem({
    super.key,
    required this.item,
    required this.time,
    this.onTap,
    required this.percent,
  });
  final T item;
  final String time;
  final Function()? onTap;
  final double percent;

  @override
  State<MarketItem<T>> createState() => _MarketItemState<T>();
}

class _MarketItemState<T> extends State<MarketItem<T>> {
  var itemKind;

  @override
  void initState() {
    super.initState();
    itemKind = widget.item is MarketSubData
        ? widget.item as MarketSubData
        : widget.item as MarketsSubData;
  }

  @override
  Widget build(BuildContext context) {
    final percentChangeColor =
        widget.percent.isNegative ? Colors.red : Colors.green;
    final changeIcon =
        widget.percent.isNegative ? Icons.arrow_drop_down : Icons.arrow_drop_up;
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: const Color(0xff27374d),
        child: ListTile(
          dense: true,
          onTap: widget.onTap,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CustomText(
                    fontSize: 18,
                    color: Colors.white,
                    text: itemKind.exchangeId ?? "",
                  ),
                  const SizedBox(width: 10),
                  CustomText(
                    text:
                        '${itemKind.baseSymbol.toString()}/${itemKind.quoteSymbol.toString()}',
                    // text: item.priceUsd ?? "",
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ],
              ),
              SizedBox(
                width: 90,
                height: 40,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      changeIcon,
                      color: percentChangeColor,
                      size: 30,
                    ),
                    CustomText(
                      text: '${Formatter.toPercent(widget.percent)} %',
                      color: percentChangeColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
          horizontalTitleGap: 2,
          subtitle: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text:
                              '${Formatter.toCurrency(itemKind.volumeUsd24Hr)} 24h',
                          // text: item.priceUsd ?? "",
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: widget.time,
                          color: Colors.grey,
                        ),
                        CustomText(
                          fontSize: 14,
                          color: Colors.white,
                          text: Formatter.toCurrency(itemKind.priceUsd),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          titleAlignment: ListTileTitleAlignment.center,
          splashColor: Colors.white,
          isThreeLine: true,
          minLeadingWidth: 60,
          subtitleTextStyle: const TextStyle(fontSize: 10),
          contentPadding: const EdgeInsets.all(10),
          titleTextStyle:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
      ),
    );
  }
}
