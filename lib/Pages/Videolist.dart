import 'package:balance/Component/constants.dart';
import 'package:balance/Pages/VideoPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class VideoList extends StatefulWidget {
   VideoList({Key? key, required this.tittle, required this.desc}) : super(key: key);
   String tittle;
   String desc;

  @override
  _VideoListState createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [IconButton(onPressed: () {
                      Navigator.pop(context);
                    }, icon: Icon(Icons.arrow_back))
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(widget.tittle, style: kLabelStyle.copyWith(fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: PrimaryColor)),
                  SizedBox(height: 20),
                  Text(widget.desc, style: kLabelStyle.copyWith(fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black38)),
                  //SizedBox(height: 10),

                ],
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("Videos")
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
                    }else if(snapshot3.hasData){
                      return  new ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: snapshot3.data!.docs.length,
                          itemBuilder: (_, int index) {
                            final DocumentSnapshot document =
                            snapshot3.data!.docs[index];
                            print(document['url']);
                            return Card(document['thumbnail_url'], document['tittle'], document['url'] , context);
                          });
                    }else{
                      return Text('data dosesnt exist');
                    }})
            ],
          ),
        ),
      ),
    );;
  }

  Widget Card(String Imagename, String title,String videoId,  var context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VideoPage(tittle: widget.tittle,desc: widget.desc,Code:videoId),
            ));

      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      width: 100,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: Image.network(Imagename,
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
                        },),
                    ),
                  ),

                  SizedBox(width: 20,),
                  Expanded(
                    child: Text(title, style: TextStyle(color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),),
                  ),
                ],
              ),
            ),

            Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset('assets/images/play_btn.png' ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}