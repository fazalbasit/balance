import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:balance/Component/constants.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _F_Name = new TextEditingController();
  TextEditingController _L_Name = new TextEditingController();
  TextEditingController _Email = new TextEditingController();
  TextEditingController _Password = new TextEditingController();
  TextEditingController _Confirm_Password = new TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    date();

  }
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

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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

                            child:Image.asset("assets/images/signup_image.png",fit: BoxFit.fitWidth,)
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

                Progress
                    ? Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
                    : Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                  children: <Widget>[
                      SizedBox(height: 0.0),
                      Row(
                        children: [
                          Text("Create Account",style: kLabelStyle.copyWith(fontSize: 20),),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      _buildNameTF(),
                      SizedBox(
                        height: 10.0,
                      ),
                      _buildEmailTF(),
                      SizedBox(
                        height: 10.0,
                      ),
                      _buildPasswordTF(),
                      // _buildRememberMeCheckbox(),
                      SizedBox(
                        height: 40.0,
                      ),
                      //_buildinstructionText(),
                      // SizedBox(
                      //   height: 50.0,
                      // ),
                      _buildSignupBtn(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildSigninBtn(context),
                      SizedBox(
                        height: 30.0,
                      ),

                      //_buildSignupBtn(),
                  ],
                ),
                    ),/**/
              ],
            ),
          ),
        ),
    );
  }

  Widget _buildNameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        TextField(
          controller: _F_Name,
          keyboardType: TextInputType.name,
          style: TextStyle(
            color: Text_SecondaryColor,
            fontFamily: 'OpenSans',
          ),
          decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: PrimaryColor,
              ),
            ),
            hintText: 'First Name',
            hintStyle: kHintTextStyle,
          ),
        ),
        SizedBox(height: 20.0),
        TextField(
          controller: _L_Name,
          keyboardType: TextInputType.name,
          style: TextStyle(
            color: Text_SecondaryColor,
            fontFamily: 'OpenSans',
          ),
          decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: PrimaryColor,
              ),
            ),
            hintText: 'Last Name',
            hintStyle: kHintTextStyle,
          ),
        ),
      ],
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

  Widget _buildSocialBtnRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        GestureDetector(
            onTap: () => print("fb logo clicked"),
            child: Image.asset("assets/images/fb_logo.png")),
        GestureDetector(
            onTap: () => print(" logo clicked"),
            child: Image.asset("assets/images/google_logo.png")),
        GestureDetector(
            onTap: () => print("apple logo clicked"),
            child: Image.asset("assets/images/apple_logo.png")),
      ],
    );
  }

  // Widget _buildinstructionText() {
  //   return Container(
  //       padding: EdgeInsets.symmetric(horizontal: 20),
  //       alignment: Alignment.center,
  //       child: Column(
  //         children: [
  //           BuildIconsRow(getTranslated(context, 'signup_info1').toString()),
  //           BuildIconsRow(getTranslated(context, 'signup_info2').toString()),
  //           BuildIconsRow(getTranslated(context, 'signup_info2').toString()),
  //         ],
  //       )
  //   );
  // }
  Widget BuildIconsRow(String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(
            Icons.circle,
            size: 10,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool Progress = false;

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () {
        print(_Email.text);
        print(_Password.text);
        setState(() {
          Progress=true;
        });
        _firebaseAuth
            .createUserWithEmailAndPassword(
            email: _Email.text,
            password: _Password.text)
            .then((value) {
          var userid = value.user!.uid;

          FirebaseFirestore.instance
              .collection('users')
              .doc(userid)
              .set({
            "F_name":
            _F_Name.text.toString(),
            "L_name": _L_Name.text.toString(),
            "email":
            _Email.text.toString(),
            "E_date": formattedDateexp,
            // "S_date": s_Date,
            "password":
            _Password.text,
          }).then((value) =>
          {
            Navigator.pushNamed(context, "/Home")
          });

        }).catchError((err) {
          print(err);
          setState(() {
            Progress = false;
          });
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Error'),
                  content: Text(err.message),
                  actions: [
                    FlatButton(
                      child: Text('Ok'),
                      onPressed: () {
                        Navigator.of(context)
                            .pop();
                      },
                    )
                  ],
                );
              });
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          decoration: Login_Button_BoxDecoration.copyWith(color: PrimaryColor),
          padding: EdgeInsets.symmetric(vertical: 15.0),
          width: double.infinity,
          child: Text(
            'Submit',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFFFFFFF),
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

  Widget _buildSigninBtn(var context) {
    return GestureDetector(
      onTap: () => {Navigator.pushNamed(context, "/login")},
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Already have an account? ',
              style: TextStyle(
                color: Text_SecondaryColor,
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: 'Sign in',
              style: TextStyle(
                color: PrimaryColor,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailTF() {
    return Column(
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
              borderSide: BorderSide(
                width: 2,
                color: PrimaryColor,
              ),
            ),
            hintText: 'Email',
            hintStyle: kHintTextStyle,
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        TextField(
          controller: _Password,
          obscureText: true,
          style: TextStyle(
            color: Text_SecondaryColor,
            fontFamily: 'OpenSans',
          ),
          decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: PrimaryColor,
              ),
            ),
            hintText: 'Password',
            hintStyle: kHintTextStyle,
          ),
        ),
        SizedBox(height: 20.0),
        TextField(
          controller: _Confirm_Password,
          obscureText: true,
          style: TextStyle(
            color: Text_SecondaryColor,
            fontFamily: 'OpenSans',
          ),
          decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: PrimaryColor,
              ),
            ),
            hintText: 'Confirm Password',
            hintStyle: kHintTextStyle,
          ),
        ),
      ],
    );
  }
}
