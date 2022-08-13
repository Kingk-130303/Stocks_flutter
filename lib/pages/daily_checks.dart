import 'package:flutter/material.dart';

class DailyChecks extends StatelessWidget {
  const DailyChecks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
appBar: AppBar(
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(20)),
        shadowColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 65, 1, 59),
        centerTitle: true,
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(right: 45),
            child: Text(
              "STOCK ANALYSIS",
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dashed,
                  backgroundColor: Colors.transparent,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 250, 249, 248)),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(255, 9, 9, 9),
          child: Column(children: [
            const SizedBox(
              height: 20,
            ),
            Container(
                color: Color.fromARGB(255, 16, 70, 35),
                child: const Center(
                    child: Text(
                  "INVESTMENT STRATEGIES",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ))),
            const SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.cyan,
              child: Column(
                children: const [
                  SizedBox(height: 10,),
                    Image(image: AssetImage('assets/images/value_investing.png')),
                  SizedBox(height: 10,),
                Padding(
                  padding: EdgeInsets.only(left: 15,right: 15),
                    child: Expanded(
                      child: Text(
                          "1) VALUE INVESTING - Value investors seek stocks they believe are undervalued. They look for stocks with prices they believe don’t fully reflect the intrinsic value of the security. Value investing is predicated, in part, on the idea that some degree of irrationality exists in the market. This irrationality, in theory, presents opportunities to get a stock at a discounted price and make money from it.",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromARGB(255, 16, 16, 16),fontFamily: 'Abel',fontWeight: FontWeight.bold)),
                    ),
                ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              color: Color.fromARGB(255, 4, 120, 66),
              child: Column(
                children: const [
                  SizedBox(height: 10,),
                    Image(image: AssetImage('assets/images/growth_investing.jpg')),
                  SizedBox(height: 10,),
                Padding(
                  padding: EdgeInsets.only(left: 15,right: 15),
                    child: Expanded(
                      child: Text(
                          "2) GROWTH INVESTING -  Growth investors want investments that offer strong upside potential when it comes to the future earnings of stocks. It could be said that a growth investor is often looking for the “next big thing.”Growth investing is inherently riskier and generally only thrives during certain economic conditions. Investors looking for shorter investing horizons with greater potential than value companies are best suited for growth investing. Growth investing is also ideal for investors that are not concerned with investment cashflow or dividends.",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromARGB(255, 16, 16, 16),fontFamily: 'Abel',fontWeight: FontWeight.bold)),
                    ),
                ),
                ],
              ),
            ),
                        const SizedBox(
              height: 20,
            ),
            Container(
              color: Color.fromARGB(255, 15, 32, 181),
              child: Column(
                children: const [
                  SizedBox(height: 10,),
                    Image(image: AssetImage('assets/images/momentum_investing.jpg')),
                  SizedBox(height: 10,),
                Padding(
                  padding: EdgeInsets.only(left: 15,right: 15),
                    child: Expanded(
                      child: Text(
                          "2) MOMENTUM INVESTING - Momentum investors ride the wave. They believe winners keep winning and losers keep losing. They look to buy stocks experiencing an uptrend.Momentum investors are heavily reliant on technical analysts. They use a strictly data-driven approach to trading and look for patterns in stock prices to guide their purchasing decisions.Due to its highly-speculative nature, momentum investing is among the riskiest strategies. It's more suitable for investors that have capital they are okay with potentially losing, as this style of investing most closely resembles day trading and has the greatest downside potential.\n",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromARGB(255, 234, 227, 227),fontFamily: 'Abel',fontWeight: FontWeight.bold)),
                    ),
                ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}