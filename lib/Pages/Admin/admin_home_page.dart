import 'dart:io';
import 'package:coffeapp/core/constants/color_const.dart';
import 'package:coffeapp/core/constants/font_const.dart';
import 'package:coffeapp/provider/coffee_upload_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class AdminHomepage extends StatelessWidget {
  AdminHomepage({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();
  TextEditingController narxController = TextEditingController();
  XFile? image;
  final _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(flex: 4, child: Container()),
          Expanded(flex: 4, child: Container()),
          Expanded(
            flex: 1,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.0065,
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: const BoxDecoration(
                  color: ColorConst.kButtonColor,
                  borderRadius: BorderRadius.all(Radius.circular(34))),
              child: TextButton(
                child: const Text(
                  "Yangi maxsulot qo'shish",
                  style: TextStyle(
                      color: ColorConst.kPrimaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w900),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(
                        builder: ((context, setState) {
                          return Container(
                            decoration: const BoxDecoration(
                              color: ColorConst.kScaffoldColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                            ),
                            margin: const EdgeInsets.all(15.0),
                            height: MediaQuery.of(context).size.height * 0.6,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: Text(
                                      "Yangi Coffee Qo'shish",
                                      style: TextStyle(
                                          color: ColorConst.kPrimaryColor,
                                          fontSize: 16),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: nameController,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15.0),
                                        ),
                                      ),
                                      hintText: 'Nomi',
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  TextFormField(
                                    controller: narxController,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15.0),
                                        ),
                                      ),
                                      hintText: 'Narxi',
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.15,
                                    width: MediaQuery.of(context).size.width *
                                        0.55,
                                    child: image != null
                                        ? Image.file(File(image!.path))
                                        : Lottie.asset(
                                            'assets/lottie/cofee2.json',
                                          ),
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.06,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        decoration: const BoxDecoration(
                                          color: ColorConst.kButtonColor,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                        ),
                                        child: TextButton(
                                          child: const Text(
                                            'Rasm yuklash',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          onPressed: () async {
                                            image = await _picker.pickImage(
                                                source: ImageSource.gallery);
                                            context
                                                .read<CoffeeUploadProvider>()
                                                .uploadImageToStorge(image!,
                                                    nameController.text);
                                            setState(() {});
                                          },
                                        ),
                                      ),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.06,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        decoration: const BoxDecoration(
                                          color: ColorConst.kButtonColor,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(14),
                                          ),
                                        ),
                                        child: TextButton(
                                          child: const Text(
                                            "Qo'shish",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          onPressed: () {
                                            context
                                                .read<CoffeeUploadProvider>()
                                                .uploadCoffeeToFirebasStore(
                                                    nameController.text,
                                                    narxController.text,
                                                    context);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
