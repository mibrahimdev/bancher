import 'package:bancher/data/repository.dart';

class LoginUsecase {
  Repository _repository;

  LoginUsecase(Repository repository) {
    _repository = repository;
  }

  void login(String email, String pass, Function onsuccess, Function onError) {
    if (_repository.contains(email)) {
      if (_repository.isAuthorizeduser(email, pass)) {
       _repository.login(email, pass, onsuccess, onError);
      } else {
        onError('wrong password');
      }
    } else {
      onError('non registered email');
    }
  }
}
