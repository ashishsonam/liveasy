import 'package:flutter/material.dart';
import 'package:intern_liveasy/mobileNumber.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({Key? key}) : super(key: key);

  @override
  _SelectLanguageState createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  String? _chosenValue = "English";
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.photo,
                  size: 100,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 5),
                  child: Text(
                    "Please select your Language",
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
                    "You can change the language at any time",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(60, 20, 60, 10),
                  child: Container(
                    width: 200,
                    height: 45,
                    padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black54)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: _chosenValue,
                        style: TextStyle(color: Colors.black54, fontSize: 15),
                        items: <String>['English', 'Hindi']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            _chosenValue = value;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      MobileNumber()));
                        },
                        child: Container(
                            width: 200,
                            // height: 45,
                            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(3, 29, 93, 1),
                            ),
                            child: Center(
                              child: Text(
                                "NEXT",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            )))),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: CustomPaint(
            size: Size(
                size.width,
                (size.width * 0.3333333333333333)
                    .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            painter: RPSCustomPainter(),
          ),
        ),
        Positioned(
          bottom: 0,
          child: CustomPaint(
            size: Size(
                size.width,
                (size.width * 0.3333333333333333)
                    .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            painter: RPSCustomPainter2(),
          ),
        )
      ],
    )
        // body:
        );
  }
}

class RPSCustomPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Color.fromARGB(177, 106, 107, 210)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.5480000);
    path_0.quadraticBezierTo(size.width * 0.0773889, size.height * 0.2846667,
        size.width * 0.1464444, size.height * 0.2386667);
    path_0.cubicTo(
        size.width * 0.2417222,
        size.height * 0.1681667,
        size.width * 0.3105000,
        size.height * 0.7498333,
        size.width * 0.4244444,
        size.height * 0.7193333);
    path_0.cubicTo(
        size.width * 0.4871667,
        size.height * 0.7425000,
        size.width * 0.6446111,
        size.height * 0.1008333,
        size.width * 0.7571111,
        size.height * 0.1213333);
    path_0.quadraticBezierTo(size.width * 0.8396111, size.height * 0.1161667,
        size.width, size.height * 0.4420000);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(0, size.height);
    path_0.lineTo(0, size.height * 0.5480000);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Color.fromARGB(255, 116, 193, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.5480000);
    path_0.quadraticBezierTo(size.width * 0.1076111, size.height * 0.7726667,
        size.width * 0.1766667, size.height * 0.7266667);
    path_0.cubicTo(
        size.width * 0.2719444,
        size.height * 0.6561667,
        size.width * 0.3469444,
        size.height * 0.1871667,
        size.width * 0.4511111,
        size.height * 0.2100000);
    path_0.cubicTo(
        size.width * 0.4916111,
        size.height * 0.1665000,
        size.width * 0.6748333,
        size.height * 0.7701667,
        size.width * 0.7588889,
        size.height * 0.6866667);
    path_0.quadraticBezierTo(size.width * 0.7720556, size.height * 0.7428333,
        size.width, size.height * 0.4420000);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(0, size.height);
    path_0.lineTo(0, size.height * 0.5480000);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
