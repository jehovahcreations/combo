import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BachatPlusScreen extends StatefulWidget {
  const BachatPlusScreen({Key? key}) : super(key: key);

  @override
  _BachatPlusScreenState createState() => _BachatPlusScreenState();
}

class _BachatPlusScreenState extends State<BachatPlusScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 40,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.orange,
          title: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "images/CELogo.jpeg",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 40,
                width: 40,
              ),
              SizedBox(
                width: 20,
              ),
              Text("Bachat Plus (861)"),
            ],
          ),
          elevation: 20,
          titleSpacing: 20,
          bottom: TabBar(
            indicatorColor: Colors.red,
            indicatorWeight: 5,
            tabs: [
              Tab(
                icon: Icon(CupertinoIcons.photo),
                text: 'IMAGE',
              ),
              Tab(
                icon: Icon(Icons.sms),
                text: 'SMS',
              ),
              Tab(
                icon: Icon(Icons.picture_as_pdf),
                text: 'PDF',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildImage(context),
            buildSMS(context),
            buildPDF(context),
          ],
        ),
      ),
    );
  }
}

Widget buildImage(BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 350,
              child: Table(
                border: TableBorder.all(color: Colors.orangeAccent),
                children: [
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Center(
                          child: Text(
                        'LIC - Bachat Plus',
                        style: TextStyle(color: Colors.black),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Center(
                          child: Text(
                        '(Table No - 861)',
                        style: TextStyle(color: Colors.black),
                      )),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Center(
                          child: Text(
                        'Minimum Age at Entry',
                        style: TextStyle(color: Colors.redAccent),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Center(
                          child: Text(
                        '2',
                        style: TextStyle(color: Colors.black),
                      )),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Center(
                          child: Text(
                        'Maximum Age at Entry',
                        style: TextStyle(color: Colors.redAccent),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Center(
                          child: Text(
                        '2',
                        style: TextStyle(color: Colors.black),
                      )),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Center(
                          child: Text(
                        'Maximum Sum Assured',
                        style: TextStyle(color: Colors.redAccent),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Center(
                          child: Text(
                        '2',
                        style: TextStyle(color: Colors.black),
                      )),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Center(
                          child: Text(
                        'Policy Term',
                        style: TextStyle(color: Colors.redAccent),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Center(
                          child: Text(
                        '2',
                        style: TextStyle(color: Colors.black),
                      )),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Center(
                          child: Text(
                        'Minimum Sum Assured',
                        style: TextStyle(color: Colors.redAccent),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Center(
                          child: Text(
                        '2',
                        style: TextStyle(color: Colors.black),
                      )),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Center(
                          child: Text(
                        'Maximum Sum Assured',
                        style: TextStyle(color: Colors.redAccent),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Center(
                          child: Text(
                        '2',
                        style: TextStyle(color: Colors.black),
                      )),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Center(
                          child: Text(
                        'Premium Mode',
                        style: TextStyle(color: Colors.redAccent),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Center(
                          child: Text(
                        '2',
                        style: TextStyle(color: Colors.black),
                      )),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Center(
                          child: Text(
                        'Riders Available',
                        style: TextStyle(color: Colors.redAccent),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Center(
                          child: Text(
                        '2',
                        style: TextStyle(color: Colors.black),
                      )),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Center(
                          child: Text(
                        'Surrender Value',
                        style: TextStyle(color: Colors.redAccent),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Center(
                          child: Text(
                        '2',
                        style: TextStyle(color: Colors.black),
                      )),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Center(
                          child: Text(
                        'Loan Available',
                        style: TextStyle(color: Colors.redAccent),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Center(
                          child: Text(
                        '2',
                        style: TextStyle(color: Colors.black),
                      )),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Center(
                          child: Text(
                        'Other Benefit',
                        style: TextStyle(color: Colors.redAccent),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Center(
                          child: Text(
                        '2',
                        style: TextStyle(color: Colors.black),
                      )),
                    ),
                  ]),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0, bottom: 15.0),
              child: Container(
                color: Colors.grey[350],
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    'For More Information Call',
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    image: DecorationImage(
                      image: AssetImage(
                        "images/CELogo.jpeg",
                      ),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(2.0),
                    color: Colors.red,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Roshan',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Text(
                        'Insurance Advisor',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: "7028362775",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                          WidgetSpan(
                              child: SizedBox(
                            width: 5,
                          )),
                          TextSpan(
                            text: "/",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                          WidgetSpan(
                              child: SizedBox(
                            width: 5,
                          )),
                          TextSpan(
                            text: "9356655192",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                        ]),
                      ),
                      Text(
                        'rshngpt256@gmail.com',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.orange,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.share,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Share",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget buildSMS(BuildContext context) => SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "LIC Bachat Plus (861) Plan Feature -",
              style: TextStyle(fontSize: 22, color: Colors.orange),
            ),
            Text(
              "Policy Term -",
              style: TextStyle(fontSize: 22, color: Colors.orange),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Minimum Age at Entry -",
              style: TextStyle(fontSize: 22, color: Colors.orange),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Maximum Age at Entry -",
              style: TextStyle(fontSize: 22, color: Colors.orange),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Maximum Maturity Age -",
              style: TextStyle(fontSize: 22, color: Colors.orange),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Minimum Sum Assured -",
              style: TextStyle(fontSize: 22, color: Colors.orange),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Maximum Sum Assured -",
              style: TextStyle(fontSize: 22, color: Colors.orange),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Riders Available -",
              style: TextStyle(fontSize: 22, color: Colors.orange),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Accidental Daeth and Dsability Benefit(ADDB) -",
              style: TextStyle(fontSize: 22, color: Colors.orange),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Death Benefit -",
              style: TextStyle(fontSize: 22, color: Colors.orange),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Maturity Benefit -",
              style: TextStyle(fontSize: 22, color: Colors.orange),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Surrender Value -",
              style: TextStyle(fontSize: 22, color: Colors.orange),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Loan Benefit -",
              style: TextStyle(fontSize: 22, color: Colors.orange),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Proposal Form Used -",
              style: TextStyle(fontSize: 22, color: Colors.orange),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.orange,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.share,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Share",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget buildPDF(BuildContext context) => SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              height: 350,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red, width: 4),
                image: DecorationImage(
                  image: AssetImage(
                    "images/CELogo.jpeg",
                  ),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.red,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4),
                          bottomLeft: Radius.circular(4),
                        ),
                        color: Colors.redAccent,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.remove_red_eye,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "PDF",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(4),
                          bottomRight: Radius.circular(4),
                        ),
                        color: Colors.orange,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.share,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Share",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
