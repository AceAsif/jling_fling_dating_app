import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool hasActions;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.hasActions = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        children: [
          Expanded(
            child: Image.asset(
              'assets/images/Jling Fling-logos_black.png',
              height: 70,
            ),
          ),
          Expanded(
              flex: 2,
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline4,
              )
          )
        ],
      ),
      actions: hasActions
          ? [
              IconButton(icon: const Icon(Icons.message), color: Colors.black, onPressed: () {}),
              IconButton(icon: const Icon(Icons.person), color: Colors.black, onPressed: () {})
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
