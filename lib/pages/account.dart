import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sewana/profile_avatar.dart';
import 'package:sewana/refresh_widget.dart';
import 'package:sewana/static/values.dart';
import 'package:sewana/users/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../sizeconfig.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  User user = User(userName: "", imgUrl: "", contactInfo: "");

  @override
  void initState() {
    getInfo();
    super.initState();
  }

  Future getInfo() async {
    var url = Uri.parse('$apiUrl/user/userInfo');

    SharedPreferences preferences = await SharedPreferences.getInstance();
    var t = preferences.getString('accessToken');
    print(t);
    var response = await http.get(url, headers: {'Authorization': 'Bearer $t'});
    var Data = jsonDecode(response.body);
    var jsonData = Data['user'];
    print(jsonData);
    if (mounted) {
      setState(() {
        user = User(
            userName: jsonData['fullName'],
            imgUrl: jsonData['profileImage'],
            contactInfo: jsonData['emailOrTP'],
            public_id: jsonData['public_id']);
      });
    }
    // print(jsonData);
  }

  Future<User> getUserInfo() async {
    await Future.delayed(const Duration(seconds: 1));
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: FutureBuilder(
            future: getUserInfo(),
            builder: (context, AsyncSnapshot snap) {
              if (snap.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snap.hasData) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(children: [
                          ProfileAvatar(
                            imgUrl: user.imgUrl,
                            radius: SizeConfig.blockSizeVertical * 7,
                          ),
                          Positioned(
                            left: SizeConfig.blockSizeVertical * 8,
                            top: SizeConfig.blockSizeVertical * 8,
                            child: Container(
                              width: SizeConfig.blockSizeVertical * 5,
                              height: SizeConfig.blockSizeVertical * 5,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: const Color(0XFF4C5359),
                                  ),
                                  color: Colors.white),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.camera_alt,
                                    size: SizeConfig.blockSizeVertical * 3,
                                    color: const Color(0XFF4C5359),
                                  )),
                            ),
                          )
                        ]),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical * 2,
                    ),
                    Divider(
                      thickness: 1,
                      indent: SizeConfig.blockSizeHorizontal * 5,
                      endIndent: SizeConfig.blockSizeHorizontal * 5,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: SizeConfig.blockSizeHorizontal * 4,
                          top: SizeConfig.blockSizeVertical * 2,
                          bottom: SizeConfig.blockSizeVertical * 2),
                      child: Text(
                        'Name',
                        style: TextStyle(
                            color: const Color(0XFF4C5359),
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.blockSizeVertical * 2.5),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: SizeConfig.blockSizeHorizontal * 8,
                          right: SizeConfig.blockSizeHorizontal * 8,
                          bottom: SizeConfig.blockSizeVertical * 1.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: SizeConfig.blockSizeVertical * 5,
                                height: SizeConfig.blockSizeVertical * 5,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.grey),
                                child: Icon(
                                  Icons.person,
                                  color: const Color(0XFF4C5359),
                                  size: SizeConfig.blockSizeVertical * 4,
                                ),
                              ),
                              SizedBox(
                                width: SizeConfig.blockSizeHorizontal * 3,
                              ),
                              Text(
                                snap.data.userName,
                                style: TextStyle(
                                    color: const Color(0XFF4C5359),
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 2.5),
                              ),
                            ],
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.edit,
                                size: SizeConfig.blockSizeVertical * 3,
                                color: Colors.grey,
                              ))
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      indent: SizeConfig.blockSizeHorizontal * 5,
                      endIndent: SizeConfig.blockSizeHorizontal * 5,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: SizeConfig.blockSizeHorizontal * 4,
                          top: SizeConfig.blockSizeVertical * 2,
                          bottom: SizeConfig.blockSizeVertical * 2),
                      child: Text(
                        'Contact Info',
                        style: TextStyle(
                            color: const Color(0XFF4C5359),
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.blockSizeVertical * 2.5),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: SizeConfig.blockSizeHorizontal * 8,
                          right: SizeConfig.blockSizeHorizontal * 8,
                          bottom: SizeConfig.blockSizeVertical * 1.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: SizeConfig.blockSizeVertical * 5,
                                height: SizeConfig.blockSizeVertical * 5,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.grey),
                                child: Icon(
                                  Icons.phone,
                                  color: const Color(0XFF4C5359),
                                  size: SizeConfig.blockSizeVertical * 4,
                                ),
                              ),
                              SizedBox(
                                width: SizeConfig.blockSizeHorizontal * 3,
                              ),
                              Text(
                                snap.data.contactInfo,
                                style: TextStyle(
                                    color: const Color(0XFF4C5359),
                                    fontSize:
                                        SizeConfig.blockSizeVertical * 2.5),
                              ),
                            ],
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.edit,
                                size: SizeConfig.blockSizeVertical * 3,
                                color: Colors.grey,
                              ))
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      indent: SizeConfig.blockSizeHorizontal * 5,
                      endIndent: SizeConfig.blockSizeHorizontal * 5,
                    ),
                  ],
                );
              } else {
                return const Center(child: Text('No data'));
              }
            }),
      ),
    );
  }
}
