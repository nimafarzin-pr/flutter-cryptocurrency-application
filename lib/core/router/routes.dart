enum RouteName { home, history, candleStickList, ohlcInfo }

class Routes {
  static Map<RouteName, String> name = {
    RouteName.home: '${RouteName.home}',
    RouteName.history: '${RouteName.history}',
    RouteName.candleStickList: '${RouteName.candleStickList}',
    RouteName.ohlcInfo: '${RouteName.ohlcInfo}'
  };
}
