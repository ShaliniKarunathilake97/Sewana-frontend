import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:sewana/data.dart';
import 'package:sewana/posts/create_post.dart';
import 'package:sewana/posts/post.dart';
import 'package:sewana/posts/postList.dart';
import 'package:sewana/posts/post_conatainer.dart';
import 'package:sewana/profile_avatar.dart';
import 'package:sewana/sizeconfig.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool hasInternet = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);

    InternetConnectionChecker().onStatusChange.listen((status) {
      final hasInternet = status == InternetConnectionStatus.connected;
      setState(() => this.hasInternet = hasInternet);
    });
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: SizeConfig.blockSizeVertical * 10,
          elevation: 0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          // actions: [
          //   IconButton(
          //     onPressed: (){},
          //     icon: Icon(Icons.post_add,color: const Color(0XFF4C5359),size: SizeConfig.blockSizeVertical*4,)
          //     )
          // ],
          title: Row(
            children: [
              ProfileAvatar(
                imgUrl: currentUser.imgUrl,
                isActive: true,
                radius: SizeConfig.blockSizeVertical * 4,
              ),
              SizedBox(
                width: SizeConfig.blockSizeHorizontal * 16,
              ),
              TextButton(
                  onPressed: () {
                    hasInternet
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CreatePost()))
                        : const LoadingIndicator(
                            indicatorType: Indicator.ballGridPulse);
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.grey.shade300),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            SizeConfig.blockSizeVertical * 3),
                      ))),
                  child: Text(
                    'Post here',
                    style: TextStyle(
                        color: const Color(0XFF4C5359),
                        fontSize: SizeConfig.blockSizeVertical * 2),
                  )),
              SizedBox(
                width: SizeConfig.blockSizeHorizontal * 20,
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.photo_library,
                    color: const Color(0XFF4C5359),
                    size: SizeConfig.blockSizeVertical * 4,
                  ))
            ],
          ),
          bottom: TabBar(
            indicatorColor: Colors.transparent,
            controller: _tabController,
            tabs: [
              Container(
                  // margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical),
                  height: SizeConfig.blockSizeVertical * 5,
                  decoration: BoxDecoration(
                      color: _tabController.index == 0
                          ? Colors.grey[400]
                          : Colors.white,
                      borderRadius: BorderRadius.circular(
                          SizeConfig.blockSizeVertical * 3),
                      border: Border.all(color: const Color(0XFF4C5359))),
                  width: double.infinity,
                  child: PhysicalModel(
                      color: _tabController.index == 0
                          ? const Color(0XFF4C5359)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(
                          SizeConfig.blockSizeVertical * 3),
                      shadowColor: Colors.grey.shade400,
                      elevation: 5,
                      child: Tab(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/cat.svg',
                            width: SizeConfig.blockSizeVertical * 2.5,
                            height: SizeConfig.blockSizeVertical * 2.5,
                            color: _tabController.index == 0
                                ? Colors.white
                                : const Color(0XFF4C5359),
                          ),
                          Text(
                            ' Cats',
                            style: TextStyle(
                              fontSize: SizeConfig.blockSizeVertical * 1.8,
                              color: _tabController.index == 0
                                  ? Colors.white
                                  : const Color(0XFF4C5359),
                            ),
                          ),
                        ],
                      )))),
              Container(
                  // margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical),
                  height: SizeConfig.blockSizeVertical * 5,
                  decoration: BoxDecoration(
                      color: _tabController.index == 1
                          ? const Color(0XFF4C5359)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(
                          SizeConfig.blockSizeVertical * 3),
                      border: Border.all(color: const Color(0XFF4C5359))),
                  width: double.infinity,
                  child: PhysicalModel(
                      color: _tabController.index == 1
                          ? const Color(0XFF4C5359)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(
                          SizeConfig.blockSizeVertical * 3),
                      shadowColor: Colors.grey.shade400,
                      elevation: 5,
                      child: Tab(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/dog.svg',
                            width: SizeConfig.blockSizeVertical * 2.5,
                            height: SizeConfig.blockSizeVertical * 2.5,
                            color: _tabController.index == 1
                                ? Colors.white
                                : const Color(0XFF4C5359),
                          ),
                          Text(
                            ' Dogs',
                            style: TextStyle(
                              fontSize: SizeConfig.blockSizeVertical * 1.8,
                              color: _tabController.index == 1
                                  ? Colors.white
                                  : const Color(0XFF4C5359),
                            ),
                          ),
                        ],
                      )))),
              Container(
                  margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical),
                  // width: SizeConfig.blockSizeHorizontal*25,
                  height: SizeConfig.blockSizeVertical * 5,
                  decoration: BoxDecoration(
                      color: _tabController.index == 2
                          ? const Color(0XFF4C5359)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(
                          SizeConfig.blockSizeVertical * 3),
                      border: Border.all(color: const Color(0XFF4C5359))),
                  width: double.infinity,
                  child: PhysicalModel(
                      color: _tabController.index == 2
                          ? const Color(0XFF4C5359)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(
                          SizeConfig.blockSizeVertical * 3),
                      shadowColor: Colors.grey.shade400,
                      elevation: 5,
                      child: Tab(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.pets,
                            color: _tabController.index == 2
                                ? Colors.white
                                : const Color(0XFF4C5359),
                            size: SizeConfig.blockSizeVertical * 2.5,
                          ),
                          Text(
                            'Others',
                            style: TextStyle(
                              fontSize: SizeConfig.blockSizeVertical * 1.8,
                              color: _tabController.index == 2
                                  ? Colors.white
                                  : const Color(0XFF4C5359),
                            ),
                          ),
                        ],
                      )))),
            ],
          ),
        ),
        body: ListView.builder(
            itemCount: postList.length,
            itemBuilder: (context, index) {
              final Post post = postList[index];
              return post_container(post: post);
            }),
        // body: CustomScrollView(
        //   slivers: [
        //      SliverList(
        //       delegate: SliverChildBuilderDelegate(
        //       (context,index){
        //         final Post post = postList[index];
        //         return post_container(post: post);
        //         },
        //         childCount:postList.length,

        //       )
        //       ),
        //   ],

        // ),
        // floatingActionButton: SizedBox(
        //   height: SizeConfig.blockSizeVertical*8,
        //   width: SizeConfig.blockSizeVertical*8,
        //   child: FittedBox(
        //     fit: BoxFit.contain,
        //     child: FloatingActionButton(
        //       backgroundColor: const Color(0XFF4C5359),
        //       onPressed: (){},
        //       child: Center(child: Column(
        //         //crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //           Icon(Icons.add,color: Colors.white,size: SizeConfig.blockSizeVertical*4,),
        //           Text('Post',style: TextStyle(color: Colors.white,fontSize: SizeConfig.blockSizeVertical*2),),

        //         ],
        //       )),
        //     ),),
        // ),
      ),
    );
  }
}
