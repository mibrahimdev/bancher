import 'package:bancher/di.dart';
import 'package:bancher/domain/logout.dart';
import 'package:bancher/domain/userInfo.dart';

class HomeViewModel {
  LogoutUsecase _logoutUsecase = AppManager.instance().logoutUsecase();
  UserInfoUsecase _userInfoUsecase = AppManager.instance().userInfoUsecase();

  void logout(Function then) {
    _logoutUsecase.logout(then);
  }

  void showUserInfo(Function info) {
    _userInfoUsecase.loadUserInfo(info);
  }
}
