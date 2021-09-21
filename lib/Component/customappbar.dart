import 'package:flutter/material.dart';

import 'constants.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  final String tittle;
  final Widget child;
  var context;
  CustomAppBar({Key? key, required this.height, required this.tittle, required this.child, required this.context})
      : preferredSize = Size.fromHeight(height),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: PrimaryColor2,
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      )),
                ),
                Expanded(
                    flex: 8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.tittle,
                          style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.white),
                        ),
                      ],
                    )),
              ],
            ),
       widget.child
        ],
      ),
    );
  }
}



class CustomImageAppBar extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  final String tittle;
  final Widget child;
   var context;

  CustomImageAppBar({Key? key, required this.height, required this.tittle, required this.child, required this.context})
      : preferredSize = Size.fromHeight(height),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  _CustomImageAppBarState createState() => _CustomImageAppBarState();
}
final myscale = MediaQueryData.fromWindow(WidgetsBinding.instance!.window);

class _CustomImageAppBarState extends State<CustomImageAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
        //color: PrimaryColor2,
        image: new DecorationImage(
          image: ExactAssetImage('assets/images/rest_back.png'),
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(Color(0xFF01D6DA).withAlpha(180), BlendMode.multiply)
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    )),
              ),
              Expanded(
                  flex: 8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.tittle,
                        style: TextStyle(fontWeight: FontWeight.w600,fontSize: myscale.size.shortestSide < 600 ? 20 :40,color: Colors.white),
                      ),
                    ],
                  )),
            ],
          ),
          widget.child
        ],
      ),
    );
  }
}

