import 'package:flutter/material.dart';

class StocksGraph extends StatelessWidget {
  const StocksGraph({Key? key}) : super(key: key);

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
          color: const Color.fromARGB(255, 10, 7, 0),

          child: Column(children:  [
          const SizedBox(height: 20,),
          Container(
            color: const Color.fromARGB(255, 71, 75, 79),
          child: Column(
            
            children: const [
              SizedBox(height: 10,),
              Text("READING A STOCK GRAPH",style: TextStyle(color: Color.fromARGB(255, 170, 211, 21),fontWeight: FontWeight.bold,fontSize: 20),),
              SizedBox(height: 10,),
              Image(image: AssetImage('assets/images/tcs_graph.png')),
              SizedBox(height: 10,),
              Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Expanded(
                      child: Text(
                          "As seen in the graph the x-axis denotes the time scale which can be adjusted as per the requirements. Secondly, the y-axis part indicates the price of the stocks over the period of time.\n\nUsually, it is considered safe to invest in a stock that does not show more volatility and there is a gradual increase in the stock value over a certain period of time.\n",
                          textAlign: TextAlign.justify,textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: true),
                          style: TextStyle(
                            letterSpacing: 1.4,
                            fontSize: 13.5,
                              color: Colors.white, fontFamily: 'Abel')),
                    ),
                  ),
            ],
          )
          ),
          const SizedBox(height: 10,),
          Container(
            color: const Color.fromARGB(255, 132, 117, 65),
            child: Column(
              children: const [
                SizedBox(height: 10,),
                Text("UNDERSTANDING CANDLESTICKS",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Color.fromARGB(255, 109, 235, 98)),),
                SizedBox(height: 10,),
                Image(image: AssetImage('assets/images/candlestick.jpg')),
                SizedBox(height: 10,),
                Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Expanded(
                      child: Text(
                          "1) BULLISH CANDLE - A green coloured candlistic pattern which indicates that the market is going to follow a bullish pattern after a recent reductants. When there is a consecutive group of such bullish candles, an uptrend is observed in the graph. The height denotes magnitude of change in price of stock for a particular interval of time .\n\n2) BEARISH CANDLE - This red coloured figure indicates that lower prices are about to come and a bearish market is observed if number of such candlesticks increase.\n",
                          textAlign: TextAlign.justify,textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: true),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.4,
                            fontSize: 13.5,
                              color: Color.fromARGB(255, 99, 221, 111), fontFamily: 'Abel')),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Container(

            color: Colors.blueGrey,
            child: Column(
              children: const [
                SizedBox(height: 10,),
                Text("ANALYSING A STOCK GRAPH",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.orange),),
                SizedBox(height: 10,),
                Image(image: AssetImage('assets/images/analysis.jpg')),
                SizedBox(height: 10,),
                Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Expanded(
                      child: Text(
                          "Overall Trend: The first step is to identify the overall trend. This can be accomplished with trend lines, moving averages or peak/trough analysis.\n\nSupport: Areas of congestion and previous lows below the current price mark the support levels. A break below support would be considered bearish and detrimental to the overall trend.\n\nResistance: Areas of congestion and previous highs above the current price mark the resistance levels. A break above resistance would be considered bullish and positive for the overall trend.\n",
                          textAlign: TextAlign.justify,textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: true),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.4,
                            fontSize: 13.5,
                              color: Colors.orangeAccent)),
                    ),
                  ),
              ],
            )
          ),
          ]),
        ),
      ),
    );
  }
}