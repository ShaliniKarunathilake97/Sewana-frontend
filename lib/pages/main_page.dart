import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sewana/pages/account.dart';
import 'package:sewana/pages/chat.dart';
import 'package:sewana/pages/home.dart';
import 'package:sewana/posts/post.dart';
import 'package:sewana/posts/postList.dart';
import 'package:sewana/posts/post_conatainer.dart';
import 'package:sewana/sizeconfig.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
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

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(SizeConfig.blockSizeVertical * 3),
            bottomRight: Radius.circular(SizeConfig.blockSizeVertical * 3),
          ),
        ),
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
        //   title: SvgPicture.asset(
        // 'assets/logo.svg',
        // height: SizeConfig.blockSizeVertical*7,

        // ),
        centerTitle: false,

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
                color: _tabController.index == 1
                    ? const Color(0XFF4C5359)
                    : Colors.grey,
                size: SizeConfig.blockSizeVertical * 4,
              ),
              text: 'Chat',
            ),

            // Text(
            //   'Home',
            //   style: TextStyle(
            //     fontSize: SizeConfig.blockSizeVertical*2,
            //     color: _tabController.index ==0? const Color(0XFF4C5359):Colors.grey
            //   ),)
            Tab(
              icon: Icon(
                Icons.person,
                color: _tabController.index == 2
                    ? const Color(0XFF4C5359)
                    : Colors.grey,
                size: SizeConfig.blockSizeVertical * 4,
              ),
              text: 'Account',
            )
          ],
        ),
      ),

      // backgroundColor: Colors.white,

      body: TabBarView(
          controller: _tabController,
          children: const [Home(), Chat(), Account()]),
    );
  }
}
