import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:balance/Pages/Homepage.dart';
import 'login_page.dart';
class AnimatedSplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<AnimatedSplashScreen>
    with SingleTickerProviderStateMixin {
  var _visible = true;
  static int abc=0;
 late AnimationController animationController;
  Animation<double>? animation;
  // SharedPreferences? prefs;

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }
  String?  expirydate;
  int btncheck = 0;
  String? formattedDate;
  String? formattedDateexp;




  date() {
    var now = new DateTime.now();
    // var formatter = new DateFormat('yyyy/MM/dd');
    var formatter = new DateFormat('dd/MM/yyyy');
    formattedDate = formatter.format(now);
    print(formattedDate); // 2016-01-25
    var expiry_date = now.add(Duration(days: 7, hours: 00));
    formattedDateexp = formatter.format(expiry_date);
    print(formattedDateexp);
  }
  check() {
    var exp = (expirydate!.split('/'));
    var cdate = (formattedDate!.split('/'));
//   day / month / year
    print("Expiry date: "+exp[0] + " " + exp[1] + " " + exp[2]);
    print("Date now: "+cdate[0] + " " + cdate[1] + " " + cdate[2]);

    if (int.parse(exp[2]) == int.parse(cdate[2])) {
      print("true");
      if (int.parse(exp[1]) == int.parse(cdate[1])) {
        print("true");

        if (int.parse(exp[0]) > int.parse(cdate[0])) {
          print(exp[2] + ">" + cdate[2]);
          print("check is " + btncheck.toString());

          setState(() {
            btncheck = 1;
          });
        }
      } else if (int.parse(exp[1]) > int.parse(cdate[1])) {
        setState(() {
          btncheck = 1;
        });
      }
    }
    print("check is " + btncheck.toString());
  }

  void navigationPage() async {

    User? _auth1=  FirebaseAuth.instance.currentUser;
    if (_auth1 != null) {
      print('email: ' + _auth1.email);
      print('email: ' + _auth1.uid);
      date();
      await   FirebaseFirestore.instance.collection("users").doc(_auth1.uid)
            .get()
            .then((DocumentSnapshot result) {
          // print(result["F_date"]);
          if (result.exists) {
            setState(() {
              expirydate = result["E_date"];
              print(result["E_date"]);
            });
             check();
             check();
            if (btncheck == 0) {
              Navigator.pushReplacementNamed(context, "/subs");
              // date is less than current date
            } else {
              // date is greater than current date
              print("date is greater");
              print("Provider Logined");
              Navigator.pushReplacementNamed(context, "/Home");
            }
          }

      });

    } else {
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();

    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 2));
    animation =
    new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation!.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  List<double> _stops = [0.0, 0.7];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
     width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
               margin: EdgeInsets.symmetric(vertical: 50,horizontal: 50),
                  child: Image.asset("assets/images/logo.png")),
              SizedBox(height: 200,),
              CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF45C541)))
            ],
          ),
      ),
    )
    );
  }

}



// animation!.value * 50,
