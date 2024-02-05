import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const MyAppBar({super.key, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.onSurfaceVariant);

    return SliverAppBar(
      centerTitle: false,
      backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
      title: Text(title, style: textStyle),
      actions: actions,
      toolbarHeight: 70,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
