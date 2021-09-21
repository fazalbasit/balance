import 'package:balance/Component/constants.dart';
import 'package:balance/Pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController _Email = new TextEditingController();
bool Progress=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
                      Text("Fogot Password",style: kLabelStyle.copyWith(fontSize: 20),),
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
                  SizedBox(height: 64.0),
                  Progress
                      ? Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                      : _buildSignupBtn(context),

                ],
              ),
            ),
          ],
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
              hintText: 'Enter your Email',
              hintStyle: kHintTextStyle,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignupBtn(var context) {
    return GestureDetector(
      onTap: () => {

        resetPassword(_Email.text)

      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: Container(
          decoration: Login_Button_BoxDecoration.copyWith(color: PrimaryColor),
          padding: EdgeInsets.symmetric(vertical: 15.0),
          width: double.infinity,
          child: Text(
            'Submit',
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
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<void> resetPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email.trim()).then((value){
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Request Sent'),
              content: Text("Request to reset the password is sent\n\n you'll get an shortly through  email"),
              actions: [
                FlatButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ));
                  },
                )
              ],
            );
          });
    }).onError((error, stackTrace) {

    });
  }
}
