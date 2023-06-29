import '../../features/candlestick/presentation/bloc/candlestick_bloc.dart';
import '../../features/candlestick/presentation/pages/candlestick_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/candlestick/presentation/pages/candlestick_makkets_list.dart';
import '../../features/history/presentation/bloc/history_bloc.dart';
import '../../features/history/presentation/pages/history_page.dart';
import '../../features/home/presentation/bloc/home_bloc.dart';
import '../../features/home/presentation/pages/home.dart';
import '../widgets/navigation_scafold.dart';
import 'routes.dart';

// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');

final router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        // the UI shell
        return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
      },
      branches: [
        // first branch (A)
        StatefulShellBranch(
          navigatorKey: _shellNavigatorAKey,
          routes: [
            // top route inside branch
            GoRoute(
              path: '/',
              pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: BlocProvider(
                  create: (_) => HomeBloc()
                    ..add(GetAllCoinsEvent())
                    ..add(GetAllMarketsEvent()),
                  child: const Home(),
                ),
              ),
              routes: [
                // child route
                GoRoute(
                  path: Routes.name[RouteName.history]!,
                  name: Routes.name[RouteName.history]!,
                  pageBuilder: (context, state) {
                    final Map<String, dynamic> param =
                        state.extra as Map<String, dynamic>;
                    final symbol = param['symbolId']!;
                    return NoTransitionPage(
                      key: state.pageKey,
                      child: BlocProvider(
                        create: (_) => HistoryBloc()
                          // get needed param for making api request
                          ..add(GetHistory(
                              interval: param['interval']!, symbolId: symbol))
                          ..add(GetMarkets(symbolId: symbol)),
                        // get item data from previous page
                        child: HistoryPage(
                          symbolId: symbol,
                          percentChange: param['percentChange'],
                          name: param['name'],
                          price: param['price'],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        // second branch (B)
        StatefulShellBranch(
          navigatorKey: _shellNavigatorBKey,
          routes: [
            // top route inside branch
            GoRoute(
              path: '/${Routes.name[RouteName.candleStickList]!}',
              name: Routes.name[RouteName.candleStickList]!,
              pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: BlocProvider(
                  create: (context) =>
                      CandlestickBloc()..add(GetCandleStickMarkets()),
                  child: const CandleStickMarketList(),
                ),
              ),
              routes: [
                // child route
                GoRoute(
                  path: Routes.name[RouteName.ohlcInfo]!,
                  name: Routes.name[RouteName.ohlcInfo]!,
                  pageBuilder: (context, state) {
                    final Map<String, dynamic> param =
                        state.extra as Map<String, dynamic>;
                    final pair = param['pair']!;
                    final exchange = param['exchange']!;
                    return NoTransitionPage(
                      key: state.pageKey,
                      child: BlocProvider(
                        create: (_) => CandlestickBloc()
                          // get needed param for making api request
                          ..add(GetOHLCData(pair: pair, exchange: exchange)),
                        // get item data from previous page
                        child: CandleStickChartPage(
                            title:
                                '${pair.toString().toUpperCase()} ${exchange.toString().toUpperCase()}'),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
