// ignore_for_file: sized_box_for_whitespace

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:stocks/utils/auth_service.dart';
import 'package:stocks/utils/routes.dart';
import '../widgets/drawer.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  var isAlertSet = false;

  @override
  void initState(){
    getConnectivity();
    super.initState();
  }

  getConnectivity() => 
    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) async{ 
      isDeviceConnected = await InternetConnectionChecker().hasConnection;
      if (!isDeviceConnected && !isAlertSet) {
        showDialogBox();
        setState(() {
          isAlertSet = true;
        });
      }
    },);

    void dispose(){
      subscription.cancel();
      super.dispose();
    }


  Widget build(BuildContext context) {
    AuthService _authService = AuthService();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions:  [IconButton(onPressed: () {
          showDialog(context: context, builder: (context) =>  AlertDialog(
            backgroundColor: Colors.blue,
            title: const Text("\bAPP VISION\b",style: TextStyle(fontSize: 20,backgroundColor: Colors.amber,fontWeight: FontWeight.bold),),
            content:  const Text("This app aims to help its users get a brief idea about the stock market and it is exclusively recommended for stock market beginners who need to get basic knowledge before entering into this world.",style: TextStyle(fontSize: 20,color: Colors.white),),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text("\bOK\b",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,backgroundColor: Colors.amber,color: Color.fromARGB(255, 8, 8, 8)),))
          ],)
          );
        }, icon: Image.asset('assets/images/aim.png'))],
        
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(20)),
        shadowColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 65, 1, 59),
        centerTitle: true,
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(right: 10),
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
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 252, 2, 2),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(25)),
                  //height: 150,
                  width: 384,
                  child: const Center(
                      child: Text(
                    "SELECT MODULE BELOW",
                    style: TextStyle(
                        color: Color.fromARGB(255, 248, 250, 248), fontWeight: FontWeight.bold,fontSize: 20),
                  )),
                ),
                const SizedBox(height: 20),
                ElevatedButton(onPressed:() async{
                  await _authService.logoutUser();
                  Navigator.pushReplacementNamed(context, MyRoutes.loginRoute);

                }, child: Text("Logout")),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(25),
                      image: const DecorationImage(
                          image: NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReDZliySEsTLfHdK-2g1s9GTQombIqHgd28g&usqp=CAU"),
                          fit: BoxFit.cover)),
                  height: 150,
                  width: 384,
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 10, left: 25),
                        child: Image(
                          image: AssetImage('assets/images/title.jpg'),
                          height: 250,
                          width: 140,
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      ElevatedButton(
                        autofocus: true,
                        style: ButtonStyle(
                          alignment: Alignment.center,
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      side: const BorderSide(
                                          color: Color.fromARGB(
                                              255, 234, 230, 229)))),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 55, 40, 103)),
                        ),
                        //
                        onPressed: () {
                          Navigator.pushNamed(context, MyRoutes.indianRoute);
                        },
                        child: const Text("INDIAN INDICES",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                             // decoration: TextDecoration.underline,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            )),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 220, 93, 84),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  height: 150,
                  width: 384,
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 10, left: 25),
                        child: Image(
                          image: AssetImage(
                              'assets/images/financial_analysis.jpg'),
                          height: 250,
                          width: 140,
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      side: const BorderSide(
                                          color: Color.fromARGB(
                                              255, 234, 230, 229)))),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 7, 92, 132)),
                        ),
                        //
                        onPressed: () {
                          
                          Navigator.pushNamed(context, MyRoutes.finRoute);
                        },
                        child: const Text("FINANCE TERMS",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              //decoration: TextDecoration.underline,
                              fontSize: 20,
                            )),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 13, 167, 233),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(30)),
                  height: 150,
                  width: 385,
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 10, left: 25),
                        child: Image(
                          image: AssetImage('assets/images/market_terms.jpg'),
                          height: 250,
                          width: 140,
                        ),
                      ),
                      const SizedBox(
                        width: 32,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      side: const BorderSide(
                                          color: Color.fromARGB(
                                              255, 234, 230, 229)))),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 90, 7, 57)),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, MyRoutes.marketRoute);
                        },
                        child: const Text("MARKET TERMS",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              //decoration: TextDecoration.underline,
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            )),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(30),
                      image: const DecorationImage(
                          image: NetworkImage(
                              "https://thumbs.dreamstime.com/b/abstract-financial-chart-uptrend-line-graph-stock-market-blue-light-background-growing-income-schedule-vector-design-171012725.jpg"),
                          fit: BoxFit.cover)),
                  height: 150,
                  width: 384,
                  //color: Color.fromARGB(255, 190, 214, 208),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 10, left: 25),
                        child: Image(
                          image: AssetImage('assets/images/stocks_graph.jpg'),
                          height: 250,
                          width: 140,
                        ),
                      ),
                      const SizedBox(
                        width: 32,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      side: const BorderSide(
                                          color: Color.fromARGB(
                                              255, 234, 230, 229)))),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 4, 141, 27)),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, MyRoutes.graphRoute);
                        },
                        child: const Text("STOCK GRAPH",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              //decoration: TextDecoration.underline,
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            )),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
          
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 35, 102, 23),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(30),
                      ),
                  height: 150,
                  width: 384,
                  //color: Color.fromARGB(255, 144, 182, 239),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 10, left: 25),
                        child: Image(
                          image: AssetImage('assets/images/daily_checks.jpg'),
                          height: 250,
                          width: 140,
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      side: const BorderSide(
                                          color: Color.fromARGB(
                                              255, 234, 230, 229)))),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 139, 72, 121)),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, MyRoutes.checkRoute);
                        },
                        child: const Text("HOW TO INVEST",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              //decoration: TextDecoration.underline,
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
    showDialogBox() => showCupertinoDialog<String>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Text('No Connection'),
          content: const Text('Please check your internet connectivity'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.pop(context, 'Cancel');
                setState(() => isAlertSet = false);
                isDeviceConnected =
                    await InternetConnectionChecker().hasConnection;
                if (!isDeviceConnected && isAlertSet == false) {
                  showDialogBox();
                  setState(() => isAlertSet = true);
                }
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
}
