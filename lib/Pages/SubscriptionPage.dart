import 'dart:io';

import 'package:flutter/material.dart';
import 'package:balance/Component/constants.dart';
import 'package:in_app_purchase/in_app_purchase.dart';


class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({Key? key}) : super(key: key);

  @override
  _SubscriptionPageState createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60),
        child: Column(
          children: [
            Row(
              children: [
                // Expanded(
                //     flex: 1,
                //     child: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back))),
                Expanded(
                  flex: 8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Choose Plan',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: PrimaryColor),),
                    ],
                  ),
                )
              ],
            ),


            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
              Card("9.95", "Basic","Get 1 month"),
              Card("12.95", "Premium ","Get 1 month"),
            ],)




          ],
        ),
      ),
      
    );
  }

  static InAppPurchaseConnection? get instance => _getOrCreateInstance();
  static InAppPurchaseConnection? _instance;

  static InAppPurchaseConnection? _getOrCreateInstance() {
    if (Platform.isAndroid) {
   //   _instance = GooglePlayConnection.instance;
    } else if (Platform.isIOS) {
      //_instance = AppStoreConnection.instance;
    }
    return _instance;
  }





  }
Widget Card(String price,String tittle, String days){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30,vertical: 40),
      padding: EdgeInsets.symmetric(vertical: 30,horizontal: 30),
      decoration: BoxDecoration(
        color:Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: PrimaryColor2,
            blurRadius: 6.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(tittle,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: PrimaryColor)),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('\$',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: PrimaryColor)),
              Text(price,style: TextStyle(fontSize: 40,fontWeight: FontWeight.w800,color: Colors.black)),
            ],
          ),
          Row(
            children: [
              Text(days,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: PrimaryColor)),
            ],
          ),

        ],
      ),


    );
}

