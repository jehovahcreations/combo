import 'package:combo_expert/Screen/HomeScreen.dart';
import 'package:combo_expert/Screen/SignUpScreen.dart';
import 'package:combo_expert/Screen/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';

//import '/home.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _name = TextEditingController();
  TextEditingController _advisor = TextEditingController();
  TextEditingController _phone1 = TextEditingController();
  TextEditingController _phone2 = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _agent = TextEditingController();
  TextEditingController _licBranch = TextEditingController();
  TextEditingController _city = TextEditingController();
  TextEditingController _officer = TextEditingController();
  var _status = null;

  _register() async {
    final prefs = await SharedPreferences.getInstance();
    if (_name.text == null ||
        _advisor.text == null ||
        _phone1.text == null ||
        _phone2.text == null ||
        _email.text == null ||
        _agent.text == null ||
        _licBranch.text == null ||
        _city.text == null ||
        _officer.text == null) {
      setState(() {
        _status = '* Please fill all fields';
      });
    } else {
      await db.open();
      var coll = db.collection('users');
      var res = coll.insert({
        "name": _name.text,
        "advisor": _advisor.text,
        "phone": prefs.getString('phone'),
        "phone1": _phone1.text,
        "phone2": _phone2.text,
        "email": _email.text,
        "agencey": _agent.text,
        "licBranch": _licBranch.text,
        "city": _city.text,
        "licOffice": value1,
        "officer": _officer.text,
        "profile": value2,
        "bm": firstvalue,
        "dm": firstvalue1,
        "cm": firstvalue2,
        "zm": firstvalue3,
        "mdrt": firstvalue4,
        "cot": firstvalue5,
        "tot": firstvalue6,
        "galaxy": firstvalue7,
        "corporate": firstvalue8,
        "other": firstvalue9,
        "isActive": 1,
        "expiry": DateTime.now(),
        "date": DateTime.now()
      });
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => SignUpScreen()));
    }
  }

  bool firstvalue = false;
  bool firstvalue1 = false;
  bool firstvalue2 = false;
  bool firstvalue3 = false;
  bool firstvalue4 = false;
  bool firstvalue5 = false;
  bool firstvalue6 = false;
  bool firstvalue7 = false;
  bool firstvalue8 = false;
  bool firstvalue9 = false;
  final items = [
    'Select Profile *',
    'Agent',
    'Development Officer',
    'SBA',
    'CLIA',
    'Other'
  ];
  String? value2 = 'Select Profile *';

  final items1 = [
    'Select LIC Division *',
    'AGRA',
    'AHEMDABAD',
    'AJMER',
    'ALIGARH',
    'ALLAHABAD',
    'AMRAVATI',
    'AMRITSAR',
    'ASANSOL',
    'AURANGABAD',
    'BANGALURU - 1',
    'BANGALURU - 2',
    'BARDHAMAN',
    'BAREILLY',
    'BEGUSAAI',
    'BEHRAMPUR',
    'BELGAUM',
    'BHAGALPUR',
    'BHAVNAGAR',
    'BHOPAL',
    'BHUBANESHWAR',
    'BIKANER',
    'BILASPUR',
    'BONGIGAON',
    'CHANDIGARH',
    'CHENNAI - 1',
    'CHENNAI - 2',
    'COIMBATORE',
    'CUTTACK',
    'DEHRADUN',
    'DELHI - 1',
    'DELHI - 2',
    'DELHI - 3',
    'DHARWAD',
    'ERNAKULAM',
    'FAIZABAD',
    'GANDHINAGAR',
    'GOA',
    'GORAKHPUR',
    'GUWAHATI',
    'GWALIOR',
    'HALDIWANI',
    'HAZARIBAUG',
    'HOWRAH',
    'HYDERABAD',
    'INDORE',
    'JABALPUR',
    'JAIPUR - 1',
    'JAIPUR - 2',
    'JALANDHAR',
    'JAMSHEDPUR',
    'JODHPUR',
    'JORHAT',
    'KADAPA',
    'KAIRIMNAGAR',
    'KANPUR',
    'KARNAL',
    'KHARAGPUR',
    'KMDO - 1',
    'KMDO - 2',
    'KOLHAPUR',
    'KOTTAYAM',
    'KOZIKODE',
    'KSDO',
    'LUCKNOW',
    'LUDHIYANA',
    'MACHALLIPATANAM',
    'MADHURAI',
    'MEERUT',
    'MUMBAI - 1',
    'MUMBAI - 2',
    'MUMBAI - 3',
    'MUMBAI - 4',
    'MUMBAI SSS',
    'MUZAFFARPUR',
    'MYSORE',
    'NADIAD',
    'NAGPUR',
    'NANDED',
    'NASHIK',
    'NELLORE',
    'PATNA - 1',
    'PATNA - 2',
    'PUNE - 1',
    'PUNE - 2',
    'RAICHUR',
    'RAIPUR',
    'RAJAHMUNDRY',
    'RAJKOT',
    'ROHTAK',
    'SALEM',
    'SAMBALPUR',
    'SATARA',
    'SATNA',
    'SECUNDERABAD',
    'SHAHDDOL',
    'SHIMLA',
    'SHIMOGA',
    'SILCHAR',
    'SRINAGAR',
    'SURAT',
    'THANE',
    'THANJAVUR',
    'THHIRUANANTAPURAM',
    'THRISSUR',
    'TIRUNELVELI',
    'UDAIPUR',
    'UDIPI',
    'VADODARA',
    'VARANASI',
    'VELLORE',
    'VISHAKHAPATTANAM',
    'WARANGAL'
  ];
  String? value1 = 'Select LIC Division *';
  //TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DropdownMenuItem<String> buildMenuItem1(String item) => DropdownMenuItem(
          value: item,
          child: Text(
            item,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        );

    DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
          value: item,
          child: Text(
            item,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        );

    Widget buildCheckbox() => Checkbox(
        value: firstvalue,
        onChanged: (value) {
          setState(() {
            firstvalue = value!;
          });
        });

    Widget buildCheckbox1() => Checkbox(
        value: firstvalue1,
        onChanged: (value) {
          setState(() {
            firstvalue1 = value!;
          });
        });
    Widget buildCheckbox2() => Checkbox(
        value: firstvalue2,
        onChanged: (value) {
          setState(() {
            firstvalue2 = value!;
          });
        });
    Widget buildCheckbox3() => Checkbox(
        value: firstvalue3,
        onChanged: (value) {
          setState(() {
            firstvalue3 = value!;
          });
        });
    Widget buildCheckbox4() => Checkbox(
        value: firstvalue4,
        onChanged: (value) {
          setState(() {
            firstvalue4 = value!;
          });
        });
    Widget buildCheckbox5() => Checkbox(
        value: firstvalue5,
        onChanged: (value) {
          setState(() {
            firstvalue5 = value!;
          });
        });
    Widget buildCheckbox6() => Checkbox(
        value: firstvalue6,
        onChanged: (value) {
          setState(() {
            firstvalue6 = value!;
          });
        });
    Widget buildCheckbox7() => Checkbox(
        value: firstvalue7,
        onChanged: (value) {
          setState(() {
            firstvalue7 = value!;
          });
        });
    Widget buildCheckbox8() => Checkbox(
        value: firstvalue8,
        onChanged: (value) {
          setState(() {
            firstvalue8 = value!;
          });
        });
    Widget buildCheckbox9() => Checkbox(
        value: firstvalue9,
        onChanged: (value) {
          setState(() {
            firstvalue9 = value!;
          });
        });
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Registration'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Form(
          child: Container(
            // color: Colors.teal,
            decoration: BoxDecoration(
              color: Colors.teal,
            ),
            child: SingleChildScrollView(
              child: Container(
                // margin: EdgeInsets.symmetric(horizontal: 20,vertical: 50),
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.teal),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 130,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/CELogo.jpeg"),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(_status,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _name,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: "Full Name *",
                            hintText: "Full Name *",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _advisor,

                          // initialValue: "Insurance Advisor",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[400],
                            labelText: "Insurance Advisor *",
                            hintText: "Insurance Advisor *",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _phone1,
                          maxLength: 10,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Mobile Number1*",
                            labelText: "Mobile Number1*",
                            hintStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _phone2,
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Mobile Number 2",
                            labelText: "Mobile Number 2",
                            hintStyle:
                                TextStyle(color: Colors.black, fontSize: 18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _email,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Email *",
                            labelText: "Email *",
                            hintStyle:
                                TextStyle(color: Colors.black, fontSize: 18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _agent,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Agency Code/Do Code *",
                            labelText: "Agency Code/Do Code *",
                            hintStyle:
                                TextStyle(color: Colors.black, fontSize: 18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _licBranch,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "LIC Branch *",
                            labelText: "LIC Branch *",
                            hintStyle:
                                TextStyle(color: Colors.black, fontSize: 18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _city,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "City *",
                            labelText: "City *",
                            hintStyle:
                                TextStyle(color: Colors.black, fontSize: 18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              width: 1,
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: value1,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal),
                              iconSize: 36,
                              icon: Icon(Icons.arrow_drop_down),
                              isExpanded: true,
                              items: items1.map(buildMenuItem1).toList(),
                              onChanged: (value1) =>
                                  setState(() => this.value1 = value1),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _officer,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Development Officer Name *",
                            labelText: "Development Officer Name *",
                            hintStyle:
                                TextStyle(color: Colors.black, fontSize: 18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: value2,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                              iconSize: 36,
                              icon: Icon(Icons.arrow_drop_down),
                              isExpanded: true,
                              items: items.map(buildMenuItem).toList(),
                              onChanged: (value) =>
                                  setState(() => this.value2 = value),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          child: Row(
                                            children: [
                                              buildCheckbox(),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              Text("BM"),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            buildCheckbox1(),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            Text("DM"),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            buildCheckbox2(),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            Text("CM"),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            buildCheckbox3(),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            Text("ZM"),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            buildCheckbox4(),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            Text("MDRT"),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            buildCheckbox5(),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            Text("COT"),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            buildCheckbox6(),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            Text("TOT"),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Row(
                                          children: [
                                            buildCheckbox7(),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            Text("Galaxy"),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Row(
                                          children: [
                                            buildCheckbox8(),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            Text("Corporate"),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Row(
                                          children: [
                                            buildCheckbox9(),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            Text("Other"),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: InkWell(
                            child: Container(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Text(
                                          "REGISTER",
                                          style: TextStyle(
                                              color: Colors.teal,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Icon(
                                        Icons.skip_next,
                                        color: Colors.teal,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            onTap: () async {
                              _register();

                              //  _submitPhoneNumber;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
                // height: double.infinity,
                width: double.infinity,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
