// ignore_for_file: deprecated_member_use

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const imageUrl =
        "https://media.istockphoto.com/vectors/profile-picture-whith-red-tie-unknown-person-silhouette-vector-id526811989?k=20&m=526811989&s=170667a&w=0&h=PjvP6wCeDvfeG9_9niH-p0CG-aHhpa4jnBnzIW36xAQ=";

    return Drawer(
      child: Container(
        color: Color.fromARGB(255, 23, 24, 23),
        child: Padding(
          padding: EdgeInsets.zero,
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.zero,
                child: DrawerHeader(
                    decoration:
                        BoxDecoration(color: Color.fromARGB(255, 241, 241, 238)),
                    child: UserAccountsDrawerHeader(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 248, 246, 242)),
                      margin: EdgeInsets.zero,
                      accountName: Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          "APP DEVELOPER: KAIVAL SHAH",
                          style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),
                        ),
                      ),
                      accountEmail: Text(
                        "EMAIL-ID: mailkaivalshah@gmail.com",
                        style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),
                      ),
                      currentAccountPicture: Center(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 15),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(imageUrl),
                          ),
                        ),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 120,
                    ),
                    Container(
                        color: Color.fromARGB(255, 57, 84, 164),
                        child: Column(
                          children:  [
                            const Padding(
                              padding: EdgeInsets.only(right: 1),
                              child: Text(
                                "\n\bTHIS APP PROVIDES AN OVERVIEW OF \bSTOCK MARKET AND ALL THE MAJOR \bASPECTS ARE COVERED HERE. AFTER \bGOING THROUGH THE APP CONTENT YOU \bCAN VISIT THE OFFICIAL WEBSITE LINKS \bPROVIDED BELOW FOR MORE ANALYSIS.\n",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold,color: Colors.white),
                              ),
                              
                            ),
                            RichText(
                        text: TextSpan(
                          
                          children: [
                             const TextSpan(
                  text: 'NSE - ',
                  style: TextStyle(color: Color.fromARGB(255, 252, 248, 248),fontSize: 15,fontWeight: FontWeight.bold),
                ),
                            TextSpan(
                              text: 'https://www.nseindia.com/\n\n',
                              style: const TextStyle(color: Color.fromARGB(255, 236, 241, 241),fontSize: 15,decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  launch(
                                      'https://www.nseindia.com/');
                                },
                            ),
                            const TextSpan(
                  text: 'BSE -  ',
                  style:  TextStyle(color: Color.fromARGB(255, 235, 227, 227),fontSize: 15,fontWeight: FontWeight.bold),
                ),
                            TextSpan(
                              text: 'https://www.bseindia.com/\n',
                              style: const TextStyle(color: Color.fromARGB(255, 241, 243, 245),decoration: TextDecoration.underline,fontSize: 15),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  launch(
                                      'https://www.bseindia.com/');
                                },
                            ),
                          ],
                        ),
                      ),
                          ],
                        )),
                    const SizedBox(
                      height: 120,
                    ),
                    Container(
                      height: 130,
                      width: 350,
                       color: Colors.grey,
                      child: Column(
                        children:  const [
                          Center(
                            child: Text(
                                "\n\bPLEASE STAY TUNED FOR FURTHER APP \bRELATED UPDATES. FOR MORE HELP \bFEEL FREE TO CONTACT THE EMAIL ID \bMENTIONED ABOVE.",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold,color: Colors.white)),
                          ),
                        
                        ],
                      ),
                    ),
                      
                      
                    
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
