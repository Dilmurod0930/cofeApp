import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffeapp/Pages/Location/get_location.dart';
import 'package:coffeapp/core/constants/color_const.dart';
import 'package:coffeapp/core/widget/snakbar_widget.dart';
import 'package:coffeapp/service/firebase/firebase_service.dart';
import 'package:flutter/widgets.dart';
import 'package:geocoder/geocoder.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController emailCoontroller = TextEditingController();
  TextEditingController passwordCoontroller = TextEditingController();
  TextEditingController nameCoontroller = TextEditingController();
  TextEditingController phoneCoontroller = TextEditingController();
  GlobalKey<FormState> fromKey = GlobalKey<FormState>();

  Future singIn(BuildContext context) async {
    try {
      if (fromKey.currentState!.validate()) {
        await FireBaseServise.auth.signInWithEmailAndPassword(
            email: emailCoontroller.text, password: passwordCoontroller.text);
        if (emailCoontroller.text == "admin@gmail.com" &&
            passwordCoontroller.text == "admin2002") {
          Navigator.pushNamedAndRemoveUntil(
              context, '/admin', (route) => false);
        } else {
          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        }
      } else {
        SnakBarWidget.mymessger(context, 'Fill ol ', ColorConst.kSnakBarColor);
      }
    } catch (e) {
      SnakBarWidget.mymessger(
          context, 'Eror while sign in $e ', ColorConst.kSnakBarColor);
    }
  }

  Future singUp(BuildContext context) async {
    try {
      if (fromKey.currentState!.validate()) {
        await FireBaseServise.auth.createUserWithEmailAndPassword(
            email: emailCoontroller.text, password: passwordCoontroller.text);
        var location = await GetLocation.determinePosition();
        var adress = await Geocoder.local.findAddressesFromCoordinates(
          Coordinates(location.latitude, location.longitude),
        );

        await FireBaseServise.stor
            .collection("users")
            .doc(emailCoontroller.text)
            .set(
          {
            "name": nameCoontroller,
            "email": emailCoontroller.text,
            "phone": passwordCoontroller,
            "create_at": FieldValue.serverTimestamp(),
            "orders": [],
            "location": adress[0].addressLine,
          },
        );
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      } else {
        SnakBarWidget.mymessger(context, 'Fill ol ', ColorConst.kSnakBarColor);
      }
    } catch (e) {
      SnakBarWidget.mymessger(
          context, 'Eror while sign in $e ', ColorConst.kSnakBarColor);
    }
  }

  Future signOut(BuildContext context) async {
    try {
      await FireBaseServise.auth.signOut();
      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
    } catch (e) {
      SnakBarWidget.mymessger(
          context, "Siz tizimdan chiqib ketinggiz ", ColorConst.kSnakBarColor);
    }
  }
}
