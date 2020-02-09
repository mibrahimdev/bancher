class User {
  String _email;
  String _name;
  String _pass; //This is not real, we don't save our users passwords ^^
  bool _isAdriver;

  User(String email, String name, String pass, bool isAdriver) {
    this._email = email;
    this._name = name;
    this._pass = pass;
    this._isAdriver = isAdriver;
  }

  String getEmail() {
    return _email;
  }

  String getName() {
    return _name;
  }

  String getPassWord() {
    return _pass;
  }

  bool isAdriver() {
    return _isAdriver;
  }
}