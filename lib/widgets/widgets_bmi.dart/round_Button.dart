import 'package:flutter/material.dart';
import 'package:login_signup/theme/constants_bmi.dart';

class RoundButton extends StatelessWidget {
  final IconData icon;
  Function()? onPress;
  RoundButton({
    super.key,
    this.onPress,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      onPressed: onPress,
      fillColor: kIconColor,
      constraints: const BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: const CircleBorder(),
      child: Icon(icon),
    );
  }
}
