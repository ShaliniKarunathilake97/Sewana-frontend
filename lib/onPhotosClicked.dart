// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:sewana/posts/post.dart';
import 'package:sewana/posts/postButton.dart';
import 'package:sewana/posts/postHeader.dart';
import 'package:sewana/posts/postStats.dart';
import 'package:sewana/sizeconfig.dart';

class OnPhotosClicked extends StatefulWidget {
  final Post post;
  const OnPhotosClicked({ Key? key,required this.post }) : super(key: key);

  @override
  _OnPhotosClickedState createState() => _OnPhotosClickedState();
}

class _OnPhotosClickedState extends State<OnPhotosClicked> {

  bool liked = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    liked = false;
  }
  void tapLike(Post post){
    setState(() {
      if(liked == false){
      liked = true;
      post.likes++;
    }
    else{
     liked = false;
      post.likes--;
    }
    });
    
  }

  @override
  Widget build(BuildContext context) {
    var images = buildPhotos();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,color:  const Color(0XFF4C5359),size: SizeConfig.blockSizeVertical*4,)
        ),
      ),
      body:  Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal*5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PostHeader(post:widget.post),
                SizedBox(height: SizeConfig.blockSizeVertical*4,),
                Text(widget.post.caption),
                SizedBox(height: SizeConfig.blockSizeVertical*2,),
                // ignore: unnecessary_null_comparison
                widget.post.imgUrls != null ?const SizedBox.shrink()
                :SizedBox(height: SizeConfig.blockSizeVertical*3),
      
                
                
              ],
            ),
            
          ),
          Expanded(
            
                  // child: ListView.builder(
                  //   primary: false,
                  //   shrinkWrap: true,
                  //   scrollDirection: Axis.vertical,
                  //   itemCount: widget.post.imgUrls.length,
                  // itemBuilder: (context,index){
                  //   final photo = widget.post.imgUrls[index];
                  //   return Photo(photo);
                  // }
                  // ),
                child:  GridView(
                 primary: false,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                 // physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                   maxCrossAxisExtent:SizeConfig.screenWidth ,
                   crossAxisSpacing: SizeConfig.blockSizeVertical,
        //mainAxisExtent: SizeConfig.screenWidth,
         ),
                                    children: images,

    )
                ),

                SizedBox(height: SizeConfig.blockSizeVertical*4,)
          
        ],
        
      )
    );
  }
  Widget Photo(String imgUrl){
    return Column(
      children: [
        Expanded(child: Image.network(imgUrl,width: SizeConfig.screenWidth,)),
        PostStats(post: widget.post,),
          Row(
            children: [
              PostButton(icon: liked? Icon(Icons.thumb_up,color: Colors.blue[600],):const Icon(Icons.thumb_up_alt_outlined), 
              label: 'Like', onTap: ()=>tapLike(widget.post)),
              PostButton(icon: const Icon(Icons.comment,color: Colors.black,), 
              label: 'Comment', onTap: ()=>tapLike(widget.post)),
              PostButton(icon: const Icon(Icons.share_sharp), 
              label: 'Share', onTap: ()=>tapLike(widget.post)),
            ],
          )
      ],
    );
  }

  List<Widget> buildPhotos(){
    int numImages = widget.post.imgUrls.length;

    return List<Widget>.generate(numImages,(index){
      return Photo(widget.post.imgUrls[index]);
    }
    );
  }
}