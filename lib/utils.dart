import 'package:flutter/cupertino.dart';
import 'dart:ui' as ui;

double getScreenWidth() {
  return MediaQueryData.fromWindow(ui.window).size.width;
}

double getScreenHeight() {
  return MediaQueryData.fromWindow(ui.window).size.height;
}
