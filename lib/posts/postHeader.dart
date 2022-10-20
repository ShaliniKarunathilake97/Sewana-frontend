// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:sewana/posts/post.dart';
import 'package:sewana/profile_avatar.dart';
import 'package:sewana/sizeconfig.dart';

class PostHeader extends StatefulWidget {
  final Post post;
  const PostHeader({Key? key, required this.post}) : super(key: key);

  @override
  State<PostHeader> createState() => _PostHeaderState();
}

class _PostHeaderState extends State<PostHeader> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Row(
      children: [
        ProfileAvatar(
          imgUrl: widget.post.user.imgUrl,
          radius: SizeConfig.blockSizeVertical * 4,
        ),
        SizedBox(
          width: SizeConfig.blockSizeHorizontal * 5,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.post.user.userName,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: SizeConfig.blockSizeVertical * 2,
                  fontWeight: FontWeight.w800),
            ),
            Row(
              children: [
                Text(
                  '${widget.post.timeAgo}.',
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: SizeConfig.blockSizeVertical * 1.5),
                ),
                Icon(
                  Icons.public,
                  color: Colors.grey[600],
                  size: SizeConfig.blockSizeVertical * 1.5,
                )
              ],
            )
          ],
        )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_horiz,
              color: Colors.black,
              size: SizeConfig.blockSizeVertical * 3,
            ))
      ],
    );
  }
}
