import 'package:flutter/material.dart';
import 'package:intern_liveasy/logout.dart';

class SelectProfile extends StatefulWidget {
  const SelectProfile({Key? key}) : super(key: key);

  @override
  _SelectProfileState createState() => _SelectProfileState();
}

class _SelectProfileState extends State<SelectProfile> {
  bool _value = false;
  Object? val = -1;
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
              padding: EdgeInsets.fromLTRB(20, 40, 20, 15),
              child: Text(
                "Please select your profile",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Container(
                  width: double.infinity,
                  // height: 100,
                  // height: double.infinity,
                  padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black54)),
                  child: Row(
                    children: [
                      Radio(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: 1,
                        groupValue: val,
                        onChanged: (value) {
                          setState(() {
                            val = value;
                          });
                        },
                        activeColor: Colors.deepPurple,
                      ),
                      Icon(
                        Icons.home_outlined,
                        size: 60,
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            // padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            padding: EdgeInsets.all(5),
                            child: Text(
                              "Shipper",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ),
                          Padding(
                            // padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            padding: EdgeInsets.all(5),
                            child: Text(
                              "lorem ipsum lorem  ipsum lorem ipsum  lorem ipsum",
                              textAlign: TextAlign.left,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13),
                            ),
                          ),
                        ],
                      ))
                    ],
                  )),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Container(
                  width: double.infinity,
                  // height: 100,
                  padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black54)),
                  child: Row(
                    children: [
                      Radio(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: 2,
                        groupValue: val,
                        onChanged: (value) {
                          setState(() {
                            val = value;
                          });
                        },
                        activeColor: Colors.deepPurple,
                      ),
                      Icon(
                        Icons.car_rental,
                        size: 60,
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            // padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            padding: EdgeInsets.all(5),
                            child: Text(
                              "Transporter",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ),
                          Padding(
                            // padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            padding: EdgeInsets.all(5),
                            child: Text(
                              "lorem ipsum lorem  ipsum lorem ipsum  lorem ipsum",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13),
                            ),
                          ),
                        ],
                      ))
                    ],
                  )),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  LogoutScreen()));
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
