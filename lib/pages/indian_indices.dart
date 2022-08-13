import 'package:flutter/material.dart';

class IndianIndices extends StatelessWidget {
  const IndianIndices({Key? key}) : super(key: key);

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
                color: const Color.fromARGB(255, 227, 245, 250),
                child: const Center(
                    child: Text(
                  "INDIAN INDICES",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 247, 112, 1),
                  ),
                ))),
            const SizedBox(
              height: 25,
            ),
            Container(
              height: 330,
              color: const Color.fromARGB(255, 26, 123, 136),
              child: Column(
                children: const [
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Text(
                    "\bBSE SENSEX\b",
                    style: TextStyle(color: Color.fromARGB(255, 13, 12, 12), fontSize: 25,fontWeight: FontWeight.bold,backgroundColor: Colors.white),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Expanded(
                      child: Text(
                          "Sensex stands for 'Stock Exchange Sensitive Index' which is stock market index for BSE(Bombay Stock Exchange),it is a number that indicates the direction of the market just like exit polls do for elections. Based on small sample size, the daily changes in the Sensex value determines whether the market goes up or down. Sensex is calculated by analyzing the stats of 30 companies and it creates a general impression of the current market scenario. Top 30 companies having the highest free float market capitalizalisation are included to calculate Sensex. Free float market capitalization is a value calculated as;\n(sharePrice) x (TotalShares- Company_owned_shares)",
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
              color: Color.fromARGB(255, 17, 141, 50),
              child: Column(
                children: const [
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Text(
                    "\bNSE NIFTY\b ",
                    style: TextStyle(color: Color.fromARGB(255, 15, 1, 1), fontSize: 25,fontWeight: FontWeight.bold,backgroundColor: Colors.white),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Expanded(
                      child: Text(
                          "NIFTY means 'National Stock Exchange Fifty' which is a stock market index for NSE (National Stock Exchange) . As the name suggests, top 50 successful companies are considered to calculate this index. This index is calculated using the same free float methodology. As it computes and analyses more companies, Nifty is considered more reliable than Sensex but that's not the case everytime.",
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
              height: 680,
              color: Color.fromARGB(255, 26, 123, 136),
              child: Column(
                children: const [
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Text(
                    " SECTORIAL AND BROAD\b\n \b MARKET INDICES\b\b",
                    style: TextStyle(color: Color.fromARGB(255, 23, 23, 23), fontSize: 25,fontWeight: FontWeight.bold,backgroundColor: Colors.white),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Expanded(
                      child: Text(
                          " 1) BSE Bankex\n\nThis index comprises of companies related to the bank sector which are included in the list of top 500 BSE. This index depicts the performance of the financial sector of the country.\n\n2) NIFTY Healthcare index\n\nThe Nifty Healthcare Index comprises of maximum of 20 stocks that are listed on the National Stock Exchange which reflects the performance of healthcare companies of the country.\n\n3) NIFTY Smallcap 250 index\n\nThis index intends to measure the performance of small market capitalisation companies ranked 251-500 on NSE.\n\n4) BSE 400 Midsmallcap index\n\nCompanies which fall under a particular range in BSE can be analyzed using this index. As per data, this index calculation comprises surveillance of 15% of total companies registered on BSE.\n\nNOTE - There are many indices based on different sectors which cover a broader market and can be very useful for detailed analysis.",
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
