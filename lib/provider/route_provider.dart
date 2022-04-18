import 'package:coffeapp/service/firebase/firebase_service.dart';
import 'package:flutter/foundation.dart';

class RoutesProvifder extends ChangeNotifier {
  RoutesProvifder() {
    checkLoginPage();
  }
  String route = '/login';

  checkLoginPage() {
    if (FireBaseServise.auth.currentUser != null) {
      if (FireBaseServise.auth.currentUser!.email == "admin@gmail.com") {
        FireBaseServise.auth.currentUser != null ? '/admin' : '/lodin';
      } else {
        FireBaseServise.auth.currentUser != null ? '/home' : '/lodin';
      }
    }
  }
}
