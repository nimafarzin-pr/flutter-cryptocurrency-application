class CoinHistoryModel {
  List<HistoryData>? data;
  int? timestamp;

  CoinHistoryModel({this.data, this.timestamp});

  CoinHistoryModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <HistoryData>[];
      json['data'].forEach((v) {
        data!.add(HistoryData.fromJson(v));
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

class HistoryData {
  double? priceUsd;
  int? time;

  HistoryData({this.priceUsd, this.time});

  HistoryData.fromJson(Map<String, dynamic> json) {
    priceUsd = double.parse(json['priceUsd'] ?? 0.0);
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['priceUsd'] = priceUsd;
    data['time'] = time;
    return data;
  }
}
