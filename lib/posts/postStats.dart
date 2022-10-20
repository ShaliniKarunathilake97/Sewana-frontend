// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:sewana/posts/post.dart';

import '../sizeconfig.dart';

class PostStats extends StatefulWidget {
  final Post post;
  const PostStats({ Key? key,required this.post }) : super(key: key);

  @override
  _PostStatsState createState() => _PostStatsState();
}

class _PostStatsState extends State<PostStats> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical:SizeConfig.blockSizeVertical),
              padding: EdgeInsets.all(SizeConfig.blockSizeVertical*0.5),
              decoration: BoxDecoration(
                color: Colors.blue[600],
                shape: BoxShape.circle,
                
              ),
              child: Icon(Icons.thumb_up,color: Colors.white,size: SizeConfig.blockSizeVertical*2,),
            ),
            SizedBox(width: SizeConfig.blockSizeHorizontal*3,),
            Expanded(
              child: Text('${widget.post.likes}' ,
                style: TextStyle(color: Colors.grey,fontSize: SizeConfig.blockSizeVertical*1.5),
              ),
            ),
            SizedBox(width: SizeConfig.blockSizeHorizontal*5,),
            Text('${widget.post.comments} Comments',
              style: TextStyle(color: Colors.grey,fontSize: SizeConfig.blockSizeVertical*1.5),
            ),
            SizedBox(width: SizeConfig.blockSizeHorizontal*5,),
            Text('${widget.post.shares} Shares',
              style: TextStyle(color: Colors.grey,fontSize: SizeConfig.blockSizeVertical*1.5),
            ),
            SizedBox(width: SizeConfig.blockSizeHorizontal*5,),
            const Divider(),

          ],
        )
      ],
    );
  }
}