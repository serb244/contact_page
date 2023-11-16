import 'package:flutter/material.dart';

class SmallAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SmallAppBar({
    super.key,
    required this.title,
    this.action,
    this.automaticallyImplyLeading = false,
  });

  final String title;
  final Widget? action;
  final bool automaticallyImplyLeading;

  static const double _appbarHeight = 44.0;
  static const double _iconButtonSize = 22.0;
  static const Color _primaryColor = Color(0xFF393141);
  static const Color _appBarBackgroundColor = Color(0x00fafafa);
  static const Color _appShadowColor = Colors.transparent;
  static const TextStyle titleStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 1.2,
    color: _primaryColor,
  );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: _appBarBackgroundColor,
      shadowColor: _appShadowColor,
      leadingWidth: 100.0,
      automaticallyImplyLeading: false,
      toolbarHeight: _appbarHeight,
      leading: automaticallyImplyLeading
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back,
                    color: _primaryColor,
                    size: _iconButtonSize,
                  ),
                ),
              ],
            )
          : null,
      actions: [action ?? const SizedBox.shrink()],
      title: SizedBox(
        width: 158.0,
        height: _appbarHeight,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              maxLines: 2,
              style: titleStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(_appbarHeight);
}
