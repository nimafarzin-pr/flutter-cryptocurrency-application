class MarketModel {
  List<MarketSubData>? data;
  int? timestamp;

  MarketModel({this.data, this.timestamp});

  MarketModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <MarketSubData>[];
      json['data'].forEach((v) {
        data!.add(MarketSubData.fromJson(v));
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

class MarketSubData {
  String? exchangeId;
  String? baseId;
  String? quoteId;
  String? baseSymbol;
  String? quoteSymbol;
  double? volumeUsd24Hr;
  double? priceUsd;
  String? volumePercent;

  MarketSubData(
      {this.exchangeId,
      this.baseId,
      this.quoteId,
      this.baseSymbol,
      this.quoteSymbol,
      this.volumeUsd24Hr,
      this.priceUsd,
      this.volumePercent});

  MarketSubData.fromJson(Map<String, dynamic> json) {
    final price = double.tryParse(json['priceUsd'].toString());
    final dPrice = double.tryParse(json['volumeUsd24Hr'].toString());

    exchangeId = json['exchangeId'];
    baseId = json['baseId'];
    quoteId = json['quoteId'];
    baseSymbol = json['baseSymbol'];
    quoteSymbol = json['quoteSymbol'];
    volumeUsd24Hr = dPrice ?? 0.0;
    priceUsd = price ?? 0.0;
    volumePercent = json['volumePercent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['exchangeId'] = exchangeId;
    data['baseId'] = baseId;
    data['quoteId'] = quoteId;
    data['baseSymbol'] = baseSymbol;
    data['quoteSymbol'] = quoteSymbol;
    data['volumeUsd24Hr'] = volumeUsd24Hr ?? 0.0;
    data['priceUsd'] = priceUsd ?? 0.0;
    data['volumePercent'] = volumePercent;
    return data;
  }
}
