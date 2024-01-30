import 'package:flutter/material.dart';
import 'package:flutter_core/constants/dimens.dart';

class BaseSocialButton extends StatelessWidget {
  const BaseSocialButton(
      {super.key,
      required this.buttonText,
      required this.iconData,
      this.isOutlined = false,
      required this.onPressed,
      required this.color,
      this.width = 280});

  final String buttonText;
  final bool isOutlined;
  final Function onPressed;
  final double width;
  final IconData iconData;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Material(
        borderRadius: BorderRadius.circular(30),
        elevation: 4,
        child: Container(
          width: width,
          padding: const EdgeInsets.symmetric(
              vertical: Dimens.margin, horizontal: Dimens.marginLarge),
          decoration: BoxDecoration(
            color: isOutlined ? Colors.white : color,
            border: Border.all(color: color, width: 2.5),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(children: [
            Icon(
              iconData,
              color: isOutlined ? color : Colors.white,
              size: 35,
            ),
            Expanded(
                child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: isOutlined ? color : Colors.white,
                ),
              ),
            )),
            const SizedBox(width: 35)
          ]),
        ),
      ),
    );
  }
}
