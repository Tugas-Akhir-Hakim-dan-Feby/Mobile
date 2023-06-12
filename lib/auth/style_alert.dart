import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


Widget fadeAlertAnimation(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  return Align(
    alignment: Alignment.center,
    child: FadeTransition(
      opacity: animation,
      child: child,
    ),
  );
}





    var alertStyle = AlertStyle(
      animationType: AnimationType.grow,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: const TextStyle(fontWeight: FontWeight.bold),
      descTextAlign: TextAlign.start,
      animationDuration: Duration(milliseconds: 200),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
        side: BorderSide(
          color: Colors.grey,
        ),
      ),
      titleStyle: const TextStyle(
    color: Color.fromARGB(255, 68, 233, 74),
  ),
      alertAlignment: Alignment.center,
    );
