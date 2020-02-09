import 'package:bancher/data/repository.dart';
import 'package:bancher/data/repossitoryImpl.dart';
import 'package:bancher/domain/login.dart';
import 'package:bancher/domain/logout.dart';
import 'package:bancher/domain/signup.dart';
import 'package:bancher/domain/userInfo.dart';
import 'package:bancher/domain/validation.dart';

class AppManager {
  static AppManager _instance;
  static Repository _repository = BancherRepository();

  AppManager._();

  static AppManager instance() {
    if (_instance == null) {
      _instance = AppManager._();
    }
    return _instance;
  }

  ValidationUseCase validationUseCase() {
    return ValidationUseCase(_repository);
  }

  SignupUsecase signupUsecase() {
    return SignupUsecase(_repository);
  }

  LoginUsecase loginUsecase() {
    return LoginUsecase(_repository);
  }

  LogoutUsecase logoutUsecase() {
    return LogoutUsecase(_repository);
  }

  bool isLoggedIn() {
    return _repository.isLoggedIn();
  }

  UserInfoUsecase userInfoUsecase() {
    return UserInfoUsecase(_repository);
  }
}
