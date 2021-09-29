import 'dart:async';
import 'package:combo_expert/Screen/HomeScreen.dart';
import 'package:combo_expert/Screen/SignUpScreen.dart';
import 'package:combo_expert/Screen/RegisterScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? finalnumber;

class SplashScreen extends StatefulWidget {
  // const splashscreen({ Key? key }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getValidatioData().whenComplete(
      () async {
        Timer(
            Duration(seconds: 4),
            () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SignUpScreen(),
                ))

            // showDialog(
            //   context: context,
            //   builder: (context) {
            //     return AlertDialog(
            //       content: Image.asset('images/CELogo.jpeg'),
            //       actions: [
            //         FlatButton(
            //           onPressed: () {
            //             Navigator.of(context).push(
            //               MaterialPageRoute(
            //                 builder: (context) => SignUpScreen(),
            //               ),
            //             );
            //           },
            //           child: Text("Exit"),
            //         ),
            //       ],
            //     );
            //   },
            // ),
            );
      },
    );
    super.initState();
  }

  Future getValidatioData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainednumber = sharedPreferences.getString('number');
    setState(
      () {
        finalnumber = obtainednumber;
      },
    );
    print(finalnumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/CELogo.jpeg"),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
