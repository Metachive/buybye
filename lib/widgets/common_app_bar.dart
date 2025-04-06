// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../homepage.dart';
import '../shopping_cart.dart';
import '../product_register.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final VoidCallback? onBackPressed;

  const CommonAppBar({
    super.key,
    this.title,
    this.onBackPressed,
  });

  void _showMenu(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double topOffset = kToolbarHeight + statusBarHeight;
    
    late OverlayEntry overlayEntry;
    
    overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          // 배경 오버레이 (앱바 부분 제외)
          Positioned(
            top: topOffset,
            left: 0,
            right: 0,
            bottom: 0,
            child: GestureDetector(
              onTap: () {
                overlayEntry.remove();
              },
              child: Container(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
          ),
          // 사이드바
          TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            tween: Tween<double>(begin: 1.0, end: 0.0),
            builder: (context, value, child) {
              return Positioned(
                top: topOffset,
                right: -MediaQuery.of(context).size.width * 0.6 * value,
                child: Material(
                  color: Colors.white,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height - topOffset,
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.home),
                          title: const Text('홈'),
                          onTap: () {
                            overlayEntry.remove();
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => const Homepage()),
                              (route) => false,
                            );
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.shopping_cart),
                          title: const Text('장바구니'),
                          onTap: () {
                            overlayEntry.remove();
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const ShoppingCart()),
                            );
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.list_alt),
                          title: const Text('구매리스트'),
                          onTap: () {
                            overlayEntry.remove();
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const ShoppingCart()),
                            );
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.add_circle_outline),
                          title: const Text('상품 등록'),
                          onTap: () {
                            overlayEntry.remove();
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const ProductRegister()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
    
    Overlay.of(context).insert(overlayEntry);
  }

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
            Image.asset(
              'assets/images/logo.png',
              height: 100,
              width: 100,
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: GestureDetector(
            onTap: () => _showMenu(context),
            child: Image.asset(
              'assets/images/list.png',
              width: 30,
              height: 30,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
} 