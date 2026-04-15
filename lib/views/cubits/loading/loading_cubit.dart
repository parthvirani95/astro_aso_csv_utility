// ignore_for_file: depend_on_referenced_packages

import 'dart:math';

import 'package:bloc/bloc.dart';

class LoadingCubit extends Cubit<double> {
  LoadingCubit() : super(0);

  bool isMounted = true;
  String loadingMessage = "Loading...";
  bool isProcessTerminated = false;
  bool showCancelButton = false;

  void showMessageAndLoading({required String message, bool showCancelButton = false}) {
    isProcessTerminated = false;
    loadingMessage = message;
    this.showCancelButton = showCancelButton;
    show();
  }

  void show() {
    if (!isMounted) return;
    emit(Random().nextDouble());
  }

  void hide() {
    loadingMessage = "";
    showCancelButton = false;
    isProcessTerminated = true;
    if (!isMounted) return;
    emit(0);
  }
}
