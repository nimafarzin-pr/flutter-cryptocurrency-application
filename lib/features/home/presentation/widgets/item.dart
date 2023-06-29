import '../../../../core/utils/formater.dart';
import '../../data/models/coin_summary_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/text_widget.dart';

class Item extends StatelessWidget {
  const Item({
    super.key,
    required this.item,
    required this.time,
    this.onTap,
    required this.percent,
  });
  final SummarySubData item;
  final String time;
  final Function()? onTap;
  final double percent;

  @override
  Widget build(BuildContext context) {
    final percentChangeColor = percent.isNegative ? Colors.red : Colors.green;

    final changeIcon =
        percent.isNegative ? Icons.arrow_drop_down : Icons.arrow_drop_up;
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        color: const Color(0xff27374d),
        child: ListTile(
          onTap: onTap,
          title: CustomText(
            fontSize: 18,
            color: Colors.white,
            text: item.name ?? "",
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: Formatter.toCurrency(item.priceUsd),
                // text: item.priceUsd ?? "",
                fontSize: 12,
                color: Colors.white,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomText(
                text: time,
                color: Colors.grey,
              ),
            ],
          ),
          trailing: SizedBox(
            width: 78,
            height: 40,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Icon(
                  changeIcon,
                  color: percentChangeColor,
                  size: 30,
                )),
                CustomText(
                  text: '${Formatter.toPercent(percent)} %',
                  color: percentChangeColor,
                ),
              ],
            ),
          ),
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.black,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: CustomText(
                  fontSize: 20,
                  enableCenter: true,
                  fontWeight: FontWeight.bold,
                  text: item.name!.characters.first,
                  color: Colors.white,
                ),
              ),
            ),
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
