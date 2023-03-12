import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Widget fadeAlertAnimation(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return Align(
      child: FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  }

  var alertStyle = AlertStyle(
        animationType: AnimationType.fromTop,
        isCloseButton: false,
        isOverlayTapDismiss: false,
        descStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          ),
        animationDuration: const Duration(milliseconds: 20),
        alertBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
          side: const BorderSide(
            color: Colors.grey,
          ),
        ),
        titleStyle: const TextStyle(
          color: Color.fromARGB(255, 68, 233, 74),
        ),
        constraints: const BoxConstraints.expand(width: 1000),
        //First to chars "55" represents transparency of color
        overlayColor: const Color(0x55000000),
        alertElevation: 0,
        alertAlignment: Alignment.center
        
        );

