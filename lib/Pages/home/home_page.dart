import 'package:coffeapp/core/widget/my_appbar_widget.dart';
import 'package:coffeapp/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Coffee",
        context: context,
        function: () {
          context.read<LoginProvider>().signOut(context);
        },
      ),
    );
  }
}
