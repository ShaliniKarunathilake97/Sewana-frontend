import 'package:sewana/users/user.dart';


class Post{
  late User user;
  String caption = "";
  String timeAgo = "";
  int likes ;
  int comments ;
  int shares ;
  List <String> imgUrls = [];

  Post({required this.user,required this.caption,required this.timeAgo,required this.likes,required this.comments,required this.shares,required this.imgUrls});
}