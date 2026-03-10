// mixins/slide_up_mixin.dart
import 'package:flutter/material.dart';

mixin SlideUpMixin<T extends StatefulWidget> on State<T>, SingleTickerProviderStateMixin<T> {
  late AnimationController slideController;
  late Animation<Offset> slideAnimation;

  void initSlide() {
    slideController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    slideAnimation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: slideController,
      curve: Curves.easeOut,
    ));
    slideController.forward();
  }

  void disposeSlide() {
    slideController.dispose();
  }
}