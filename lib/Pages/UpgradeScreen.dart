//
// import 'package:balance/Component/customappbar.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:in_app_purchase/in_app_purchase.dart';
// import 'package:flutter/services.dart';
//
// import 'package:intl/intl.dart';
// import 'package:purchases_flutter/offerings_wrapper.dart';
// import 'package:purchases_flutter/purchaser_info_wrapper.dart';
// import 'package:purchases_flutter/purchases_flutter.dart';
//
//
// PurchaserInfo _purchaserInfo;
//
// int e_days = 0;
//
// class UpgradeScreen extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _UpgradeScreenState();
// }
//
// int _radioValue1 = 1;
// List<String> list = [];
//
// int savecheck = 0;
//
// class _UpgradeScreenState extends State<UpgradeScreen> {
//   Offerings _offerings;
//
//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }
//
//   Future<void> fetchData() async {
//     PurchaserInfo purchaserInfo;
//     try {
//       purchaserInfo = await Purchases.getPurchaserInfo();
//     } on PlatformException catch (e) {
//       print(e);
//     }
//
//     Offerings offerings;
//     try {
//       offerings = await Purchases.getOfferings();
//     } on PlatformException catch (e) {
//       print(e);
//     }
//     if (!mounted) return;
//
//     setState(() {
//       _purchaserInfo = purchaserInfo;
//       _offerings = offerings;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (_purchaserInfo == null) {
//       return  Scaffold(
//         appBar:AppBar(),
//             //backgroundColor: kColorPrimary,
//             body: Center(
//                 child: Text(
//               "Loading...",
//             ))
//       );
//     } else {
//       if (_purchaserInfo.entitlements.all.isNotEmpty &&
//           _purchaserInfo.entitlements.all['all_features']!.isActive != null) {
//         appData.isPro =
//             _purchaserInfo.entitlements.all['all_features']!.isActive;
//
//          List<String> a= _purchaserInfo.activeSubscriptions;
//          List<String> b= _purchaserInfo.allPurchasedProductIdentifiers;
// ////         Toast.show(a.toString(), context);
// ////         Toast.show(b.toString(), context);
// //         print(a);
// //         print(b);
//
//
//       } else {
//         appData.isPro = false;
//       }
//       if (appData.isPro) {
//         return ProScreen();
//       } else {
//         return UpsellScreen(
//           offerings: _offerings,
//         );
//       }
//     }
//   }
// }
//
// class UpsellScreen extends StatefulWidget {
//   final Offerings offerings;
//
//   UpsellScreen({Key key, @required this.offerings}) : super(key: key);
//
//   @override
//   _UpsellScreenState createState() => _UpsellScreenState();
// }
//
// class _UpsellScreenState extends State<UpsellScreen> {
//   _launchURLWebsite(String zz) async {
//     if (await canLaunch(zz)) {
//       await launch(zz);
//     } else {
//       throw 'Could not launch $zz';
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (widget.offerings != null) {
//       print('offeringS is not null');
//       print(widget.offerings.current.toString());
//       print('--');
//       print(widget.offerings.toString());
//       final offering = widget.offerings.current;
//       if (offering != null) {
//         final Yearly = offering.monthly;
//         final weekly = offering.weekly;
//         if (Yearly != null) {
//           return Scaffold(
//             body: Container(
//               decoration: BoxDecoration(
// //                  image: DecorationImage(
// //                      image: AssetImage('assets/bc.png'),
// //                      alignment: AlignmentDirectional.topEnd,
// //                      fit: BoxFit.fitWidth)
//                       ),
//               child: Container(
//                 margin: EdgeInsets.symmetric(horizontal: 20),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                       height: 80,
//                     ),
//                     Image.asset(
//                       'assets/logo.png',
//                       scale: 2.0,
//                     ),
//                     Text(
//                       'Framii',
//                       textAlign: TextAlign.center,
//                       style:
//                           TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
//                     ),
//                     Text(
//                       'Unlimited Full Access',
//                       textAlign: TextAlign.center,
//                       style:
//                       TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Text('Choose your plan',style: TextStyle(fontSize: 18, color: Colors.grey),),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Center(
//                         child: Column(
//                       children: [
//                         OutlineGradientButton(
//                           child: SizedBox(
// //                          width: 52,
// //                          height: 52,
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 color: Colors.grey.withAlpha(100),
//                               ),
//                               margin: EdgeInsets.symmetric(
//                                   vertical: 5, horizontal: 5),
//                               padding: EdgeInsets.symmetric(
//                                   vertical: 20, horizontal: 10),
//                               child: Row(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
// //                          Radio(
// //                            value: 1,
// //                            groupValue: _radioValue1,
// //                            onChanged: _handleRadioValueChange1,
// //                          ),
//                                   Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           Text('\$2.99',
//                                               textAlign: TextAlign.start,
//                                               style: TextStyle(
//                                                   fontSize: 20,
//                                                   fontWeight: FontWeight.w900)),
//                                           Text(" per week",
//                                               style: TextStyle(
//                                                   fontSize: 20,
//                                                   //  color: Colors.grey,
//                                                   fontWeight: FontWeight.w800)),
//                                           Text(" after 3 day trial",
//                                               style: TextStyle(
//                                                   fontSize: 16,
//                                                   color: Color(0xffB51CEF),
//                                                   fontWeight: FontWeight.w600))
//                                         ],
//                                       ),
//                                       SizedBox(height: 2,),
//
//                                       Text('Auto-renewable. Cancel anytime',
//                                           textAlign: TextAlign.start,
//                                           style: TextStyle(
//                                             //color: Color(0xffB51CEF),
//                                               fontSize: 16, fontWeight: FontWeight.w800)),
//                                     ],
//                                   ),
// //                                  Container(
// //                                    padding: EdgeInsets.symmetric(
// //                                        vertical: 10, horizontal: 10),
// //                                    decoration: BoxDecoration(
// //                                      borderRadius: BorderRadius.circular(20),
// //                                      gradient: LinearGradient(
// //                                        colors: [
// //                                          Color(0xff610EFB),
// //                                          Color(0xffB51CEF)
// //                                        ],
// //                                        begin: Alignment.topCenter,
// //                                        end: Alignment.bottomCenter,
// //                                      ),
// //                                    ),
// //                                    child: Text(
// //                                      'SAVE 80%',
// //                                      style: TextStyle(color: Colors.white),
// //                                    ),
// //                                  )
//                                 ],
//                               ),
//                             ),
//                           ),
//                           gradient: LinearGradient(
//                             colors: _radioValue1 == 2
//                                 ? [Color(0xff610EFB), Color(0xffB51CEF)]
//                                 : [Color(0xfffffff), Color(0xfffff)],
//                             begin: Alignment(-1, -1),
//                             end: Alignment(2, 2),
//                           ),
//                           strokeWidth: 2,
//                           padding: EdgeInsets.zero,
//                           radius: Radius.circular(20),
//                           onTap: () {
//                             e_days = 7;
//                             print("selected package is:" + e_days.toString());
//
//                             print('First Checkbox clicked');
//                             setState(() {
//                               _radioValue1 = 2;
//                             });
//                           },
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         OutlineGradientButton(
//                           onTap: () {
//                             print('Second Checkbox clicked');
//
//                             e_days = 365;
//                             print("selected package is:" + e_days.toString());
//
//                             setState(() {
//                               _radioValue1 = 1;
//                             });
//                           },
//                           child: SizedBox(
// //                          width: 52,
// //                          height: 52,
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 color: Colors.grey.withAlpha(100),
//                               ),
//                               margin: EdgeInsets.symmetric(
//                                   vertical: 5, horizontal: 5),
//                               padding: EdgeInsets.symmetric(
//                                   vertical: 20, horizontal: 10),
//                               child: Row(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.start,
//                                 children: [
//
//                                   Column(
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       crossAxisAlignment: CrossAxisAlignment.center,
//                                       children: [
//                                         Row(
//                                           children: [
//                                             Text('\$27.99',
//                                                 textAlign: TextAlign.start,
//                                                 style: TextStyle(
//                                                     fontSize: 20,
//                                                     fontWeight: FontWeight.w900)),
//                                             Text(" per year",
//                                                 style: TextStyle(
//                                                     fontSize: 20,
//                                                   //  color: Colors.grey,
//                                                     fontWeight: FontWeight.w800)),
//                                             Text(" after 3 day trial",
//                                                 style: TextStyle(
//                                                     fontSize: 16,
//                                                     color: Color(0xffB51CEF),
//                                                     fontWeight: FontWeight.w600))
//                                           ],
//                                         ),
//                                         SizedBox(height: 2,),
//
//                                         Text('Auto-renewable. Cancel anytime',
//                                             textAlign: TextAlign.start,
//                                             style: TextStyle(
//                                               //color: Color(0xffB51CEF),
//                                                 fontSize: 16, fontWeight: FontWeight.w800)),
//                                       ],
//                                     ),
//
//                                 ],
//                               ),
//                             ),
//                           ),
//                           gradient: LinearGradient(
//                             colors: _radioValue1 == 1
//                                 ? [Color(0xff610EFB), Color(0xffB51CEF)]
//                                 : [Color(0xffffff), Color(0xffffff)],
//                             begin: Alignment(-1, -1),
//                             end: Alignment(2, 2),
//                           ),
//                           strokeWidth: 2,
//                           padding: EdgeInsets.zero,
//                           radius: Radius.circular(20),
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         _radioValue1 == 1
//                             ? StartButton(
//                                 package: Yearly,
//                               )
//                             : StartButton(
//                                 package: weekly,
//                               ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         purchase_button()
//                       ],
//                     )),
//                     SizedBox(
//                       height: 30,
//                     ),
//
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         GestureDetector(
//                             onTap: (){
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => webinfo('https://www.framii.app/terms-of-use'),
//                                   ));
//                             },
//                             child: Text("Terms of Use")),
//                         SizedBox(width: 10,),
//                         Icon(Icons.fiber_manual_record,color:Color(0xff8c4ffc), size: 10,),
//                         SizedBox(width: 10,),
//                         GestureDetector(
//                             onTap: (){
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => webinfo('https://www.framii.app/privacy-policy'),
//                                   ));
//
//                             },
//                             child: Text("Privacy Policy"))
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           );
//         }
//       }
//     }
//     return TopBarAgnosticNoIcon(
//       text: "Upgrade Screen",
//       style: kSendButtonTextStyle,
//       uniqueHeroTag: 'upgrade_screen1',
//       child: Scaffold(
//           backgroundColor: kColorPrimary,
//           body: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.all(18.0),
//                   child: Icon(
//                     Icons.error,
//                     color: kColorText,
//                     size: 44.0,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Text(
//                     "There was an error. Please check that your device is allowed to make purchases and try again. Please contact us at xxx@xxx.com if the problem persists.",
//                     textAlign: TextAlign.center,
//                     style: kSendButtonTextStyle,
//                   ),
//                 ),
//               ],
//             ),
//           )),
//     );
//   }
// }
//
// class ProScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
// //          backgroundColor: kColorPrimary,
//           body: Container(
//             decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Color(0xffceb4fe).withAlpha(1), Color(0xffFFFFFF)],
//                   begin: Alignment.topRight,
//                   end: Alignment.center,
//                 )),
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.all(18.0),
//                     child: Icon(
//                       Icons.star,
//                       color: kColorText,
//                       size: 44.0,
//                     ),
//                   ),
//                   Padding(
//                       padding: const EdgeInsets.all(18.0),
//                       child: Text(
//                         "You are a Pro user.\n\nYou can use the app in all its functionality.\nPlease contact us at khaigamboa@gmail.com.com if you have any problem",
//                         textAlign: TextAlign.center,
//                         style: kSendButtonTextStyle,
//                       )),
//                 ],
//               ),
//             ),
//           ),
//     );
//   }
// }
//
// class PurchaseButton extends StatefulWidget {
//   final Package package;
//
//   PurchaseButton({Key key, @required this.package}) : super(key: key);
//
//   @override
//   _PurchaseButtonState createState() => _PurchaseButtonState();
// }
//
// class _PurchaseButtonState extends State<PurchaseButton> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 20.0, right: 20.0),
//       child: Container(
//         color: Colors.white,
//         width: double.infinity,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.only(top: 18.0),
//               child: RaisedButton(
//                 onPressed: () async {
//                   try {
//                     print("this one" + widget.package.product.title);
//                     //onupdate();
//                     print('now trying to purchase this one');
//                     _purchaserInfo =
//                         await Purchases.purchasePackage(widget.package);
//                     print('purchase completed');
//
//                     appData.isPro = _purchaserInfo
//                         .entitlements.all["all_features"].isActive;
//
//                     print('is user pro? ${appData.isPro}');
//
//                     if (appData.isPro) {
//                       onupdate();
//                       Alert(
//                         context: context,
//                         style: kWelcomeAlertStyle,
//                         image: Image.asset(
//                           "assets/avatar_demo.png",
//                           height: 150,
//                         ),
//                         title: "Congratulation",
//                         content: Column(
//                           children: <Widget>[
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                   top: 20.0,
//                                   right: 8.0,
//                                   left: 8.0,
//                                   bottom: 20.0),
//                               child: Text(
//                                 'Well done, you now have full access to the app',
//                                 textAlign: TextAlign.center,
//                                 style: kSendButtonTextStyle,
//                               ),
//                             )
//                           ],
//                         ),
//                         buttons: [
//                           DialogButton(
//                             radius: BorderRadius.circular(10),
//                             child: Text(
//                               "COOL",
//                               style: kSendButtonTextStyle,
//                             ),
//                             onPressed: () {
//                               Navigator.of(context, rootNavigator: true).pop();
//                               Navigator.of(context, rootNavigator: true).pop();
//                               Navigator.of(context, rootNavigator: true).pop();
//                             },
//                             width: 127,
//                             color: Colors.white,
//                             height: 52,
//                           ),
//                         ],
//                       ).show();
//                     } else {
//                       Alert(
//                         context: context,
//                         style: kWelcomeAlertStyle,
//                         title: "Error",
//                         content: Column(
//                           children: <Widget>[
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                   top: 20.0,
//                                   right: 8.0,
//                                   left: 8.0,
//                                   bottom: 20.0),
//                               child: Text(
//                                 'There was an error. Please try again later',
//                                 textAlign: TextAlign.center,
//                                 style: kSendButtonTextStyle,
//                               ),
//                             )
//                           ],
//                         ),
//                         buttons: [
//                           DialogButton(
//                             radius: BorderRadius.circular(10),
//                             child: Ink(
//                               decoration: BoxDecoration(
//                                   gradient: LinearGradient(
//                                     colors: [
//                                       Color(0xff610EFB),
//                                       Color(0xffB51CEF)
//                                     ],
//                                     stops: [0.3, 1],
//                                     begin: Alignment.topLeft,
//                                     end: Alignment.bottomRight,
//                                   ),
//                                   borderRadius: BorderRadius.circular(10.0)),
//                               child: Container(
//                                 constraints: BoxConstraints(minHeight: 50.0),
//                                 alignment: Alignment.center,
//                                 child: Text(
//                                   "Cool",
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.w700,
//                                       fontFamily: 'VisbyCF'),
//                                 ),
//                               ),
//                             ),
//                             onPressed: () {
//                               Navigator.of(context, rootNavigator: true).pop();
//                             },
//                             width: 127,
//                             color: kColorAccent,
//                             height: 52,
//                           ),
//                         ],
//                       ).show();
//                     }
//                   } on PlatformException catch (e) {
//                     print('----xx-----');
//                     var errorCode = PurchasesErrorHelper.getErrorCode(e);
//                     if (errorCode ==
//                         PurchasesErrorCode.purchaseCancelledError) {
//                       print("User cancelled");
//                     } else if (errorCode ==
//                         PurchasesErrorCode.purchaseNotAllowedError) {
//                       print("User not allowed to purchase");
//                     }
//                     Alert(
//                       context: context,
//                       style: kWelcomeAlertStyle,
//                       title: "Error",
//                       content: Column(
//                         children: <Widget>[
//                           Padding(
//                             padding: const EdgeInsets.only(
//                                 top: 20.0, right: 8.0, left: 8.0, bottom: 20.0),
//                             child: Text(
//                               'There was an error. Please try again later',
//                               textAlign: TextAlign.center,
//                               style: kSendButtonTextStyle,
//                             ),
//                           )
//                         ],
//                       ),
//                       buttons: [
//                         DialogButton(
//                           radius: BorderRadius.circular(10),
//                           child: Ink(
//                             decoration: BoxDecoration(
//                                 gradient: LinearGradient(
//                                   colors: [
//                                     Color(0xff610EFB),
//                                     Color(0xffB51CEF)
//                                   ],
//                                   stops: [0.3, 1],
//                                   begin: Alignment.topLeft,
//                                   end: Alignment.bottomRight,
//                                 ),
//                                 borderRadius: BorderRadius.circular(10.0)),
//                             child: Container(
//                               constraints: BoxConstraints(minHeight: 50.0),
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "Cool",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w700,
//                                     fontFamily: 'VisbyCF'),
//                               ),
//                             ),
//                           ),
//                           onPressed: () {
//                             Navigator.of(context, rootNavigator: true).pop();
//                           },
//                           width: 127,
//                           color: kColorAccent,
//                           height: 52,
//                         ),
//                       ],
//                     ).show();
//                   }
//                   return UpgradeScreen();
//                 },
//                 textColor: kColorText,
//                 padding: const EdgeInsets.all(0.0),
//                 child: Container(
//                   width: MediaQuery.of(context).size.width / 1.5,
//                   decoration: const BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [Color(0xff610EFB), Color(0xffB51CEF)],
//                     ),
//                   ),
//                   padding: const EdgeInsets.all(10.0),
//                   child: Text(
//                     'Buy ${widget.package.product.title}\n${widget.package.product.priceString}',
//                     style: TextStyle(fontSize: 20),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 8.0, bottom: 18.0),
//               child: Text(
//                 '${widget.package.product.description}',
//                 textAlign: TextAlign.center,
//                 style: kSendButtonTextStyle.copyWith(
//                     fontSize: 16, fontWeight: FontWeight.normal),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   void onupdate() async {
//     var now = new DateTime.now();
//     var formatter = new DateFormat('dd-MM-yyyy');
//     String formattedDate = formatter.format(now);
//
//     print(widget.package.product.title);
//
//     if (widget.package.product.title == "Weekly (Kinbertex)") {
//       e_days = 7;
//       print("Weekly");
//     } else if (widget.package.product.title ==
//         "Monthly subscription (Kinbertex)") {
//       print("Monthly ");
//       e_days = 30;
//     }
//
//     var expiry_date = now.add(Duration(days: e_days, hours: 00));
//     String formattedDateexp = formatter.format(expiry_date);
//     print(formattedDateexp);
//
//     var firebaseUser = await FirebaseAuth.instance.currentUser();
//     await Firestore.instance
//         .collection("users")
//         .document(firebaseUser.uid)
//         .updateData({
//       "expiry_date": formattedDateexp,
//     }).then((_) {
//       print("success!");
//       Navigator.pushNamed(context, "/home");
//     });
//   }
// }
//
// final kGradientBoxDecoration = BoxDecoration(
//   gradient: LinearGradient(colors: [Colors.black, Colors.redAccent]),
//   border: Border.all(
//     color: Colors.black,
//   ),
//   borderRadius: BorderRadius.circular(32),
// );
//
// class StartButton extends StatefulWidget {
//   final Package package;
//
//   StartButton({Key key, @required this.package}) : super(key: key);
//
//   @override
//   _StartButtonState createState() => _StartButtonState();
// }
//
// class _StartButtonState extends State<StartButton> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         boxShadow: [
//           BoxShadow(
//             color: Color(0xffBA04FF).withOpacity(0.2),
//             spreadRadius: 5,
//             blurRadius: 7,
//             offset: Offset(0, 3), // changes position of shadow
//           ),
//         ],
//         borderRadius: BorderRadius.circular(30.0),
//       ),
//       height: 50.0,
//       child: RaisedButton(
//         onPressed: () async {
//           try {
//             print("this one" + widget.package.product.title);
//             //onupdate();
//             print('now trying to purchase this one');
//             _purchaserInfo = await Purchases.purchasePackage(widget.package);
//             print('purchase completed');
//
//             appData.isPro =
//                 _purchaserInfo.entitlements.all["all_features"].isActive;
//
//             print('is user pro? ${appData.isPro}');
//
//             if (appData.isPro) {
//               onupdate();
//               Alert(
//                 context: context,
//                 style: kWelcomeAlertStyle,
//                 image: Image.asset(
//                   "assets/logo.png",
//                   height: 150,
//                 ),
//                 title: "Congratulation",
//                 content: Column(
//                   children: <Widget>[
//                     Padding(
//                       padding: const EdgeInsets.only(
//                           top: 20.0, right: 8.0, left: 8.0, bottom: 20.0),
//                       child: Text(
//                         'Well done, you now have full access to the app',
//                         textAlign: TextAlign.center,
//                         style: kSendButtonTextStyle,
//                       ),
//                     )
//                   ],
//                 ),
//                 buttons: [
//
//
//                   DialogButton(
//                     radius: BorderRadius.circular(10),
//                     child: Ink(
//                       decoration: BoxDecoration(
//                           gradient: LinearGradient(
//                             colors: [Color(0xff610EFB), Color(0xffB51CEF)],
//                             stops: [0.3, 1],
//                             begin: Alignment.topLeft,
//                             end: Alignment.bottomRight,
//                           ),
//                           borderRadius: BorderRadius.circular(10.0)),
//                       child: Container(
//
//                         constraints: BoxConstraints(minHeight: 50.0),
//                         alignment: Alignment.center,
//                         child: Text(
//                           "Cool",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 20,
//                               fontWeight: FontWeight.w700,
//                               fontFamily: 'VisbyCF'),
//                         ),
//                       ),
//                     ),
//                     onPressed: () {
//                       Navigator.pushReplacementNamed(context, "/home");
//                     },
//                     width: 127,
//                     color: Color(0xffFFFFFF),
//                     height: 52,
//                   ),
//                 ],
//               ).show();
//             } else {
//               Alert(
//                 context: context,
//                 style: kWelcomeAlertStyle,
//                 title: "Error",
//                 content: Column(
//                   children: <Widget>[
//                     Padding(
//                       padding: const EdgeInsets.only(
//                           top: 20.0, right: 8.0, left: 8.0, bottom: 20.0),
//                       child: Text(
//                         'There was an error. Please try again later',
//                         textAlign: TextAlign.center,
//                         style: kSendButtonTextStyle,
//                       ),
//                     )
//                   ],
//                 ),
//                 buttons: [
//                   DialogButton(
//                     radius: BorderRadius.circular(10),
//                     child: Ink(
//                       decoration: BoxDecoration(
//                           gradient: LinearGradient(
//                             colors: [Color(0xff610EFB), Color(0xffB51CEF)],
//                             stops: [0.3, 1],
//                             begin: Alignment.topLeft,
//                             end: Alignment.bottomRight,
//                           ),
//                           borderRadius: BorderRadius.circular(10.0)),
//                       child: Container(
//                         constraints: BoxConstraints(minHeight: 50.0),
//                         alignment: Alignment.center,
//                         child: Text(
//                           "Cool",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 20,
//                               fontWeight: FontWeight.w700,
//                               fontFamily: 'VisbyCF'),
//                         ),
//                       ),
//                     ),
//                     onPressed: () {
//                       Navigator.of(context, rootNavigator: true).pop();
//                     },
//                     width: 127,
//                     color: kColorAccent,
//                     height: 52,
//                   ),
//                 ],
//               ).show();
//             }
//           } on PlatformException catch (e) {
//             print('----xx-----');
//             var errorCode = PurchasesErrorHelper.getErrorCode(e);
//             if (errorCode == PurchasesErrorCode.purchaseCancelledError) {
//               print("User cancelled");
//             } else if (errorCode ==
//                 PurchasesErrorCode.purchaseNotAllowedError) {
//               print("User not allowed to purchase");
//             }
//             Alert(
//               context: context,
//               style: kWelcomeAlertStyle,
//               title: "Error",
//               content: Column(
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.only(
//                         top: 20.0, right: 8.0, left: 8.0, bottom: 20.0),
//                     child: Text(
//                       'There was an error. Please try again later',
//                       textAlign: TextAlign.center,
//                       style: kSendButtonTextStyle,
//                     ),
//                   )
//                 ],
//               ),
//               buttons: [
//                 DialogButton(
//                   radius: BorderRadius.circular(10),
//                   child: Ink(
//                     decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           colors: [Color(0xff610EFB), Color(0xffB51CEF)],
//                           stops: [0.3, 1],
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                         ),
//                         borderRadius: BorderRadius.circular(10.0)),
//                     child: Container(
//                       constraints: BoxConstraints(minHeight: 50.0),
//                       alignment: Alignment.center,
//                       child: Text(
//                         "Cool",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 20,
//                             fontWeight: FontWeight.w700,
//                             fontFamily: 'VisbyCF'),
//                       ),
//                     ),
//                   ),
//                   onPressed: () {
//                     Navigator.of(context, rootNavigator: true).pop();
//                   },
//                   width: 127,
//                   color: Colors.white,
//                   height: 52,
//                 ),
//               ],
//             ).show();
//           }
//           return UpgradeScreen();
//         },
//         shape:
//             RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
//         padding: EdgeInsets.all(0.0),
//         child: Ink(
//           decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Color(0xff610EFB), Color(0xffB51CEF)],
//                 stops: [0.3, 1],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//               borderRadius: BorderRadius.circular(30.0)),
//           child: Container(
//             constraints: BoxConstraints(minHeight: 50.0),
//             alignment: Alignment.center,
//             child: Text(
//               "Continue",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.w700,
//                   fontFamily: 'VisbyCF'),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   void onupdate() async {
//     var now = new DateTime.now();
//     var formatter = new DateFormat('dd-MM-yyyy');
//     String formattedDate = formatter.format(now);
//
//     print(widget.package.product.title);
//
//     if (widget.package.product.title == "Weekly (Kinbertex)") {
//       e_days = 7;
//       print("Weekly");
//     } else if (widget.package.product.title ==
//         "Monthly subscription (Kinbertex)") {
//       print("Monthly ");
//       e_days = 30;
//     }
//
//     var expiry_date = now.add(Duration(days: e_days, hours: 00));
//     String formattedDateexp = formatter.format(expiry_date);
//     print(formattedDateexp);
//
//     var firebaseUser = await FirebaseAuth.instance.currentUser();
//     await Firestore.instance
//         .collection("users")
//         .document(firebaseUser.uid)
//         .updateData({
//       "expiry_date": formattedDateexp,
//     }).then((_) {
//       print("success!");
//     });
//   }
// }
//
// class purchase_button extends StatefulWidget {
//   @override
//   _purchase_buttonState createState() => _purchase_buttonState();
// }
//
// class _purchase_buttonState extends State<purchase_button> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(30.0),
//       ),
//       height: 50.0,
//       child: RaisedButton(
//         onPressed: () async {
//           try {
//             print('now trying to restore');
//             PurchaserInfo restoredInfo = await Purchases.restoreTransactions();
//             print('restore completed');
//             print(restoredInfo.toString());
//
//             appData.isPro =
//                 restoredInfo.entitlements.all["all_features"].isActive;
//
//             print('is user pro? ${appData.isPro}');
//
//             if (appData.isPro) {
//               Alert(
//                 context: context,
//                 style: kWelcomeAlertStyle,
//                 image: Image.asset(
//                   "assets/logo.png",
//                   height: 150,
//                 ),
//                 title: "Congratulation",
//                 content: Column(
//                   children: <Widget>[
//                     Padding(
//                       padding: const EdgeInsets.only(
//                           top: 20.0, right: 8.0, left: 8.0, bottom: 20.0),
//                       child: Text(
//                         'Your purchase has been restored!',
//                         textAlign: TextAlign.center,
//                         style: kSendButtonTextStyle,
//                       ),
//                     )
//                   ],
//                 ),
//                 buttons: [
//                   DialogButton(
//                     radius: BorderRadius.circular(10),
//                     child: Text(
//                       "COOL",
//                       style: kSendButtonTextStyle,
//                     ),
//                     onPressed: () {
//                       Navigator.of(context, rootNavigator: true).pop();
//                       Navigator.of(context, rootNavigator: true).pop();
//                       Navigator.of(context, rootNavigator: true).pop();
//                     },
//                     width: 127,
//                     color: Colors.white,
//                     height: 52,
//                   ),
//                 ],
//               ).show();
//             } else {
//               Alert(
//                 context: context,
//                 style: kWelcomeAlertStyle,
//                 title: "Error",
//                 content: Column(
//                   children: <Widget>[
//                     Padding(
//                       padding: const EdgeInsets.only(
//                           top: 20.0, right: 8.0, left: 8.0, bottom: 20.0),
//                       child: Text(
//                         'There was an error. Please try again later',
//                         textAlign: TextAlign.center,
//                         style: kSendButtonTextStyle,
//                       ),
//                     )
//                   ],
//                 ),
//                 buttons: [
//                   DialogButton(
//                     radius: BorderRadius.circular(10),
//                     child: Ink(
//                       decoration: BoxDecoration(
//                           gradient: LinearGradient(
//                             colors: [Color(0xff610EFB), Color(0xffB51CEF)],
//                             stops: [0.3, 1],
//                             begin: Alignment.topLeft,
//                             end: Alignment.bottomRight,
//                           ),
//                           borderRadius: BorderRadius.circular(10.0)),
//                       child: Container(
//                         constraints: BoxConstraints(minHeight: 50.0),
//                         alignment: Alignment.center,
//                         child: Text(
//                           "Cool",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 20,
//                               fontWeight: FontWeight.w700,
//                               fontFamily: 'VisbyCF'),
//                         ),
//                       ),
//                     ),
//                     onPressed: () {
//                       Navigator.of(context, rootNavigator: true).pop();
//                     },
//                     width: 127,
//                     color: Colors.white,
//                     height: 52,
//                   ),
//                 ],
//               ).show();
//             }
//           } on PlatformException catch (e) {
//             print('----xx-----');
//             var errorCode = PurchasesErrorHelper.getErrorCode(e);
//             if (errorCode == PurchasesErrorCode.purchaseCancelledError) {
//               print("User cancelled");
//             } else if (errorCode ==
//                 PurchasesErrorCode.purchaseNotAllowedError) {
//               print("User not allowed to purchase");
//             }
//             Alert(
//               context: context,
//               style: kWelcomeAlertStyle,
//               title: "Error",
//               content: Column(
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.only(
//                         top: 20.0, right: 8.0, left: 8.0, bottom: 20.0),
//                     child: Text(
//                       'There was an error. Please try again later',
//                       textAlign: TextAlign.center,
//                       style: kSendButtonTextStyle,
//                     ),
//                   )
//                 ],
//               ),
//               buttons: [
//                 DialogButton(
//                   radius: BorderRadius.circular(10),
//                   child: Ink(
//                     decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           colors: [Color(0xff610EFB), Color(0xffB51CEF)],
//                           stops: [0.3, 1],
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                         ),
//                         borderRadius: BorderRadius.circular(10.0)),
//                     child: Container(
//                       constraints: BoxConstraints(minHeight: 50.0),
//                       alignment: Alignment.center,
//                       child: Text(
//                         "Cool",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 20,
//                             fontWeight: FontWeight.w700,
//                             fontFamily: 'VisbyCF'),
//                       ),
//                     ),
//                   ),
//                   onPressed: () {
//                     Navigator.of(context, rootNavigator: true).pop();
//                   },
//                   width: 127,
//                   color: Colors.white,
//                   height: 52,
//                 ),
//               ],
//             ).show();
//           }
//           return UpgradeScreen();
//         },
//         shape:
//             RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
//         padding: EdgeInsets.all(0.0),
//         child: Ink(
//           decoration: BoxDecoration(
//               color: Colors.grey.withAlpha(100),
//               borderRadius: BorderRadius.circular(30.0)),
//           child: Container(
//             constraints: BoxConstraints(minHeight: 50.0),
//             alignment: Alignment.center,
//             child: Text(
//               "Restore Purchases",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w700,
//                   fontFamily: 'VisbyCF'),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//
//
//
//
//
//
// }
