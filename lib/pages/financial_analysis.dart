import 'package:flutter/material.dart';

class FinancialAnalysis extends StatelessWidget {
  const FinancialAnalysis({Key? key}) : super(key: key);

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
                color: Color.fromARGB(255, 16, 6, 50),
                child: const Center(
                    child: Text(
                  "FINANCIAL ENTITIES",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 1, 87, 247),
                  ),
                ))),
            const SizedBox(
              height: 25,
            ),
            Container(
              height: 330,
              color: const Color.fromARGB(255, 9, 59, 66),
              child: Column(
                children: const [
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Text(
                    "\bDEMAT ACCOUNT\b",
                    style: TextStyle(color: Color.fromARGB(255, 13, 12, 12), fontSize: 25,fontWeight: FontWeight.bold,backgroundColor: Colors.white),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Expanded(
                      child: Text(
                          "A Demat account is an form of e-account where an investor can store details related to traded stocks, mutual funds etc in a digital way. It helps to store proper track records of investments done by individuals. This digital mode eliminates theft or damage to hardcopies and promotes quick processing of funds.'Demat' arrives from the word dematerialisation which means converting physical form to electronic form. Your demat gets linked with your trading and bank account so you can start trading stocks by transferring funds to your demat account. As these accounts get linked all the process happens swiftly and safely." ,
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
              height: 220,
              color: Color.fromARGB(255, 3, 44, 14),
              child: Column(
                children: const [
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Text(
                    "\bACTIVE RETURNS\b ",
                    style: TextStyle(color: Color.fromARGB(255, 15, 1, 1), fontSize: 25,fontWeight: FontWeight.bold,backgroundColor: Colors.white),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Expanded(
                      child: Text(
                          "Active return is the percentage gain or loss of an investment relative to the investment's benchmark.An active return is a difference between benchmark and actual return. It can be positive or negative and is typically used to assess performance.For example, if benchmark return is 3% and actual return is 5%, then active return would  be = 2% (5% - 3% = 3%).",
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
              height: 330,
              color: const Color.fromARGB(255, 9, 59, 66),
              child: Column(
                children: const [
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Text(
                    "\bVOLATILITY\b",
                    style: TextStyle(color: Color.fromARGB(255, 23, 23, 23), fontSize: 25,fontWeight: FontWeight.bold,backgroundColor: Colors.white),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Expanded(
                      child: Text(
                          "Volatility is the measure of dispersion of returns of a particular market index. Volatility is associated with big swings in stock market. Rise and fall of prices beyond a set value in a particular interval of time results into volatility. More volatile assets are often considered riskier as compared to less volatile ones.Volatility can be measured on daily, weekly, monthly or annual basis.Volatility is often measured using the beta value. Beta measures the volatility in the prices of the stock as compared to the overall movement of the market. If the stock has a beta value of 2, it means for every 1 point change in the entire market, the prices of the stock changes by 2 points. ",
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
              height: 200,
              color: Color.fromARGB(255, 3, 44, 14),
              child: Column(
                children: const [
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Text(
                    "\bINTERNAL RATE OF RETURN (IRR)\b",
                    style: TextStyle(color: Color.fromARGB(255, 23, 23, 23), fontSize: 25,fontWeight: FontWeight.bold,backgroundColor: Colors.white),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Expanded(
                      child: Text(
                          "Internal rate of return is a metric used to analyze profitabillity of a investment. Higher the internal rate of return, more desirable an investment is to undertake. IRR is uniform for investments of varying types and, as such, can be used to rank multiple prospective investments on a relative basis.",
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
              height: 330,
              color: const Color.fromARGB(255, 9, 59, 66),
              child: Column(
                children: const [
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Text(
                    "\bDIVIDEND\b",
                    style: TextStyle(color: Color.fromARGB(255, 23, 23, 23), fontSize: 25,fontWeight: FontWeight.bold,backgroundColor: Colors.white),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Expanded(
                      child: Text(
                          "A dividend is the distribution of a company's earnings to its shareholders and is determined by company's board of directors. The dividend yield is the dividend per share and is expressed as dividend/price as a percentage of a company's share price. Many companies do not pay dividends and instead retain earnings to be invested back into the company. Dividend payments impact share price and the price may rise on the announcement approximately by the amount of the dividend declared and then decline by a similar amount at the opening session of the ex-dividend date. Dividend payments reflect positively on a company and help maintain investors’ trust.",
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
              height: 230,
              color: Color.fromARGB(255, 3, 44, 14),
              child: Column(
                children: const [
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Text(
                    "\bLEVERAGE\b",
                    style: TextStyle(color: Color.fromARGB(255, 23, 23, 23), fontSize: 25,fontWeight: FontWeight.bold,backgroundColor: Colors.white),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Expanded(
                      child: Text(
                          "Leverage refers to using borrowed amount as a funding source to expand returns from an investment. The concept of leverage is used by both investors and companies. Companies can use leverage to finance their assets. In other words, instead of issuing stock to raise capital, companies can use debt financing to invest in business operations in an attempt to increase shareholder value.",
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
              color: const Color.fromARGB(255, 9, 59, 66),
              child: Column(
                children: const [
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Text(
                    "\bP/E & P/B RATIO\b",
                    style: TextStyle(color: Color.fromARGB(255, 23, 23, 23), fontSize: 25,fontWeight: FontWeight.bold,backgroundColor: Colors.white),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Expanded(
                      child: Text(
                          "1) PE RATIO - The price-to-earnings ratio is the ratio for valuing a company that measures its current share price relative to its earnings per share. A high P/E ratio could mean that a company's stock is overvalued, or that investors are expecting high growth rates in the future. The P/E ratio helps one determine whether a stock is overvalued or undervalued. Sector PE is the average price-to-earning ratio of a particular sector or industry. It's used as a benchmark to compare the PE of a stock to the PE of an entire industry\n\n2) PB RATIO - Companies use the price-to-book ratio to compare a firm's market capitalization to its book value. It's calculated by dividing the company's stock price per share by its book value per share. Book value is equal to the cost of carrying an asset on a company's balance sheet. P/B ratios under 1 are typically considered solid investments, but usually, ratios ranging from 1-10 are considered good.",
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
              height: 230,
              color: Color.fromARGB(255, 3, 44, 14),
              child: Column(
                children: const [
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Text(
                    "\bVOLUME\b",
                    style: TextStyle(color: Color.fromARGB(255, 23, 23, 23), fontSize: 25,fontWeight: FontWeight.bold,backgroundColor: Colors.white),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Expanded(
                      child: Text(
                          "Volume is the amount of an asset or security that changes hands over some period of time, often over the course of a day. For instance, stock trading volume would refer to the number of shares of a security traded between its daily open and close. The higher the volume during a price move, the more significant the move and the lower the volume during a price move, the less significant the move.",
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
