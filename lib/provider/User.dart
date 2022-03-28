import 'package:flutter/foundation.dart';
import 'package:trove_challenge/models/User.dart';


class UserProvider extends ChangeNotifier {

  User _user = User(
      "Mehdi Ghayoumi", "assets/mehdi.jpg", "info@bbloan.online", "3108905262", "320 N palm Dr", "BeverlyHills", "CA","90210");

  void selectUser(User drink, bool selected) {

    notifyListeners();
  }

  User get getUser => _user;
}
