import 'package:balance/Pages/ForgotPasswordPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:balance/Component/constants.dart';
import 'package:intl/intl.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _Email = new TextEditingController();
  TextEditingController _Password = new TextEditingController();
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
    var expiry_date = now.add(Duration(days: 3, hours: 00));
    formattedDateexp = formatter.format(expiry_date);
    print(formattedDateexp);
  }
  check() {
    var exp = (expirydate!.split('/'));
    var cdate = (formattedDate!.split('/'));
//   day / month / year
    print(exp[0] + " " + exp[1] + " " + exp[2]);
    print(cdate[0] + " " + cdate[1] + " " + cdate[2]);

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Stack(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(top: 20),
                      child:Image.asset("assets/images/login_image.png",fit: BoxFit.fitWidth,)
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 220),
                        height: 80,

                        decoration: BoxDecoration(
                           color: Colors.white,
                           borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))
                         ),
                        ),

                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[

                      SizedBox(height: 0.0),
                      Row(
                        children: [
                          Text("Welcome",style: kLabelStyle.copyWith(fontSize: 20),),
                        ],
                      ),
                      SizedBox(height: 32.0),
                      Progress
                          ? Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                          : _buildEmailTF(),
                      SizedBox(
                        height: 10.0,
                      ),
                      Progress ? Container() : _buildPasswordTF(),
                      SizedBox(
                        height: 50.0,
                      ),
                      Progress ? Container() : _buildLoginBtn(context),
                      SizedBox(
                        height: 30.0,
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgotPassword(),
                              ));
                        },
                        child: Text(
                          'Forgot Password',
                          style: kLabelStyle.copyWith(color: SecondaryColor,fontWeight: FontWeight.w500,fontSize: 12),
                        ),
                      ),
                      // _buildForgotPasswordBtn(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildSignupBtn(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

    );
  }

  Widget _buildSignupBtn(var context) {
    return GestureDetector(
      onTap: () => {Navigator.pushNamed(context, "/signup")},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: Container(
          decoration: Login_Button_BoxDecoration.copyWith(color: PrimaryColor),
          padding: EdgeInsets.symmetric(vertical: 15.0),
          width: double.infinity,
          child: Text(
            'Create Account',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 1.5,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignInWithText() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Expanded(
                flex: 4,
                child: SizedBox(
                  child: Container(
                    color: SecondaryColor,
                    height: 1,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                   'OR',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Text_SecondaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: SizedBox(
                  child: Container(
                    color: SecondaryColor,
                    height: 1,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }

  Widget _buildForgotPasswordBtn() {
    return InkWell(
      onTap: (){

      },
      child: Container(
        alignment: Alignment.center,
        child: FlatButton(
          onPressed: () => () {
            print("Clicked");
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ForgotPassword(),
                ));
          },
          padding: EdgeInsets.only(right: 0.0),
          child: Text(
            'Forgot Password',
            style: kLabelStyle.copyWith(color: SecondaryColor,fontWeight: FontWeight.w500,fontSize: 12),
          ),
        ),
      ),
    );
  }

   FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool Progress = false;

  Widget _buildLoginBtn(var context) {
    return GestureDetector(
      onTap: () {
      date();
      setState(() {
        Progress=true;
      });
      print(_Email.text);
      print(_Password.text);


      _firebaseAuth
          .signInWithEmailAndPassword(
          email: _Email.text,
          password: _Password.text)
          .then((value) {
        FirebaseFirestore.instance.collection("users").doc(value.user!.uid)
            .get()
            .then((DocumentSnapshot result) {
          // print(result["F_date"]);
          if (result.exists) {
            setState(() {
              expirydate = result["E_date"];
            });
            check();
            if (btncheck == 0) {
              setState(() {
                Progress = false;
              });
              // date is less than current date
              Navigator.pushReplacementNamed(context, "/subs");
            } else {
              // date is greater than current date
              print("date is greater");

              setState(() {
                Progress = false;
              });
              print("Provider Logined");
              Navigator.pushReplacementNamed(context, "/Home");
            }
          }
        });
      }).onError((FirebaseAuthException error, stackTrace){
        setState(() {
          Progress = false;
        });
        switch (error.code) {
          case "ERROR_INVALID_EMAIL":
            print("Your email address appears to be malformed.");
            break;
          case "ERROR_WRONG_PASSWORD":
            print("Your password is wrong.");
            break;
          case "ERROR_USER_NOT_FOUND":
            print( "User with this email doesn't exist.");
            break;
          case "ERROR_USER_DISABLED":
            print("User with this email has been disabled.");
            break;
          case "ERROR_TOO_MANY_REQUESTS":
            print("Too many requests. Try again later.");
            break;
          case "ERROR_OPERATION_NOT_ALLOWED":
            print("Signing in with Email and Password is not enabled.");
            break;
          default:
            print("An undefined Error happened.");
        }
      });



      // try {
      //   AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      //   user = result.user;
      // } catch (error) {
      //   switch (error) {
      //     case "ERROR_INVALID_EMAIL":
      //       print("Your email address appears to be malformed.");
      //       break;
      //     case "ERROR_WRONG_PASSWORD":
      //        print("Your password is wrong.");
      //       break;
      //     case "ERROR_USER_NOT_FOUND":
      //       print( "User with this email doesn't exist.");
      //       break;
      //     case "ERROR_USER_DISABLED":
      //         print("User with this email has been disabled.");
      //       break;
      //     case "ERROR_TOO_MANY_REQUESTS":
      //       print("Too many requests. Try again later.");
      //       break;
      //     case "ERROR_OPERATION_NOT_ALLOWED":
      //       print("Signing in with Email and Password is not enabled.");
      //       break;
      //     default:
      //       print("An undefined Error happened.");
      //   }
      // }



      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: Container(
          decoration: Login_Button_BoxDecoration,
          padding: EdgeInsets.symmetric(vertical: 15.0),
          width: double.infinity,
          child: Text(
            'Sign in',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: PrimaryColor,
              letterSpacing: 1.5,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailTF() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10.0),
          TextField(
              controller: _Email,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                color: Text_SecondaryColor,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 2,color: PrimaryColor, ),
                ),
                contentPadding: EdgeInsets.only(top: 14.0),
                hintText: 'Email',
                hintStyle: kHintTextStyle,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPasswordTF() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20.0),
           TextField(
              controller: _Password,
              obscureText: true,
              style: TextStyle(
                color: Text_SecondaryColor,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 2,color: PrimaryColor, ),
                ),
                // prefixIcon: Icon(
                //   Icons.lock,
                //   color: Text_SecondaryColor,
                // ),
                hintText: 'Password',
                hintStyle: kHintTextStyle,
              ),
            ),

        ],
      ),
    );
  }
}
