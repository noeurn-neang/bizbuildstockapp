import 'package:flutter/material.dart';
import 'package:flutter_core/constants/dimens.dart';

class BannerAds extends StatelessWidget {
  const BannerAds({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.green[300]),
      padding: const EdgeInsets.symmetric(
          horizontal: Dimens.marginLarge, vertical: Dimens.marginLarge),
      child: Center(
          child: Text(
        'Put advertisement in here',
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Colors.white),
      )),
    );
  }
}
