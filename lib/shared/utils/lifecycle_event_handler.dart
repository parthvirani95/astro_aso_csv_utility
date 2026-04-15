// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LifecycleEventHandler extends WidgetsBindingObserver {
  final AsyncCallback? resumeCallBack;
  final AsyncCallback? inactiveCallback;
  final AsyncCallback? detachedCallback;
  final AsyncCallback? onPausedCallback;

  LifecycleEventHandler({
    this.resumeCallBack,
    this.inactiveCallback,
    this.detachedCallback,
    this.onPausedCallback,
  });

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.resumed:
        if (resumeCallBack != null) {
          await resumeCallBack!();
        }
        break;
      case AppLifecycleState.inactive:
        if (inactiveCallback != null) {
          await inactiveCallback!();
        }
        break;
      case AppLifecycleState.paused:
        if (onPausedCallback != null) {
          await onPausedCallback!();
        }
        break;
      case AppLifecycleState.detached:
        if (detachedCallback != null) {
          await detachedCallback!();
        }
        break;
      case AppLifecycleState.hidden:
        break;
    }
  }
}
