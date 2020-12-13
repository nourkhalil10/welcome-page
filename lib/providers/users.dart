import 'package:flutter/foundation.dart';

class UserData {
  final String name;
  final String age;
  final String email;
  final String profileImageLink;

  UserData({
    @required this.name,
    @required this.age,
    @required this.email,
    @required this.profileImageLink,
  });
}

class UsersProvider with ChangeNotifier {
  List<UserData> _user = [];

  List<UserData> get user {
    return [..._user];
  }

  void addUser(String name, String email, String age, String imageLink) {
    _user.add(
      UserData(
        name: name,
        age: age,
        email: email,
        profileImageLink: imageLink,
      ),
    );
    notifyListeners();
  }
}
