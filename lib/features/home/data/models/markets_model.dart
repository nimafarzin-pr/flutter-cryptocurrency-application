class MarketsModel {
  List<MarketsSubData>? data;
  int? timestamp;

  MarketsModel({this.data, this.timestamp});

  MarketsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <MarketsSubData>[];
      json['data'].forEach((v) {
        data!.add(MarketsSubData.fromJson(v));
      });
    }
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['timestamp'] = timestamp;
    return data;
  }
}

class MarketsSubData {
  String? exchangeId;
  String? rank;
  String? baseSymbol;
  String? baseId;
  String? quoteSymbol;
  String? quoteId;
  String? priceQuote;
  double? priceUsd;
  double? volumeUsd24Hr;
  String? percentExchangeVolume;
  String? tradesCount24Hr;
  int? updated;

  MarketsSubData(
      {this.exchangeId,
      this.rank,
      this.baseSymbol,
      this.baseId,
      this.quoteSymbol,
      this.quoteId,
      this.priceQuote,
      this.priceUsd,
      this.volumeUsd24Hr,
      this.percentExchangeVolume,
      this.tradesCount24Hr,
      this.updated});

  MarketsSubData.fromJson(Map<String, dynamic> json) {
    final price = double.tryParse(json['priceUsd'].toString());
    final volume4Hr = double.tryParse(json['volumeUsd24Hr'].toString());

    exchangeId = json['exchangeId'];
    rank = json['rank'];
    baseSymbol = json['baseSymbol'];
    baseId = json['baseId'];
    quoteSymbol = json['quoteSymbol'];
    quoteId = json['quoteId'];
    priceQuote = json['priceQuote'];
    priceUsd = price ?? 0.0;
    volumeUsd24Hr = volume4Hr ?? 0.0;
    percentExchangeVolume = json['percentExchangeVolume'];
    tradesCount24Hr = json['tradesCount24Hr'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['exchangeId'] = exchangeId;
    data['rank'] = rank;
    data['baseSymbol'] = baseSymbol;
    data['baseId'] = baseId;
    data['quoteSymbol'] = quoteSymbol;
    data['quoteId'] = quoteId;
    data['priceQuote'] = priceQuote;
    data['priceUsd'] = priceUsd ?? 0.0;
    data['volumeUsd24Hr'] = volumeUsd24Hr ?? 0.0;
    data['percentExchangeVolume'] = percentExchangeVolume;
    data['tradesCount24Hr'] = tradesCount24Hr;
    data['updated'] = updated;
    return data;
  }
}
