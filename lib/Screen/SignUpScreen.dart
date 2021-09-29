import 'dart:async';

import 'package:combo_expert/Screen/RegisterScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HomeScreen.dart';
import 'constants.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  int start = 30;
  bool wait = false;
  String buttonName = "Send OTP";
  TextEditingController _phoneNumberController = TextEditingController();
  var _otpController = '';
  bool _codeesent = true;
  // var _status = '';
  FirebaseUser? _firebaseUser;
  String? _status;
  bool? _usercheck;
  AuthCredential? _phoneAuthCredential;
  String? _verificationId;
  int? _code;

  void _checknumber() async {
    final perfs = await SharedPreferences.getInstance();
    await db.open();
    var coll = db.collection('users');
    var res = await coll.findOne({"phone": _phoneNumberController.text});

    if (res == null) {
      print('success');
      perfs.setString('phone', _phoneNumberController.text);
      setState(() {
        _usercheck = true;
      });
      _submitPhoneNumber();
    } else {
      setState(() {
        _usercheck = false;
        perfs.setString('name', res['name']);
        _submitPhoneNumber();
      });
    }
  }

  _register() async {
    final perfs = await SharedPreferences.getInstance();
    perfs.setString('phone', _phoneNumberController.text);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => RegisterScreen()));
  }

  @override
  void initState() {
    super.initState();
    // _getFirebaseUser();
    _logout();
  }

  void _handleError(e) {
    print(e.message);
    setState(() {
      _status = e.message + '\n';
    });
  }

  Future<void> _getFirebaseUser() async {
    this._firebaseUser = await FirebaseAuth.instance.currentUser();
    setState(() {
      _status =
          (_firebaseUser == null) ? 'Not Logged In\n' : 'Already LoggedIn\n';
    });
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  /// phoneAuthentication works this way:
  ///     AuthCredential is the only thing that is used to authenticate the user
  ///     OTP is only used to get AuthCrendential after which we need to authenticate with that AuthCredential
  ///
  /// 1. User gives the phoneNumber
  /// 2. Firebase sends OTP if no errors occur
  /// 3. If the phoneNumber is not in the device running the app
  ///       We have to first ask the OTP and get `AuthCredential`(`_phoneAuthCredential`)
  ///       Next we can use that `AuthCredential` to signIn
  ///    Else if user provided SIM phoneNumber is in the device running the app,
  ///       We can signIn without the OTP.
  ///       because the `verificationCompleted` callback gives the `AuthCredential`(`_phoneAuthCredential`) needed to signIn
  Future<void> _login() async {
    /// This method is used to login the user
    /// `AuthCredential`(`_phoneAuthCredential`) is needed for the signIn method
    /// After the signIn method from `AuthResult` we can get `FirebaserUser`(`_firebaseUser`)
    try {
      final prefs = await SharedPreferences.getInstance();
      await FirebaseAuth.instance
          .signInWithCredential(this._phoneAuthCredential)
          .then((AuthResult authRes) {
        _firebaseUser = authRes.user;
        print(_firebaseUser.toString());
        if (_usercheck == true) {
          _register();
          setState(() {
            _status = 'Signed In\n';
          });
        } else {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomeScreen()));
        }
      }).catchError((e) => _handleError(e));
    } catch (e) {
      setState(() {
        _status = 'Wrong OTP Entered';
      });
    }
  }

  Future<void> _logout() async {
    /// Method to Logout the `FirebaseUser` (`_firebaseUser`)
    try {
      // signout code
      await FirebaseAuth.instance.signOut();
      _firebaseUser = null;
      setState(() {
        _status = 'Signed out\n';
      });
    } catch (e) {
      _handleError(e);
    }
  }

  Future<void> _submitPhoneNumber() async {
    /// NOTE: Either append your phone number country code or add in the code itself
    /// Since I'm in India we use "+91 " as prefix `phoneNumber`
    String phoneNumber = "+91" + _phoneNumberController.text.toString().trim();
    print(phoneNumber);

    /// The below functions are the callbacks, separated so as to make code more redable
    void verificationCompleted(AuthCredential phoneAuthCredential) {
      print('verificationCompleted');
      setState(() {
        _status = 'verificationCompleted\n';
      });
      this._phoneAuthCredential = phoneAuthCredential;
      print(phoneAuthCredential);
    }

    void verificationFailed(AuthException error) {
      print('verificationFailed');
      _handleError(error);
    }

    void codeSent(String verificationId, [int? code]) {
      print('codeSent');
      this._verificationId = verificationId;
      print(verificationId);
      this._code = code;
      print(code.toString());
      setState(() {
        _status = 'Code Sent\n';
        _codeesent = false;
      });
    }

    void codeAutoRetrievalTimeout(String verificationId) {
      print('codeAutoRetrievalTimeout');
      setState(() {
        _status = 'codeAutoRetrievalTimeout\n';
      });
      print("verify ${verificationId}");
    }

    await FirebaseAuth.instance.verifyPhoneNumber(
      /// Make sure to prefix with your country code
      phoneNumber: phoneNumber,

      /// `seconds` didn't work. The underlying implementation code only reads in `millisenconds`
      timeout: Duration(milliseconds: 10000),

      /// If the SIM (with phoneNumber) is in the current device this function is called.
      /// This function gives `AuthCredential`. Moreover `login` function can be called from this callback
      /// When this function is called there is no need to enter the OTP, you can click on Login button to sigin directly as the device is now verified
      verificationCompleted: verificationCompleted,

      /// Called when the verification is failed
      verificationFailed: verificationFailed,

      /// This is called after the OTP is sent. Gives a `verificationId` and `code`
      codeSent: codeSent,

      /// After automatic code retrival `tmeout` this function is called
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    ); // All the callbacks are above
  }

  void _submitOTP() {
    /// get the `smsCode` from the user
    String smsCode = _otpController.toString().trim();

    /// when used different phoneNumber other than the current (running) device
    /// we need to use OTP to get `phoneAuthCredential` which is inturn used to signIn/login
    this._phoneAuthCredential = PhoneAuthProvider.getCredential(
        verificationId: this._verificationId, smsCode: smsCode);

    _login();
  }

  void _reset() {
    _phoneNumberController.clear();
    //_otpController.clear();
    setState(() {
      _status = "";
    });
  }

  void _displayUser() {
    setState(() {
      _status = _firebaseUser.toString() + '\n';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Register'),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.teal,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(height: 24),
                    Image.asset(
                      'images/CELogo.jpeg',
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    _codeesent == true
                        ? Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(color: Colors.white),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: _phoneNumberController,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 19),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 19),
                                  child: Text(
                                    '(+91)',
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.black),
                                  ),
                                ),
                                hintText: 'Phone number',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                hintStyle:
                                    TextStyle(fontSize: 17, color: Colors.grey),
                              ),
                            ),

                            // TextField(

                            //   decoration: InputDecoration(
                            //     hintText: 'Phone Number',
                            //     hintStyle: TextStyle(fontSize: 17),
                            //     border: OutlineInputBorder(),
                            //   ),
                            // ),
                          )
                        : Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 12),
                                    height: 1,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Enter 6-Digit OTP',
                                  style: TextStyle(fontSize: 17),
                                ),
                                Expanded(
                                  child: Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 12),
                                    height: 1,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            )),
                    SizedBox(height: 50),
                    _codeesent == false ? otpField() : Text(''),
                    _codeesent == true
                        ? InkWell(
                            onTap: wait
                                ? null
                                : () async {
                                    _checknumber();
                                    //print('object');
                                    startTimer();
                                    setState(() {
                                      start = 30;
                                      wait = true;
                                      buttonName = "Resend OTP";
                                    });
                                  },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: wait ? Colors.grey : Colors.white,
                              ),
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                  child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 8,
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            buttonName,
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.teal,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.teal,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                            ),
                          )
                        : Text(''),
                    SizedBox(height: 48),
                    _codeesent == false
                        ? Container(
                            alignment: Alignment.center,
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Send OTP again in',
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.black),
                                  ),
                                  WidgetSpan(
                                      child: SizedBox(
                                    width: 5,
                                  )),
                                  TextSpan(
                                    text: '00:$start',
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.red),
                                  ),
                                  WidgetSpan(
                                      child: SizedBox(
                                    width: 5,
                                  )),
                                  TextSpan(
                                    text: 'sec',
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Text(''),
                    SizedBox(height: 20),
                    _codeesent == false
                        ? InkWell(
                            onTap: _submitOTP,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                  child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  'Submit',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )),
                              color: Colors.white,
                            ),
                          )
                        : Text(''),
                    Center(
                        child: Text(
                      _status!,
                      style: TextStyle(color: Colors.white),
                    ))
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  void startTimer() {
    const onsec = Duration(seconds: 1);
    Timer timer = Timer.periodic(onsec, (timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
          wait = false;
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  Widget otpField() {
    return OTPTextField(
      length: 6,
      width: MediaQuery.of(context).size.width,
      fieldWidth: 50,
      otpFieldStyle: OtpFieldStyle(
        backgroundColor: Color(0xE5E0E0E0),
        borderColor: Colors.black,
      ),
      style: TextStyle(fontSize: 17, color: Colors.black),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldStyle: FieldStyle.underline,
      onCompleted: (pin) {
        setState(() {
          _otpController = pin;
        });
      },
    );
  }
}
