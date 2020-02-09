import 'package:bancher/data/entities.dart';
import 'package:bancher/data/repository.dart';

class ValidationUseCase {
  Repository _repository;

  ValidationUseCase(Repository repository) {
    _repository = repository;
  }

  void validateRegisteration(
      User user, String repeatedPass, Function onSuccess, Function onError) {
    if (user.getEmail().isNotEmpty &&
        user.getPassWord().isNotEmpty &&
        repeatedPass.isNotEmpty) {
      if (_repository.contains(user.getEmail())) {
        onError('This mail is already Signed up');
      } else if (user.getPassWord() != repeatedPass) {
        onError('Password fileds should match');
      } else {
        onSuccess();
      }
    } else {
      onError('Please complete your info');
    }
  }
}
