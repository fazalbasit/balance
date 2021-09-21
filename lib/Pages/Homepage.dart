import 'package:balance/Component/constants.dart';
import 'package:balance/Pages/ContactUsPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'AboutUsPage.dart';
import 'SubCategories.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      //appBar: AppBar(backgroundColor: Colors.white,),
      endDrawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors
              .transparent, //This will change the drawer background to blue.
          //other styles
        ),
        child: Drawer(
          child: Container(
            margin: EdgeInsets.only(top: 30),
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(40),bottomLeft: Radius.circular(40)),
              child: Container(
                color: Colors.white,
                child: ListView(
                  // Important: Remove any padding from the ListView.
                  padding: EdgeInsets.zero,
                  children: [
                    DrawerHeader(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                'assets/images/logo.png',
                                scale: 20.0,
                              ),
                              IconButton(
                                  onPressed: () {
                                     Navigator.pop(context);                                },
                                  icon: Icon(
                                    Icons.close_rounded,
                                    color: PrimaryColor,
                                  ))
                            ],
                          ),
                         // Divider(color: Colors.black38,),
                         // Text('Tittle')
                        ],
                      ),
                    ),
                     Container(
                       margin: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                       child: Column(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                InkWell(
                                  onTap: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => AboutUsPage(),
                                        ));
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.group,color: Colors.black,),
                                      SizedBox(width: 60,),
                                      Text('About us',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),)
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20,),
                                InkWell(
                                  onTap: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ContactUsPage(),
                                        ));
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.call,color: Colors.black,),
                                      SizedBox(width: 60,),
                                      Text('Contact us',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),)
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 400,),
                            InkWell(
                              onTap: (){
                                _signOut();
                              },
                              child: Row(
                                children: [
                                  Icon(Icons.logout,color: Colors.black,),
                                  SizedBox(width: 60,),
                                  Text('Log out',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),)
                                ],
                              ),
                            )
                          ],
                        ),
                     ),





                    // ListTile(
                    //   title: const Text('Item 1'),
                    //   onTap: () {
                    //     // Update the state of the app
                    //     // ...
                    //     // Then close the drawer
                    //     Navigator.pop(context);
                    //   },
                    // ),
                    // ListTile(
                    //   title: const Text('Logout'),
                    //   onTap: () {
                    //     // Update the state of the app
                    //     // ...
                    //     // Then close the drawer
                    //     _signOut();
                    //   },
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(top: 50, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            _scaffoldKey.currentState!.openEndDrawer();
                          },
                          icon: Icon(Icons.drag_handle))
                    ],
                  ),
                  Text('Home',
                      style: kLabelStyle.copyWith(
                          fontSize: 38,
                          fontWeight: FontWeight.w700,
                          color: PrimaryColor)),
                  SizedBox(height: 40),
                  Text('Categories', style: kLabelStyle.copyWith(fontSize: 21)),
                ],
              ),
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Card('fitness.png', 'Fitness', 'fitness', context),
                  Card('stress.png', 'Stress Reduction', 'stress_reduction',
                      context),
                  Card('nutrition.png', 'Nutrition', 'nutrition', context),
                  Card(
                      'energy.png', 'Energy Healing', 'energy_healing', context)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget Card(String Imagename, String title, String code, var context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SubCategories(tittle: title),
            ));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Stack(
          children: [
            Container(
              child: Image.asset('assets/images/home/' + Imagename),
            ),
            Positioned(
              top: 50,
              bottom: 50,
              left: 50,
              right: 50,
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 38,
                      fontWeight: FontWeight.w600),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future _signOut() async {
    await FirebaseAuth.instance
        .signOut()
        .then((value) => Navigator.pushReplacementNamed(context, '/login'));
  }
}
