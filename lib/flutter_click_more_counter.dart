library flutter_click_more_counter;

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// A click counter that show message to tell the users that they need to click more to continue.
/// The feature of this lib is the same as active the developer mode in Android devices.
class ClickMoreCounter {
  /// reset value after [milliseconds]
  /// Default: 2000 milliseconds (2 seconds)
  final int resetCounterMilliseconds;

  /// total number of times needed to click
  /// Default: 10
  final int totalClick;

  /// Number of times the message will be displayed
  /// Default: 5
  final int displayMessageClick;

  /// counter click
  int counter = 0;

  Timer? _timer;

  ClickMoreCounter({
    this.resetCounterMilliseconds = 2000,
    this.displayMessageClick = 5,
    this.totalClick = 10,
  }) : assert(totalClick > displayMessageClick,
            "totalClick must greater than displayMessageClick");

  /// Increase [counter] every times user press.
  /// if [counter] is greater than [displayMessageClick], toast message will be shown.
  /// When [counter] = [totalClick], [action] will be call
  /// After [resetCounterMilliseconds], if no more press, [counter] will reset to 0
  run(VoidCallback action,
      {ToastMessageText? messageText, bool showMessage = true}) {
    counter++;
    if (counter >= displayMessageClick) {
      if (counter == totalClick) {
        counter = 0;
        action();
        return;
      }
      if (counter < totalClick) {
        int remainTimes = totalClick - counter;
        Fluttertoast.cancel();
        Fluttertoast.showToast(
            msg: messageText != null
                ? messageText(remainTimes)
                : "Press more $remainTimes times to open developer menu",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: const Color(0xFF818181),
            textColor: Colors.white,
            fontSize: 14);
      }
    }

    if (_timer?.isActive ?? false) _timer?.cancel();
    _timer = Timer(Duration(milliseconds: resetCounterMilliseconds), () async {
      counter = 0;
    });
  }
}

typedef ToastMessageText = String Function(int remainTimes);
