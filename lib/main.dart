// @dart =2.9
import 'package:combo_expert/Screen/ALLPlanDetailsScreen.dart';
import 'package:combo_expert/Screen/BachatPlusScreen.dart';
import 'package:combo_expert/Screen/ChildPlanScreen.dart';
import 'package:combo_expert/Screen/ChildrenComboScreen.dart';
import 'package:combo_expert/Screen/ComboExpertScreen.dart';
import 'package:combo_expert/Screen/EndowmentPlanScreen.dart';
import 'package:combo_expert/Screen/FamilyComboScreen.dart';
import 'package:combo_expert/Screen/HEALTHPlanScreen.dart';
import 'package:combo_expert/Screen/HNIScreen.dart';
import 'package:combo_expert/Screen/HealthComboScreen.dart';
import 'package:combo_expert/Screen/MoneyBackComboScreen.dart';
import 'package:combo_expert/Screen/MoneyBackPlansScreen.dart';
import 'package:combo_expert/Screen/PensionAnnuityPlansScreen.dart';
import 'package:combo_expert/Screen/RetirementScreen.dart';
import 'package:combo_expert/Screen/SinglePremiumPlansScreen.dart';
import 'package:combo_expert/Screen/SpecialComboScreen.dart';
import 'package:combo_expert/Screen/TermInsuranceSpecialScreen.dart';
import 'package:combo_expert/Screen/TermPlansScreen.dart';
import 'package:combo_expert/Screen/ULIPPlansScreen.dart';
import 'package:combo_expert/Screen/WholeLifePlansScreen.dart';
import 'package:combo_expert/Screen/WomensSpecialScreen.dart';
import 'package:combo_expert/Screen/RegisterScreen.dart';
import 'package:combo_expert/Screen/SplashScreen.dart';
import 'package:combo_expert/Screen/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:combo_expert/Screen/SavingPlanScreen.dart';

import 'Screen/SignUpScreen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class drawercode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DrawerHeader(
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black,
                              size: 20,
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/CELogo.jpeg'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Text("John",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        Text(
                          "9876543210",
                          style:
                              TextStyle(color: Colors.grey[700], fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home, size: 30),
                title: Text('Home', style: TextStyle(fontSize: 20)),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
              ),
              Divider(
                color: Colors.black,
              ),
              ListTile(
                leading: Icon(Icons.info, size: 30),
                title: Text('About Us', style: TextStyle(fontSize: 20)),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
              ),
              Divider(
                color: Colors.black,
              ),
              ListTile(
                leading: Icon(Icons.list, size: 30),
                title: Text('About Product', style: TextStyle(fontSize: 20)),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
              ),
              Divider(
                color: Colors.black,
              ),
              ListTile(
                leading: Icon(Icons.card_membership, size: 30),
                title: Text('License Info', style: TextStyle(fontSize: 20)),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
              ),
              Divider(
                color: Colors.black,
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart, size: 30),
                title: Text('Buy Now & Contact Us',
                    style: TextStyle(fontSize: 20)),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
              ),
              Divider(
                color: Colors.black,
              ),
              ListTile(
                leading: Icon(Icons.warning, size: 30),
                title: Text('Disclaimer', style: TextStyle(fontSize: 20)),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
              ),
              Divider(
                color: Colors.black,
              ),
              ListTile(
                leading: Icon(Icons.policy, size: 30),
                title: Text(
                  'Privacy Policy',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
              ),
              Divider(
                color: Colors.black,
              ),
              ListTile(
                leading: Icon(Icons.share, size: 30),
                title: Text(
                  'Share App',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
              ),
              Divider(
                color: Colors.black,
              ),
              Container(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Copyright ",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: "© | Jehovah Creations",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
