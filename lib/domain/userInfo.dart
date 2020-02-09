import 'package:bancher/data/repository.dart';

class UserInfoUsecase {

  Repository _repository;
  UserInfoUsecase(Repository repository){
    _repository = repository;
  }

  void loadUserInfo(Function info){
    info(_repository.loggedInUser());
  }  
}