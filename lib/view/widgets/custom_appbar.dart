import 'package:bdo/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;

  @override
  final Size preferredSize;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
  }) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading, surfaceTintColor: white ,foregroundColor:white,
      backgroundColor:primaryButton,
      titleTextStyle: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      centerTitle: true,
      title: Text(title,style: const TextStyle(color: white),),
      actions: actions,
    );
  }
}





