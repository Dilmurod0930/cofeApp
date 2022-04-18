import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffeapp/service/firebase/firebase_service.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class CoffeeUploadProvider extends ChangeNotifier {
  Future uploadCoffeeToFirebasStore(name, price, context) async {
    await FireBaseServise.stor.collection("coffee").doc(name).set({
      "name": name,
      "price": price,
      "image_url": "",
      "create_at": FieldValue.serverTimestamp(),
    });
    Navigator.pop(context);
  }

  Future uploadImageToStorge(XFile file, name) async {
    var image = await FireBaseServise.storage
        .ref()
        .child("coffee")
        .child("images")
        .child(name)
        .putFile(File(file.path));
    String dowloadUrl = await image.ref.getDownloadURL();
    var data = await FireBaseServise.stor.collection("coffee").doc(name).set(
      {"image_url": dowloadUrl},
      SetOptions(merge: true),
    );
  }
}
