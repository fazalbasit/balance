import 'package:balance/Component/constants.dart';
import 'package:balance/Pages/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  TextEditingController _F_name = new TextEditingController();
  TextEditingController _L_name = new TextEditingController();
  TextEditingController _Email_Adress = new TextEditingController();
  TextEditingController _Intrest = new TextEditingController();
  TextEditingController _message = new TextEditingController();
bool Progress=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 80),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        child: Progress?Center(child: CircularProgressIndicator(),):SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Get In Touch",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
              ),
              _buildEmailTF(),
              SizedBox(height: 60.0),
              _buildSignupBtn(context)
            ],
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
            controller: _F_name,
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
              contentPadding: EdgeInsets.only(top: 14.0),
              hintText: 'First Name',
              hintStyle: kHintTextStyle,
            ),
          ),
          SizedBox(height: 20.0),
          TextField(
            controller: _L_name,
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
              contentPadding: EdgeInsets.only(top: 14.0),
              hintText: 'Last Name',
              hintStyle: kHintTextStyle,
            ),
          ),
          SizedBox(height: 20.0),
          TextField(
            controller: _Email_Adress,
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
              contentPadding: EdgeInsets.only(top: 14.0),
              hintText: 'Email Address',
              hintStyle: kHintTextStyle,
            ),
          ),
          SizedBox(height: 20.0),
          TextField(
            controller: _Intrest,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Text_SecondaryColor,
              fontFamily: 'OpenSans',
            ),
            minLines: 2,
            maxLines: 4,
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: PrimaryColor,
                ),
              ),
              contentPadding: EdgeInsets.only(top: 14.0),
              hintText: 'I am Intresting in',
              hintStyle: kHintTextStyle,
            ),
          ),
          SizedBox(height: 20.0),
          TextField(
            controller: _message,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Text_SecondaryColor,
              fontFamily: 'OpenSans',
            ),
            minLines: 4,
            maxLines: 6,
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: PrimaryColor,
                ),
              ),
              contentPadding: EdgeInsets.only(top: 14.0),
              hintText: 'Message',
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
        _sendTutorMail()
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 40,
        ),
        child: Container(
          decoration: Login_Button_BoxDecoration.copyWith(color: PrimaryColor),
          padding: EdgeInsets.symmetric(vertical: 15.0),
          width: double.infinity,
          child: Text(
            'Send Massage',
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
  _sendTutorMail() async {
    setState(() {
      Progress=true;
    });
    String username = 'bbnwellnesstv@gmail.com';
    String password = 'BBNWellness1';
    final smtpServer = gmail(username, password);
    final message = Message()
      ..from = Address(username, 'message from app user')
      ..recipients.add('fazalbasit.uswat@gmail.com')
      ..html = """
                <h2>Balance By Nature App</h2>
                <p>Name   : ${_F_name.text+" "+_L_name.text}</p>
                <p>Email   : ${_Email_Adress.text}</p>
                <p>Interest : ${_Intrest.text}</p>
                <p>Message : ${_message.text}</p>
              """;
    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
      setState(() {
        Progress=false;
      });
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Sent'),
              content: Text("Message sent Successfully\n\n you'll informed soon through email"),
              actions: [
                FlatButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ));
                  },
                )
              ],
            );
          });
    } on MailerException catch (e) {
      setState(() {
        Progress=false;
      });
      print('Message not sent.' + e.toString());
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }
}
