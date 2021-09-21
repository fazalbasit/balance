import 'package:balance/Component/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:vimeoplayer/vimeoplayer.dart';

class VideoPage extends StatefulWidget {

  String tittle;
  String desc;
  String Code;
   VideoPage({Key? key, required this.tittle, required this.desc, required this.Code}) : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 40),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      VimeoPlayer(id: widget.Code,autoPlay: false,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [IconButton(onPressed: () {
                          Navigator.pop(context);
                        }, icon: Icon(Icons.arrow_back))
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(widget.tittle, style: kLabelStyle.copyWith(fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: PrimaryColor)),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(widget.desc, style: kLabelStyle.copyWith(fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black38)),
                  ),
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
              // Container(
              //   padding: EdgeInsets.symmetric(horizontal: 10),
              //   child: ListView(
              //     shrinkWrap: true,
              //     physics: NeverScrollableScrollPhysics(),
              //     children: [
              //       Text('Classes', style: kLabelStyle.copyWith(fontSize: 24,
              //           fontWeight: FontWeight.w700,
              //           color: Colors.black)),
              //       SizedBox(height: 10),
              //       VideoItem(path: '605220157'),
              //       Card('605220157', "Yoga with Myla",   context),
              //     ],
              //   ),
              // )

            ],
          ),
        ),
      ),
    );
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
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                        borderRadius: BorderRadius.circular(10)
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








class VideoItem extends StatefulWidget {
   VideoItem({Key? key, required this.path}) : super(key: key);

  String path;

  @override
  _VideoItemState createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
 // VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    //_controller = VideoPlayerController.network(widget.path)
    //   ..initialize().then((_) {
    //     setState(() {});  //when your thumbnail will show.
    //   });
  }

  @override
  void dispose() {
    super.dispose();
  //  _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(

      leading:  Container(
        color: Colors.white,
        width: 60.0,
        height: 100.0,
        child: VimeoPlayer(id: widget.path,autoPlay: false,),
      ),

      title: Text(widget.path.split('/').last),
      onTap: () {
        widget.path;
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) =>
        //         VideoPlayerPage(videoUrl: widget.video.file.path),
        //   ),
        // );
      },
    );
  }
}
