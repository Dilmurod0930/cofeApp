import 'package:coffeapp/core/constants/color_const.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize =>
      Size.fromHeight(MediaQuery.of(context).size.height * 0.08);

  final String title;
  final Color? color;
  final BuildContext context;
  final VoidCallback? function;
  final IconData? icon;

  MyAppBar(
      {Key? key,
      required this.title,
      this.color = ColorConst.kPrimaryColor,
      required this.context,
      this.function,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(title,style: const  TextStyle(fontSize: 33),),
      actions: [
        function != null
            ? IconButton(
                onPressed: function,
                icon: Icon(  icon != null ? icon : Icons.logout))
            : const SizedBox()
      ],
    );
  }
}
