import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sewana/pages/main_page.dart';
import 'package:sewana/pages/test_main.dart';
import 'package:sewana/signup.dart';
import 'package:sewana/sizeconfig.dart';
import 'package:http/http.dart' as http;
import 'package:sewana/static/globals.dart';
import 'package:sewana/static/values.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late bool isPwdHidden;

  String emailorTP = "";
  String pwd = "";

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  void navigateToHome() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const MainPage()));
  }

  signIn() async {
    if (_formkey.currentState!.validate()) {
      var url = Uri.parse('$apiUrl/userSignin');
      var response = await http.post(url, body: {
        'emailOrTP': emailorTP,
        'password': pwd,
      });
      var data = await jsonDecode(response.body);
      print('token:${data['token']}');
      if (data['success'] == true) {
        setLogState();
        setToken(data['token']);
        navigateToHome();
      } else {
        print('failed');
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isPwdHidden = true;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        //backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                right: 0,
                child: SvgPicture.asset(
                  'assets/Paw.svg',
                  height: SizeConfig.blockSizeVertical * 30,
                  width: SizeConfig.blockSizeVertical * 30,
                  color: Colors.black,
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  margin:
                      EdgeInsets.only(top: SizeConfig.blockSizeVertical * 15),
                  child: SingleChildScrollView(
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: SizeConfig.blockSizeHorizontal * 5),
                          width: SizeConfig.screenWidth,
                          color: Colors.transparent,
                          child: Text(
                            'Sign in to your account',
                            style: TextStyle(
                              color: const Color(0XFF4C5359),
                              fontSize: SizeConfig.blockSizeVertical * 5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical * 4,
                        ),
                        Center(
                          child: SizedBox(
                            //margin: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal*5),
                            width: SizeConfig.blockSizeHorizontal * 80,
                            child: Form(
                                key: _formkey,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      decoration: InputDecoration(
                                          // filled: true,
                                          // fillColor: Color(0XFF4C5359).withOpacity(0.3),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius
                                                  .circular(SizeConfig
                                                          .blockSizeVertical *
                                                      3)),
                                          label: Text('Email or Telephone'),
                                          hintText: 'Email or Telephone'),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Please enter email or telephone number";
                                        }
                                        return null;
                                      },
                                      onChanged: (value) {
                                        emailorTP = value;
                                      },
                                    ),
                                    SizedBox(
                                      height: SizeConfig.blockSizeVertical * 4,
                                    ),
                                    TextFormField(
                                      obscureText: isPwdHidden,
                                      decoration: InputDecoration(
                                          // filled: true,
                                          // fillColor: Color(0XFF4C5359).withOpacity(0.3),
                                          suffixIcon: IconButton(
                                              onPressed: showhidePassword,
                                              icon: Icon(
                                                isPwdHidden
                                                    ? Icons.visibility_off
                                                    : Icons.visibility,
                                                color: Color(0XFF4C5359),
                                              )),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius
                                                  .circular(SizeConfig
                                                          .blockSizeVertical *
                                                      3)),
                                          label: Text('Password'),
                                          hintText: 'Password'),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter password';
                                        }
                                        return null;
                                      },
                                      onChanged: (value) {
                                        pwd = value;
                                      },
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Forgot password?',
                                            style: TextStyle(
                                              color: const Color(0XFF4C5359),
                                              fontSize:
                                                  SizeConfig.blockSizeVertical *
                                                      2,
                                            ),
                                          )),
                                    ),
                                    SizedBox(
                                      height: SizeConfig.blockSizeVertical * 4,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        signIn();
                                      },
                                      child: Text(
                                        'Sign in',
                                        style: TextStyle(
                                            fontSize:
                                                SizeConfig.blockSizeVertical *
                                                    2,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      style: ButtonStyle(
                                          padding: MaterialStateProperty.all(
                                              EdgeInsets.symmetric(
                                                  horizontal: SizeConfig
                                                          .blockSizeHorizontal *
                                                      8,
                                                  vertical: SizeConfig.blockSizeVertical *
                                                      1.5)),
                                          backgroundColor: MaterialStateProperty.all(
                                              const Color(0XFF4C5359)),
                                          shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(
                                                      SizeConfig.blockSizeVertical * 2)))),
                                    ),
                                    SizedBox(
                                      height: SizeConfig.blockSizeVertical * 2,
                                    ),
                                    Text(
                                      'Or sign in with',
                                      style: TextStyle(
                                          fontSize:
                                              SizeConfig.blockSizeVertical * 2,
                                          color: const Color(0XFF4C5359)),
                                    ),
                                    SizedBox(
                                      height: SizeConfig.blockSizeVertical * 2,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                            onPressed: () {},
                                            icon: SvgPicture.asset(
                                                'assets/google.svg')),
                                        SizedBox(
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  10,
                                        ),
                                        IconButton(
                                            onPressed: () {},
                                            icon: SvgPicture.asset(
                                              'assets/fb.svg',
                                              color: Colors.blue.shade800,
                                            )),
                                      ],
                                    ),
                                    Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Don\'t have and account?',
                                            style: TextStyle(
                                                fontSize: SizeConfig
                                                        .blockSizeVertical *
                                                    2,
                                                color: Colors.grey),
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pushReplacement(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const SignUp()));
                                              },
                                              child: Text(
                                                'Sign up',
                                                style: TextStyle(
                                                  color: Color(0XFF4C5359),
                                                  fontSize: SizeConfig
                                                          .blockSizeVertical *
                                                      2,
                                                ),
                                              ))
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showhidePassword() {
    setState(() {
      if (isPwdHidden == true) {
        isPwdHidden = false;
      } else {
        isPwdHidden = true;
      }
    });
  }
}
