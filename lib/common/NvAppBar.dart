import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nvtours/data/DrawerProvider.dart';

class NvAppBar extends ConsumerStatefulWidget {
  const NvAppBar({
    Key? key,
    required this.DrawerKey
  }) : super(key: key);
  final DrawerKey;
  @override
  ConsumerState createState() => _NvAppBarState();
}

class _NvAppBarState extends ConsumerState<NvAppBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "assets/images/header.png",
              height: 40,
            ),
            IconButton(
              onPressed: (){
                widget.DrawerKey.currentState!.openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                size: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
