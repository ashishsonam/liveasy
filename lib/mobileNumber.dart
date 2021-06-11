import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intern_liveasy/verifyPhone.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class MobileNumber extends StatefulWidget {
  const MobileNumber({Key? key}) : super(key: key);

  @override
  _MobileNumberState createState() => _MobileNumberState();
}

class _MobileNumberState extends State<MobileNumber> {
  String? phone = "";
  String? countryCode = "";
  final TextEditingController controller = TextEditingController();
  String initialCountry = 'IN';
  PhoneNumber number = PhoneNumber(isoCode: 'IN');

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
                "Please enter your mobile number",
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
                "You'll receive a 6 digit code to verify next.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Container(
                width: double.infinity,
                // height: 45,
                padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black54)),
                child: InternationalPhoneNumberInput(
                  onInputChanged: (PhoneNumber number) {
                    print(number.phoneNumber);
                    phone = number.parseNumber();
                    print(phone);
                    countryCode = number.dialCode;
                    print(countryCode);
                  },
                  onInputValidated: (bool value) {
                    print(value);
                  },
                  selectorConfig: SelectorConfig(
                    selectorType: PhoneInputSelectorType.DIALOG,
                  ),
                  ignoreBlank: false,
                  textAlignVertical: TextAlignVertical.center,
                  inputDecoration: InputDecoration(
                    hintText: "Mobile Number",
                    hintStyle: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w600),
                    border: InputBorder.none,
                  ),
                  autoValidateMode: AutovalidateMode.disabled,
                  selectorTextStyle: TextStyle(color: Colors.black),
                  initialValue: number,
                  textFieldController: controller,
                  formatInput: false,
                  keyboardType: TextInputType.numberWithOptions(
                      signed: true, decimal: true),
                  inputBorder: OutlineInputBorder(),
                  onSaved: (PhoneNumber number) {
                    print('On Saved: $number');
                  },
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  VerifyPhone(phone, countryCode)));
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
}
