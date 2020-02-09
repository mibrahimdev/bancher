import 'package:bancher/data/entities.dart';
import 'package:bancher/data/repository.dart';
import 'package:bancher/domain/validation.dart';

class SignupUsecase {
  Repository _repository;

  SignupUsecase(Repository repository) {
    _repository = repository;
  }

  void signup(User user, Function onSuccess, Function onError) {
    _repository.signUpUser(user, onSuccess, onError);
  }
}
