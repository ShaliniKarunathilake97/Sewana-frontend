library my_prj.globals;

import 'package:shared_preferences/shared_preferences.dart';

int logState = 0;
String? accessToken;

setToken(String t) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setString('accessToken', t);
  var x = preferences.getString('accessToken');
}

setLogState() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setInt('logState', 1);
  var y = preferences.getInt('logState');
}
