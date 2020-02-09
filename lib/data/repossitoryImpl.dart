import 'dart:collection';
import 'dart:developer';

import 'package:bancher/data/entities.dart';
import 'package:bancher/data/repository.dart';
import 'dart:io';

class BancherRepository implements Repository {
  //in Memory DB,
  HashMap<String, User> _users = HashMap();
  User loggedinUser;

  @override
  bool contains(String email) {
    return _users[email] != null;
  }

  @override
  void signUpUser(User user, Function onSuccess, Function onError) {
    try {
      _users[user.getEmail().toLowerCase()] = user;
      loggedinUser = user;
      onSuccess(); //mocking success
    } catch (e) {
      //mocking error
      onError('Something went wrong!');
    }
  }

  @override
  bool isLoggedIn() {
    return loggedinUser != null;
  }

  @override
  bool isAuthorizeduser(String email, String pass) {
    return _users[email] != null &&
        _users[email.toLowerCase()].getPassWord() == pass;
  }

  @override
  void logout() {
    loggedinUser = null;
  }

  @override
  loggedInUser() {
    return loggedinUser;
  }

  @override
  void login(String email, String pass, Function onsuccess, Function onError) {
    try {
      loggedinUser = _users[email];
      onsuccess();
    } catch (e) {
      onError('Something went wrong!');
    }
  }
}
