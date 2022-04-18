import 'package:coffeapp/core/constants/color_const.dart';
import 'package:coffeapp/core/widget/my_appbar_widget.dart';
import 'package:coffeapp/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Sign Up ",
        context: context,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.33,
                  child: Lottie.asset('assets/lottie/signup.json')),
              Form(
                key: context.watch<LoginProvider>().fromKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller:
                            context.watch<LoginProvider>().nameCoontroller,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                          hintText: 'Name',
                        ),
                      ),
                      const SizedBox(height: 12),
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
                      const SizedBox(height: 12),
                      TextFormField(
                        controller:
                            context.watch<LoginProvider>().phoneCoontroller,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                          hintText: 'Phone',
                        ),
                      ),
                      const SizedBox(height: 12),
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
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.063,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: const BoxDecoration(
                  color: ColorConst.kButtonColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(32),
                  ),
                ),
                child: TextButton(
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    context.read<LoginProvider>().singUp(context);
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login', (route) => false);
                },
                child: const Text(
                  "Sign In",
                  style: TextStyle(
                    color: ColorConst.kButtonColor,
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
    