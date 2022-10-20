import 'package:flutter/material.dart';
import 'package:sewana/sizeconfig.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({ Key? key }) : super(key: key);

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text('Create post',
          style: TextStyle(color: const Color(0XFF4C5359),fontSize: SizeConfig.blockSizeVertical*2.5),
        ),
        actions: [
          TextButton(onPressed: (){}, 
          child: Text('POST',
          style: TextStyle(color: const Color(0XFF4C5359),fontSize: SizeConfig.blockSizeVertical*2.5,fontWeight: FontWeight.w500),
          ))
        ],
      ),
    );
  }
}