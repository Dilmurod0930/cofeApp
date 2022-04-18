import 'package:coffeapp/core/constants/color_const.dart';
import 'package:coffeapp/core/constants/font_const.dart';
import 'package:coffeapp/core/widget/my_appbar_widget.dart';
import 'package:coffeapp/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        context: context,
        title: "Login",
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.23,
                child: Lottie.asset('assets/lottie/cofee.json'),
              ),
              Form(
                key: context.watch<LoginProvider>().fromKey,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller:
                            context.watch<LoginProvider>().emailCoontroller,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                          hintText: 'Email',
                        ),
                      ),
                      const SizedBox(height: 13),
                      TextFormField(
                        controller:
                            context.watch<LoginProvider>().passwordCoontroller,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                          hintText: 'Passwor',
                        ),
                      ),
                      const SizedBox(height: 13),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.063,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: const BoxDecoration(
                            color: ColorConst.kButtonColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: TextButton(
                          child: const Text('Login In'),
                          onPressed: () {
                            context.read<LoginProvider>().singIn(context);
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Text(""),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/creatAccount', (route) => false);
                            },
                            child: Text(
                              'Create account',
                              style: TextStyle(
                                  color: ColorConst.kButtonColor,
                                  fontSize: FontConst.kLargeFont),
                            ),
                          ),
                        ],
                      ),
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
}
