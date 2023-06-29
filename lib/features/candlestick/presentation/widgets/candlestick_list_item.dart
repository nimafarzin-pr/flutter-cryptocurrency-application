import 'package:flutter/material.dart';

import '../../../../core/widgets/text_widget.dart';
import '../../data/models/candlestick_model.dart';

class CandleStickMarketListItem extends StatelessWidget {
  final Function()? onTap;
  final CandleStickSubData item;
  const CandleStickMarketListItem({super.key, this.onTap, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: const Color(0xff27374d),
      child: ListTile(
        dense: true,
        onTap: onTap,
        title: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              fontSize: 18,
              color: Colors.white,
              text: item.exchange ?? "",
            ),
            CustomText(
              fontSize: 18,
              color: Colors.white,
              text: item.pair?.toUpperCase() ?? "",
            ),
          ],
        ),
        horizontalTitleGap: 2,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        titleAlignment: ListTileTitleAlignment.center,
        splashColor: Colors.white,
        isThreeLine: false,
        minLeadingWidth: 60,
        subtitleTextStyle: const TextStyle(fontSize: 10),
        contentPadding: const EdgeInsets.all(10),
        titleTextStyle:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
      ),
    );
  }
}
