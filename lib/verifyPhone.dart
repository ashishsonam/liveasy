import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intern_liveasy/selectProfile.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:toast/toast.dart';

class VerifyPhone extends StatefulWidget {
  final String? phone;
  final String? countryCode;
  VerifyPhone(this.phone, this.countryCode);

  @override
  _VerifyPhoneState createState() => _VerifyPhoneState();
}

class _VerifyPhoneState extends State<VerifyPhone> {
  String otp = "";
  late String _verificationCode;

  void initState() {
    super.initState();
    _verifyPhone();
    _listenOtp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Center(
            child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 40, 20, 5),
              child: Text(
                "Verify Phone",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(80, 5, 80, 10),
              child: Text(
                "Code sent to ${widget.countryCode} ${widget.phone}",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: PinFieldAutoFill(
                decoration: UnderlineDecoration(
                  bgColorBuilder:
                      FixedColorBuilder(Color.fromRGBO(105, 189, 237, 1)),
                  colorBuilder:
                      FixedColorBuilder(Color.fromRGBO(105, 189, 237, 1)),
                ),
                onCodeChanged: (val) {
                  otp = (val == null ? "" : val);
                  print(val);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't receive the code? ",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  InkWell(
                    onTap: () {
                      _resendCode();
                      print('requested again');
                    },
                    child: Text(
                      "Request Again",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  )
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: InkWell(
                    onTap: () async {
                      try {
                        await FirebaseAuth.instance
                            .signInWithCredential(PhoneAuthProvider.credential(
                                verificationId: _verificationCode,
                                smsCode: otp))
                            .then((value) async {
                          if (value.user != null) {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SelectProfile()),
                                (route) => false);
                          }
                        });
                      } catch (e) {
                        print(e);
                      }

                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (BuildContext context) =>
                      //             SelectProfile()));
                    },
                    child: Container(
                        width: double.infinity,
                        // height: 45,
                        padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(3, 29, 93, 1),
                        ),
                        child: Center(
                          child: Text(
                            "CONTINUE",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        )))),
          ],
        )));
  }

  _listenOtp() async {
    await SmsAutoFill().listenForCode;
  }

  _resendCode() {
    _verifyPhone();
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '${widget.countryCode} ${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              print('user logged in');
              Toast.show("Verifying and signing in...", context,
                  duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => SelectProfile()),
                  (route) => false);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e);
        },
        codeSent: (String verificationId, int? resendToken) {
          setState(() {
            _verificationCode = verificationId;
          });

          print('code sent');
          print(_verificationCode);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          setState(() {
            _verificationCode = verificationId;
          });
        },
        timeout: Duration(milliseconds: 10000));
  }
}
