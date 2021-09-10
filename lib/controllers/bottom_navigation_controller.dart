import 'package:mobx/mobx.dart';

part 'bottom_navigation_controller.g.dart';

class BottomNavigationController = BottomNavigationControllerBase
    with _$BottomNavigationController;

abstract class BottomNavigationControllerBase with Store {
  @observable
  int index = 0;

  @observable
  String research = '';
}
