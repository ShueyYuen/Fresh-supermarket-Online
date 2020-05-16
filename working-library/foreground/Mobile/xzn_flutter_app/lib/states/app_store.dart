import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

enum StatesAction {
  Increment
}

int reducer(int count, action) {
  if (action == StatesAction.Increment) {
    return count + 1;
  }
  return count;
}