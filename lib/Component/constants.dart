import 'package:flutter/material.dart';

const Text_SecondaryColor = Color(0xFF131313);
const SecondaryColor = Color(0xFF8E8E8F);
const PrimaryColor = Color(0xFF45C541);
const PrimaryColor2 = Color(0xFF81DC7E
);
const Grey_white = Color(0xFFEAEAEA);
const kPrimaryGradient = LinearGradient(
  colors: [ PrimaryColor2,PrimaryColor],
  begin: Alignment.topRight,
  end: Alignment.bottomLeft
);

const double kDefaultPadding = 20.0;
final kBoxDecorationStyle = BoxDecoration(
  color:Grey_white,
  borderRadius: BorderRadius.circular(40.0),
  boxShadow: [
    BoxShadow(
      color: Color(0xFFE8E8E8),
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);
final Search_BoxDecorationStyle = BoxDecoration(
  color:Colors.white,
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Color(0xFFE8E8E8),
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);
final kLabelStyle = TextStyle(
  color: Text_SecondaryColor,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);
final aboutus_mainstyle= new TextStyle(
fontSize: 16.0,
color: Colors.black,
fontFamily: 'OpenSans',

);

final kHintTextStyle = TextStyle(
  color: SecondaryColor,
);

final Login_Button_BoxDecoration =  BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(40.0),
  border: Border.all(color: PrimaryColor,width: 2),
  //gradient: kPrimaryGradient,
  boxShadow: [
    BoxShadow(
      color: Color(0xFFE8E8E8),
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);



final Nav_TextStyle=TextStyle(fontWeight: FontWeight.w600,fontSize: 16);

final Nav_Decoration=BoxDecoration(
    color: PrimaryColor2,
    borderRadius: BorderRadius.circular(5));


class CustomShape extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path = Path();
    path.lineTo(0, height - 80);
    path.quadraticBezierTo(width / 2, height, width, height - 80);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}



String?  expirydate;
int btncheck = 0;
String? formattedDate;
String? formattedDateexp;



//
// bool check(date) {
//   //Current date
//   var now = new DateTime.now();
//   // var formatter = new DateFormat('yyyy/MM/dd');
//   var formatter = new DateFormat('dd/MM/yyyy');
//   formattedDate = formatter.format(now);
//   print(formattedDate); // 2016-01-25
//   var expiry_date = now.add(Duration(days: 3, hours: 00));
//   formattedDateexp = formatter.format(expiry_date);
//   print(formattedDateexp);
//
//   var exp = (date!.split('/'));
//   var cdate = (formattedDate!.split('/'));
// //   day / month / year
//   print(exp[0] + " " + exp[1] + " " + exp[2]);
//   print(cdate[0] + " " + cdate[1] + " " + cdate[2]);
//
//   if (int.parse(exp[2]) == int.parse(cdate[2])) {
//     print("true");
//     if (int.parse(exp[1]) == int.parse(cdate[1])) {
//       print("true");
//
//       if (int.parse(exp[0]) > int.parse(cdate[0])) {
//         print(exp[2] + ">" + cdate[2]);
//         print("check is " + btncheck.toString());
//
//         // setState(() {
//         //   btncheck = 1;
//         // });
//         return false;
//
//       }
//     } else if (int.parse(exp[1]) > int.parse(cdate[1])) {
//       // setState(() {
//       //   btncheck = 1;
//       // });
//       return false;
//     }
//   }
//   return true;
// }