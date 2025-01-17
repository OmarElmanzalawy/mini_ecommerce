import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomNavigationProvider = StateNotifierProvider<BottomNavigationIndexNotifier, int>((ref) {
  return BottomNavigationIndexNotifier();
});

class BottomNavigationIndexNotifier extends StateNotifier<int> {
  BottomNavigationIndexNotifier() : super(0); 

  void changeIndex(int newValue){
    state = newValue;
  }
}