import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sewana/data.dart';
import 'package:sewana/sizeconfig.dart';

class ProfileAvatar extends StatefulWidget {
  final String imgUrl;
  final double radius;
  final bool isActive;
  const ProfileAvatar({
    Key? key,
    required this.imgUrl,
    required this.radius,
    this.isActive = false,
  }) : super(key: key);

  @override
  State<ProfileAvatar> createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CircleAvatar(
        radius: widget.radius,
        backgroundImage: CachedNetworkImageProvider(widget.imgUrl),
      ),
      widget.isActive
          ? Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                height: SizeConfig.blockSizeVertical * 2,
                width: SizeConfig.blockSizeVertical * 2,
                decoration: BoxDecoration(
                    color: Colors.green[500],
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Colors.white)),
              ))
          : const SizedBox.shrink(),
    ]);
  }
}
