import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sewana/data.dart';
import 'package:sewana/onPhotosClicked.dart';
import 'package:sewana/photogrid.dart';
import 'package:sewana/posts/post.dart';
import 'package:sewana/posts/postButton.dart';
import 'package:sewana/posts/postHeader.dart';
import 'package:sewana/posts/postStats.dart';
import 'package:sewana/profile_avatar.dart';
import 'package:sewana/sizeconfig.dart';

class post_container extends StatefulWidget {
  final Post post;
  const post_container({ Key? key,required this.post}) : super(key: key);

  @override
  State<post_container> createState() => _post_containerState();
}

class _post_containerState extends State<post_container> {
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
    return Container(
      margin: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical*2),
      padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical*2),
      color: Colors.white,
      child: Column(
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
          // ignore: unnecessary_null_comparison
          widget.post.imgUrls !=null ?
           Container(
             width: double.infinity,
             height: SizeConfig.blockSizeVertical*30,
             child: PhotoGrid(imgUrls: widget.post.imgUrls, 
                  onImageClicked: (int i){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>OnPhotosClicked(post: widget.post)));
                  },
                   onExpandClicked: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>OnPhotosClicked(post: widget.post)));
                   }
                   ),
           )
            : const SizedBox.shrink(),
          Padding(padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal*5),
          child: PostStats(post: widget.post,),
          
          ),
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
      ),
    );
  }
}


