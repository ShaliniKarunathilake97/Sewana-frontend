import 'package:flutter/material.dart';
import 'package:sewana/pages/account.dart';
import 'package:sewana/pages/home.dart';
import 'package:sewana/posts/post.dart';
import 'package:sewana/posts/postList.dart';
import 'package:sewana/posts/post_conatainer.dart';
import 'package:sewana/sizeconfig.dart';

class test_main extends StatefulWidget {
  const test_main({Key? key}) : super(key: key);

  @override
  _test_mainState createState() => _test_mainState();
}

class _test_mainState extends State<test_main>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  SliverAppBar showSliverAppBar(String screenTitle) {
    return SliverAppBar(
      forceElevated: true,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      floating: true,
      pinned: true,
      snap: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(SizeConfig.blockSizeVertical * 3),
          bottomRight: Radius.circular(SizeConfig.blockSizeVertical * 3),
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: const Color(0XFF4C5359),
              size: SizeConfig.blockSizeVertical * 4,
            )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: const Color(0XFF4C5359),
              size: SizeConfig.blockSizeVertical * 4,
            ))
      ],
      title: Row(
        children: [
          Icon(Icons.pets,
              color: const Color(0XFF4C5359),
              size: SizeConfig.blockSizeVertical * 4),
          Text(
            'Sewana',
            style: TextStyle(
                fontSize: SizeConfig.blockSizeVertical * 4,
                color: const Color(0XFF4C5359),
                fontFamily: 'Roboto-Condensed'),
          ),
        ],
      ),
      bottom: TabBar(
        controller: _tabController,
        indicatorColor: Colors.transparent,
        labelColor: const Color(0XFF4C5359),
        unselectedLabelColor: Colors.grey,
        tabs: [
          Tab(
            icon: Icon(
              Icons.home,
              color: _tabController.index == 0
                  ? const Color(0XFF4C5359)
                  : Colors.grey,
              size: SizeConfig.blockSizeVertical * 4,
            ),
            text: 'Home',
          ),
          Tab(
            icon: Icon(
              Icons.chat,
              color: _tabController.index == 0
                  ? const Color(0XFF4C5359)
                  : Colors.grey,
              size: SizeConfig.blockSizeVertical * 4,
            ),
            text: 'Chat',
          ),
          Tab(
            icon: Icon(
              Icons.person,
              color: _tabController.index == 1
                  ? const Color(0XFF4C5359)
                  : Colors.grey,
              size: SizeConfig.blockSizeVertical * 4,
            ),
            text: 'Account',
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: TabBarView(controller: _tabController, children: [
          CustomScrollView(
            slivers: [
              showSliverAppBar('Home'),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final Post post = postList[index];
                  return post_container(post: post);
                },
                childCount: postList.length,
              ))
            ],
          ),
          CustomScrollView(
            slivers: [
              showSliverAppBar('Account'),
              // Container(color: Colors.green,)
              //Account()
            ],
          )
        ]),
      ),
    );
  }
}
