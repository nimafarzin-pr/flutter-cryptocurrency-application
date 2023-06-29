class CoinSummaryModel {
  List<SummarySubData>? data;
  int? timestamp;

  CoinSummaryModel({this.data, this.timestamp});

  CoinSummaryModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <SummarySubData>[];
      json['data'].forEach((v) {
        data!.add(SummarySubData.fromJson(v));
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

class SummarySubData {
  String? id;
  String? rank;
  String? symbol;
  String? name;
  String? supply;
  String? maxSupply;
  String? marketCapUsd;
  String? volumeUsd24Hr;
  double? priceUsd;
  String? changePercent24Hr;
  String? vwap24Hr;

  SummarySubData(
      {this.id,
      this.rank,
      this.symbol,
      this.name,
      this.supply,
      this.maxSupply,
      this.marketCapUsd,
      this.volumeUsd24Hr,
      this.priceUsd,
      this.changePercent24Hr,
      this.vwap24Hr});

  SummarySubData.fromJson(Map<String, dynamic> json) {
    final price = double.tryParse(json['priceUsd'].toString());
    id = json['id'];
    rank = json['rank'];
    symbol = json['symbol'];
    name = json['name'];
    supply = json['supply'];
    maxSupply = json['maxSupply'];
    marketCapUsd = json['marketCapUsd'];
    volumeUsd24Hr = json['volumeUsd24Hr'];
    priceUsd = price ?? 0.0;
    changePercent24Hr = json['changePercent24Hr'];
    vwap24Hr = json['vwap24Hr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['rank'] = rank;
    data['symbol'] = symbol;
    data['name'] = name;
    data['supply'] = supply;
    data['maxSupply'] = maxSupply;
    data['marketCapUsd'] = marketCapUsd;
    data['volumeUsd24Hr'] = volumeUsd24Hr;
    data['priceUsd'] = priceUsd ?? 0.0;
    data['changePercent24Hr'] = changePercent24Hr;
    data['vwap24Hr'] = vwap24Hr;
    return data;
  }
}
