import 'package:flutter/material.dart';

import '../../constants/theme.dart';
import './socials/base_social_button.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.onPressed});

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return BaseSocialButton(
        color: primaryColor,
        iconData: Icons.login,
        buttonText: 'Login',
        onPressed: onPressed);
  }
}
