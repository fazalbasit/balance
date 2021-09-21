import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:balance/Component/constants.dart';
import 'package:balance/Pages/Videolist.dart';
import 'package:balance/models/categories_model.dart';
import 'package:balance/models/list_for_categories.dart';
import 'package:in_app_purchase/billing_client_wrappers.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class SubCategories extends StatefulWidget {
   SubCategories({Key? key, required this.tittle}) : super(key: key);
    String tittle;

  @override
  _SubCategoriesState createState() => _SubCategoriesState();
}

class _SubCategoriesState extends State<SubCategories> {

  List<Category>? category_list;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // if(widget.tittle=="Fitness"){
    //   category_list = Fitness
    //       .map(
    //         (question) => Category(
    //         question['id'],
    //         question['tittle'],
    //         question['description'],
    //         question['imagePath']),
    //   )
    //       .toList();
    // }else if(widget.tittle=="Stress\nReduction"){
    //   category_list = StressReduction
    //       .map(
    //         (question) => Category(
    //         question['id'],
    //         question['tittle'],
    //         question['description'],
    //         question['imagePath']),
    //   )
    //       .toList();
    //
    // }else if(widget.tittle=="Nutrition"){
    //   category_list = Nutrition
    //       .map(
    //         (question) => Category(
    //         question['id'],
    //         question['tittle'],
    //         question['description'],
    //         question['imagePath']),
    //   )
    //       .toList();
    //
    // }else if(widget.tittle=="Energy\nHealing"){
    //   category_list = EnergyHealing
    //       .map(
    //         (question) => Category(
    //         question['id'],
    //         question['tittle'],
    //         question['description'],
    //         question['imagePath']),
    //   )
    //       .toList();
    // }

  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(top: 50,left: 20,right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: Icon(Icons.arrow_back))],
                  ),
                  SizedBox(height: 10),
                  Text(widget.tittle,style: kLabelStyle.copyWith(fontSize: 38,fontWeight: FontWeight.w700, color: PrimaryColor)),
                  //SizedBox(height: 10),
                ],
              ),

    StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance
        .collection("SubCategory")
        .where("category",
    isEqualTo:widget.tittle)
        .snapshots(),
    builder: (context, snapshot3) {
    if (snapshot3.hasError) {
    return Text('Something went wrong');
    } else if (snapshot3.connectionState ==
    ConnectionState.waiting) {
    return Center(
    child:
    CircularProgressIndicator());
    }

    if(snapshot3.hasData){
      return  new ListView.builder(
        shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: snapshot3.data!.docs.length,
          itemBuilder: (_, int index) {
            final DocumentSnapshot document =
            snapshot3.data!.docs[index];
            return GestureDetector(
              onTap: () {
                //Add_Provider_Dailog(context,document.documentID.toString(),snapshot.data!.documentID.toString());
              },
             // child: new Text(document['tittle']));
              child: Card(document['image_url'], document['tittle'], document['description'], context));
          });
    }else{
      return Text('data dosesnt exist');
    }})


          // ListView.builder(
          //   shrinkWrap: true,
          //   physics: NeverScrollableScrollPhysics(),
          //   itemCount: category_list!.length,
          //   itemBuilder: (BuildContext context,int index){
          //     return Card(category_list![index].imagePath, category_list![index].tittle, category_list![index].description, context);
          //   })

            ],
          ),
        ),
      ),
    );;
  }


  bool Progress=true;
  Widget Card(String Imagename, String title,String description,  var context){
    return GestureDetector(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VideoList(tittle: title,desc: description,),
            ));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(

        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Stack(
            children: [
              ShaderMask(
                shaderCallback: (rect) {
                  return LinearGradient(
                    begin: Alignment. centerRight,
                    end: Alignment.centerLeft,
                    colors: [gradientStart, gradientEnd],
                  ).createShader(Rect.fromLTRB(0, -120, rect.width, rect.height-20));
                },
                blendMode: BlendMode.multiply,
          child: Image.network(
            Imagename,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(PrimaryColor),
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
          ),
              ),
              Positioned(
                child:
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,style: TextStyle(color: PrimaryColor2,fontSize: 25,fontWeight: FontWeight.w600),),
                      SizedBox(height: 15,),
                      Text(description,style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400),),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Color gradientStart = Colors.white;
  Color gradientEnd = Colors.black;
  void purchaseItem(ProductDetails productDetails) {
    final PurchaseParam purchaseParam =
    PurchaseParam(productDetails: productDetails);
    if ((Platform.isIOS &&
        productDetails.skProduct.subscriptionPeriod == null) ||
        (Platform.isAndroid && productDetails.skuDetail.type == SkuType.subs)) {
      InAppPurchaseConnection.instance
          .buyConsumable(purchaseParam: purchaseParam);
    } else {
      InAppPurchaseConnection.instance
          .buyNonConsumable(purchaseParam: purchaseParam);
    }
  }

}
