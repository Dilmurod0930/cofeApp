
import 'package:coffeapp/core/components/theme_comp.dart';
import 'package:coffeapp/provider/coffee_upload_provider.dart';
import 'package:coffeapp/provider/login_provider.dart';
import 'package:coffeapp/provider/route_provider.dart';
import 'package:coffeapp/routes/my_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RoutesProvifder()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => CoffeeUploadProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _routes = MyRoute();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coffee',
      theme: ThemeComp.myTheme,
      initialRoute: context.watch<RoutesProvifder>().route,
      onGenerateRoute: _routes.myRoutes,
    );
  }
}
