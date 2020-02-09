import 'package:bancher/di.dart';

class SplashViewModel {
  void decideNavigation(Function onStart) {
    var isLoggedIn = AppManager.instance().isLoggedIn();
    onStart(isLoggedIn);
  }
}
