import 'package:bancher/data/entities.dart';

class Repository {
  bool contains(String email) {}

  bool isLoggedIn() {}

  bool isAuthorizeduser(String email, String pass) {}

  void signUpUser(User user, Function onSuccess, Function onError) {}

  void logout() {}

  User loggedInUser() {}

  void login(String email, String pass, Function onsuccess, Function onError) {}
}
