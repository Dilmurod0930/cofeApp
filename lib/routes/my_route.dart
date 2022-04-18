import 'package:coffeapp/Pages/Admin/admin_page.dart';
import 'package:coffeapp/Pages/Login/login_page.dart';
import 'package:coffeapp/Pages/Login/signUp_page.dart';
import 'package:coffeapp/Pages/home/home_page.dart';
import 'package:coffeapp/Pages/screens/card_page.dart';
import 'package:flutter/material.dart';

class MyRoute {
  Route? myRoutes(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case "/home":
        return MaterialPageRoute(builder: (context) => HomePage());
      case "/login":
        return MaterialPageRoute(builder: (context) => LoginPage());
      case "/creatAccount":
        return MaterialPageRoute(builder: (context) => SignUpPage());
      case "/card":
        return MaterialPageRoute(builder: (context) => CardPage());
      case "/admin":
        return MaterialPageRoute(builder: (context) => AdminPage());
    }
  }
}
