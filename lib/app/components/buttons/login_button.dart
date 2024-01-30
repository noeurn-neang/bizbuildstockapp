import 'package:flutter/material.dart';
import 'package:flutter_core/utils/color_utils.dart';

import './socials/base_social_button.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.onPressed});

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return BaseSocialButton(
        color: ColorUtils.fromHex('#186AFF'),
        iconData: Icons.login,
        buttonText: 'Login',
        onPressed: onPressed);
  }
}
