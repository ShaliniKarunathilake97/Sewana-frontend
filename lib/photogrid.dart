import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sewana/sizeconfig.dart';

class PhotoGrid extends StatefulWidget {
  final int maxImages;
  final List<String> imgUrls;
  final Function(int) onImageClicked;
  final Function onExpandClicked;
  const PhotoGrid({ Key? key,
    this.maxImages = 2,
    required this.imgUrls,
    required this.onImageClicked,
    required this.onExpandClicked
      }) : super(key: key);

  @override
  _PhotoGridState createState() => _PhotoGridState();
}

class _PhotoGridState extends State<PhotoGrid> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

  var images = buildImages();

    return GridView(
      primary: false,
      scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent:SizeConfig.screenWidth/2 ,
        crossAxisSpacing: SizeConfig.blockSizeVertical,
        //mainAxisExtent: SizeConfig.screenWidth,
        ),
        children: images,
    );
  }
  List<Widget> buildImages(){
    int numImages = widget.imgUrls.length;
    return List<Widget>.generate(min(numImages, widget.maxImages),(index){
      String imgUrl = widget.imgUrls[index];
      if(index == widget.maxImages-1){
        int remaining = numImages - widget.maxImages;
        if(remaining == 0){
          return GestureDetector(
            child: InkWell(
              splashColor: Colors.grey,
              child: Image.network(
                imgUrl,
                fit: BoxFit.cover,
              ),
            ),
            onTap: ()=>widget.onImageClicked(index),
          );
        }
        else{
          return InkWell(
            onTap: ()=>widget.onExpandClicked(),
            child: Ink(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(imgUrl,fit: BoxFit.cover,),
                  Positioned.fill(
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.black26,
                      child: Text('+' +remaining.toString(),
                      style: TextStyle(fontSize: SizeConfig.blockSizeVertical*4,color: Colors.white),
                      ),
                    )
                    )
                ],
              ),
            ),
          );
        }
      }
      else{
        return GestureDetector(
          child: InkWell(
            splashColor: Colors.grey,
            child: Image.network(
              imgUrl,
              fit: BoxFit.cover,
            ),
          ),
          onTap: ()=>widget.onImageClicked(index),
        );
      }
    }
    );
  }
}