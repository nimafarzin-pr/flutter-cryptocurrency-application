class CandleModel {
  List<CandleSubData>? data;
  int? timestamp;

  CandleModel({this.data, this.timestamp});

  CandleModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CandleSubData>[];
      json['data'].forEach((v) {
        data!.add(CandleSubData.fromJson(v));
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

class CandleSubData {
  String? open;
  String? high;
  String? low;
  String? close;
  String? volume;
  int? period;

  CandleSubData(
      {this.open, this.high, this.low, this.close, this.volume, this.period});

  CandleSubData.fromJson(Map<String, dynamic> json) {
    open = json['open'];
    high = json['high'];
    low = json['low'];
    close = json['close'];
    volume = json['volume'];
    period = json['period'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['open'] = open;
    data['high'] = high;
    data['low'] = low;
    data['close'] = close;
    data['volume'] = volume;
    data['period'] = period;
    return data;
  }
}
