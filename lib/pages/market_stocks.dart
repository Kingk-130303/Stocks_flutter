import 'package:flutter/material.dart';

class MarketStocks extends StatelessWidget {
  const MarketStocks({Key? key}) : super(key: key);

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
          child: Column(children: [
            const SizedBox(
              height: 30,
            ),
            Container(
                color: Color.fromARGB(255, 146, 212, 96),
                child: const Center(
                    child: Text(
                  "MARKET TERMINOLOGY",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 186, 28, 78),
                  ),
                ))),
            const SizedBox(
              height: 25,
            ),
            Container(
              height: 250,
              color: const Color.fromARGB(255, 9, 59, 66),
              child: Column(
                children: const [
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Text(
                    "\bPORTFOLIO\b",
                    style: TextStyle(color: Color.fromARGB(255, 13, 12, 12), fontSize: 25,fontWeight: FontWeight.bold,backgroundColor: Colors.white),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Expanded(
                      child: Text(
                          "A portfolio is a collection of financial investments like stocks, bonds, commodities, cash, and cash equivalents. A portfolio may contain a wide range of assets including real estate, art, and private investments.Diversification is a key concept in portfolio management.A person's tolerance for risk, investment objectives, and time horizon are all critical factors when assembling and adjusting an investment portfolio." ,
                          textAlign: TextAlign.justify,textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: true),
                          style: TextStyle(
                            letterSpacing: 1.4,
                            fontSize: 13.5,
                              color: Colors.white, fontFamily: 'Abel')),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              height: 230,
              color: Color.fromARGB(255, 3, 44, 14),
              child: Column(
                children: const [
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Text(
                    "\bINITIAL PUBLIC OFFER (IPO)\b ",
                    style: TextStyle(color: Color.fromARGB(255, 15, 1, 1), fontSize: 25,fontWeight: FontWeight.bold,backgroundColor: Colors.white),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Expanded(
                      child: Text(
                          "An initial public offering (IPO) refers to the process of offering shares of a private corporation to the public in a new stock issuance for the first time. An IPO allows a company to raise equity capital from public investors. The IPO process essentially consists of two parts. The first is the pre-marketing phase of the offering, while the second is the initial public offering itself. ",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            letterSpacing: 1.4,
                            fontSize: 13.5,
                              color: Colors.white, fontFamily: 'Abel')),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              height: 420,
              color: Color.fromARGB(255, 54, 80, 83),
              child: Column(
                children: const [
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Text(
                    "\bFUTURES AND OPTIONS\b",
                    style: TextStyle(color: Color.fromARGB(255, 23, 23, 23), fontSize: 25,fontWeight: FontWeight.bold,backgroundColor: Colors.white),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Expanded(
                      child: Text(
                          "1) FUTURES - Futures are financial contracts that bind parties to buy or sell an asset at a predetermined date and time. Futures are used to hedge the price movement of an underlying asset to help prevent losses from unfavorable price changes.\n\n2) OPTIONS - The term option refers to a financial instrument that is based on the value of underlying securities such as stocks. An options contract offers the buyer the opportunity to buy or sell—depending on the type of contract they hold. Each contract will have a specific expiration date by which the holder must exercise their option. The stated price on an option is known as the strike price. Call options allow the holder to buy the asset at a stated price within a specific timeframe. Put options, on the other hand, allow the holder to sell the asset at a stated price within a specific timeframe",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            letterSpacing: 1.4,
                            fontSize: 13.5,
                              color: Colors.white, fontFamily: 'Abel')),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              height: 250,
               color: Color.fromARGB(255, 3, 44, 14),
              child: Column(
                children: const [
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Text(
                    "\bARBITRAGE\b",
                    style: TextStyle(color: Color.fromARGB(255, 23, 23, 23), fontSize: 25,fontWeight: FontWeight.bold,backgroundColor: Colors.white),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Expanded(
                      child: Text(
                          "Arbitrage is the simultaneous purchase and sale of the same asset in different markets in order to profit from tiny differences in the asset's listed price. Arbitrage can be used whenever any stock, commodity, or currency may be purchased in one market at a given price and simultaneously sold in another market at a higher price. The situation creates an opportunity for a risk-free profit for the trader.",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            letterSpacing: 1.4,
                            fontSize: 13.5,
                              color: Colors.white, fontFamily: 'Abel')),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              height: 290,
              color: Color.fromARGB(255, 54, 80, 83),
              child: Column(
                children: const [
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Text(
                    "\bMUTUAL FUNDS\b",
                    style: TextStyle(color: Color.fromARGB(255, 23, 23, 23), fontSize: 25,fontWeight: FontWeight.bold,backgroundColor: Colors.white),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Expanded(
                      child: Text(
                          "A mutual fund is a financial vehicle that pools assets from shareholders to invest in securities like stocks, bonds, money market instruments, and other assets. Mutual funds give small or individual investors access to professionally managed portfolios of equities, bonds, and other securities. The value of the mutual fund depends on the performance of the securities in which it invests. When buying a unit or share of a mutual fund, an investor is buying the performance of its portfolio or, more precisely, a part of the portfolio's value. ",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            letterSpacing: 1.4,
                            fontSize: 13.5,
                              color: Colors.white, fontFamily: 'Abel')),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              height: 260,
               color: Color.fromARGB(255, 3, 44, 14),
              child: Column(
                children: const [
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Text(
                    "\bEXCHANGE TRADED FUNDS (ETF)\b",
                    style: TextStyle(color: Color.fromARGB(255, 23, 23, 23), fontSize: 25,fontWeight: FontWeight.bold,backgroundColor: Colors.white),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Expanded(
                      child: Text(
                          "An exchange-traded fund (ETF) is a type of pooled investment security that operates much like a mutual fund. But unlike mutual funds, ETFs can be purchased or sold on a stock exchange the same way that a regular stock can.  ETFs tend to be more cost-effective and more liquid compared to mutual funds. An ETF is a type of fund that holds multiple underlying assets, rather than only one like a stock does. Because there are multiple assets within an ETF, they can be a popular choice for diversification.",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            letterSpacing: 1.4,
                            fontSize: 13.5,
                              color: Colors.white, fontFamily: 'Abel')),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              height: 460,
              color: Color.fromARGB(255, 54, 80, 83),
              child: Column(
                children: const [
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Text(
                    "\bMARKET SECURITY (SEBI)\b",
                    style: TextStyle(color: Color.fromARGB(255, 23, 23, 23), fontSize: 25,fontWeight: FontWeight.bold,backgroundColor: Colors.white),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Expanded(
                      child: Text(
                          "The Securities and Exchange Board of India (SEBI) is the most important regulator of securities markets in India. SEBI has wide-ranging regulatory, investigative, and enforcement powers, including the ability to impose fines on violators. Additional Surveillance Measures (ASM) and Graded Surveillance Measures (GSM) are measures taken by SEBI to safeguard the interest of investors and enhance market integrity.\n\nRED FLAGS - A red flag is a warning or indicator, suggesting that there is a potential problem or threat with a company's stock, financial statements, or news reports. Red flags tend to vary. There are many different methods used to pick stocks and investments, and therefore, many different types of red flags. So a red flag for one investor may not be one for another.",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            letterSpacing: 1.4,
                            fontSize: 13.5,
                              color: Colors.white, fontFamily: 'Abel')),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              height: 700,
               color: Color.fromARGB(255, 3, 44, 14),
              child: Column(
                children: const [
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Text(
                    "\bFEW IMPORTANT TERMS\b",
                    style: TextStyle(color: Color.fromARGB(255, 23, 23, 23), fontSize: 25,fontWeight: FontWeight.bold,backgroundColor: Colors.white),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Expanded(
                      child: Text(
                          "1) ASK - It refers to the lowest price at which the owner is willing to sell the share in stock market. \n\n2) BID - It refers to the highest price the buyer of the share is ready to pay.\n\n3) BULL MARKET - A bull market is a market where the prices of the stocks are increasing over a prolonged period of time.\n\n4) BEAR MARKET - It refers to a period in which the prices of equity shares fall consistently.\n\n5) BLUE CHIP STOCK - The stocks of a company which is well-established and its equity shares  have very high market cap are called blue chip stocks.\n\n6) BOND - A bond is a fixed income investment which is issued by the government or a company to its buyers. It shows a specified amount which an investor lends to the issuer of the bond for a specified period of time at a variable or fixed interest rate called the coupon rate.\n\n7) CLOSE PRICE - It is the final price on a specific trading day at which the equity shares of a company are sold or traded.\n\n8) FACE VALUE - It relates to the amount of money or the value in cash that the holder of a security will obtain from the issuer of the security when the security matures at the specific date.",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            letterSpacing: 1.4,
                            fontSize: 13.5,
                              color: Colors.white, fontFamily: 'Abel')),
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