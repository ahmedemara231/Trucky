import '../navigation/navigator.dart';

extension NavigationHelper on int {
  void popUntil({String? data}) {
    for (var i = 0; i < this; i++) {
      Go.back(data);
    }
  }
}