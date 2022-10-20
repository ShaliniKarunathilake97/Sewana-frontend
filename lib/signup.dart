import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sewana/pages/main_page.dart';
import 'package:sewana/signin.dart';
import 'package:sewana/sizeconfig.dart';
import 'package:sewana/static/globals.dart';
import 'package:sewana/static/values.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late bool isPwdHidden;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isPwdHidden = true;
  }

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String fullName = "";
  String emailorTP = "";
  String pwd = "";

  void navigateToHome() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const MainPage()));
  }

  signUp() async {
    if (_formkey.currentState!.validate()) {
      var url = Uri.parse('$apiUrl/userSignup');
      var response = await http.post(url, body: {
        'fullName': fullName,
        'emailOrTP': emailorTP,
        'password': pwd,
      });
      var data = await jsonDecode(response.body);

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
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 5),
                        width: SizeConfig.screenWidth,
                        color: Colors.transparent,
                        child: Text(
                          'Create an account',
                          style: TextStyle(
                            color: Color(0XFF4C5359),
                            fontSize: SizeConfig.blockSizeVertical * 5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 4,
                      ),
                      Center(
                        child: Container(
                          //margin: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal*5),
                          width: SizeConfig.blockSizeHorizontal * 80,
                          child: Form(
                              key: _formkey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                SizeConfig.blockSizeVertical *
                                                    3)),
                                        label: Text('Full name'),
                                        hintText: 'Full name'),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter full name';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      fullName = value;
                                    },
                                  ),
                                  SizedBox(
                                    height: SizeConfig.blockSizeVertical * 4,
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                SizeConfig.blockSizeVertical *
                                                    3)),
                                        label: Text('Email or Telephone'),
                                        hintText: 'Email or Telephone'),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter email or telephone number';
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
                                        suffixIcon: IconButton(
                                            onPressed: showhidePassword,
                                            icon: Icon(
                                              isPwdHidden
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                              color: const Color(0XFF4C5359),
                                            )),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                SizeConfig.blockSizeVertical *
                                                    3)),
                                        label: Text('Password'),
                                        hintText: 'Password'),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please enter password";
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      pwd = value;
                                    },
                                  ),

                                  SizedBox(
                                    height: SizeConfig.blockSizeVertical * 4,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      signUp();
                                    },
                                    child: Text(
                                      'Sign up',
                                      style: TextStyle(
                                          fontSize:
                                              SizeConfig.blockSizeVertical * 2,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    style: ButtonStyle(
                                        padding: MaterialStateProperty.all(
                                            EdgeInsets.symmetric(
                                                horizontal: SizeConfig
                                                        .blockSizeHorizontal *
                                                    8,
                                                vertical:
                                                    SizeConfig.blockSizeVertical *
                                                        1.5)),
                                        backgroundColor: MaterialStateProperty.all(
                                            Color(0XFF4C5359)),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(
                                                    SizeConfig.blockSizeVertical * 2)))),
                                  ),
                                  // SizedBox(height: SizeConfig.blockSizeVertical*4,),
                                  SizedBox(
                                    height: SizeConfig.blockSizeVertical * 2,
                                  ),
                                  Text(
                                    'Or sign up with',
                                    style: TextStyle(
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 2,
                                        color: const Color(0XFF4C5359)),
                                  ),
                                  SizedBox(
                                    height: SizeConfig.blockSizeVertical * 2,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: SvgPicture.asset(
                                              'assets/google.svg')),
                                      SizedBox(
                                        width:
                                            SizeConfig.blockSizeHorizontal * 10,
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
                                          'Already have an account?',
                                          style: TextStyle(
                                              fontSize:
                                                  SizeConfig.blockSizeVertical *
                                                      2,
                                              color: Colors.grey),
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const SignIn()));
                                            },
                                            child: Text(
                                              'Sign in',
                                              style: TextStyle(
                                                color: Color(0XFF4C5359),
                                                fontSize: SizeConfig
                                                        .blockSizeVertical *
                                                    2,
                                              ),
                                            ))
                                      ],
                                    ),
                                  )
                                ],
                              )),
                        ),
                      )
                    ],
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
