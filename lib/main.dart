import 'package:flutter/material.dart';
import 'package:stocks/pages/daily_checks.dart';
import 'package:stocks/pages/financial_analysis.dart';
import 'package:stocks/pages/home_page.dart';
import 'package:stocks/pages/indian_indices.dart';
import 'package:stocks/pages/market_stocks.dart';
import 'package:stocks/pages/register_page.dart';
import 'package:stocks/pages/stock_graph.dart';
import 'package:stocks/utils/routes.dart';
import 'package:flutter/services.dart';
void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Abel',
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      title: "STOCKS",
      initialRoute: "/",
      routes: {
        "/": (context) => const RegisterPage(),
        MyRoutes.registerRoute:(context) => const RegisterPage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.indianRoute: (context) => const IndianIndices(),
        MyRoutes.finRoute: (context) => const FinancialAnalysis(),
        MyRoutes.marketRoute: (context) => const MarketStocks(), 
        MyRoutes.graphRoute: (context) => const StocksGraph(),
        MyRoutes.checkRoute: (context) => const DailyChecks(),
      },
    );
  }
}
