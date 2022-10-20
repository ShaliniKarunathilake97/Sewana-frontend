// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:sewana/sizeconfig.dart';

class PostButton extends StatefulWidget {
  final Icon icon;
  final String label;
  final VoidCallback onTap;
  const PostButton({ Key? key,required this.icon,required this.label,required this.onTap}) : super(key: key);

  @override
  _PostButtonState createState() => _PostButtonState();
}

class _PostButtonState extends State<PostButton> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal*5),
        child: Row(
          children: [
            widget.icon,
            SizedBox(width: SizeConfig.blockSizeHorizontal*3,),
            Text(widget.label)
          ],
        ),
      ),
    );
  }
}