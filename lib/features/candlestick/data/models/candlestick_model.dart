class CandleStickModel {
  List<CandleStickSubData>? result;

  CandleStickModel({this.result});

  CandleStickModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <CandleStickSubData>[];
      json['result'].forEach((v) {
        result!.add(CandleStickSubData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CandleStickSubData {
  int? id;
  String? exchange;
  String? pair;
  bool? active;
  String? route;

  CandleStickSubData(
      {this.id, this.exchange, this.pair, this.active, this.route});

  CandleStickSubData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    exchange = json['exchange'];
    pair = json['pair'];
    active = json['active'];
    route = json['route'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['exchange'] = exchange;
    data['pair'] = pair;
    data['active'] = active;
    data['route'] = route;
    return data;
  }
}
