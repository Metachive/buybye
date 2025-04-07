// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../homepage.dart';
import '../shopping_cart.dart';
import '../product_register.dart';
import '../purchase_history.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final VoidCallback? onBackPressed;

  const CommonAppBar({super.key, this.title, this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: null,
      title: GestureDetector(
        onTap: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const Homepage()),
            (route) => false,
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('assets/images/logo.png', height: 100, width: 100),
          ],
        ),
      ),
      actions: const [], // 사이드바 버튼 제거
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
