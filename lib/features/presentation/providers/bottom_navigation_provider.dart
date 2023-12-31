import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bottom_navigation_provider.g.dart';

@riverpod
class BottomNavigationIndex extends _$BottomNavigationIndex {
  @override
  int build() {
    return 0;
  }

  void setIndex(int index) {
    state = index;
  }
}
