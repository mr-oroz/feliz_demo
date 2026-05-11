import 'package:flutter/material.dart';

class GlAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GlAppBar({
    super.key,
    this.title,
    this.leading,
    this.action,
    this.color,
  });

  final Widget? title;
  final Widget? leading;
  final Widget? action;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ).copyWith(top: MediaQuery.of(context).padding.top),
      decoration: BoxDecoration(
        color: color ?? Colors.transparent,
      ),
      child: Stack(
        children: [
          if (leading != null)
            Align(alignment: Alignment.centerLeft, child: leading),
          if (title != null) Center(child: title),
          if (action != null)
            Align(alignment: Alignment.centerRight, child: action),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
