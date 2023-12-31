import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterbaseapp/features/presentation/providers/bottom_navigation_provider.dart';
import 'package:go_router/go_router.dart';

class MainLayout extends ConsumerStatefulWidget {
  final Widget child;

  const MainLayout({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainLayoutState();
}

class _MainLayoutState extends ConsumerState<MainLayout> {
  @override
  Widget build(BuildContext context) {
    final bottomNavigationIndex = ref.watch(bottomNavigationIndexProvider);

    final routeList = [
      '/home',
      '/user',
    ];

    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User',
          ),
        ],
        currentIndex: bottomNavigationIndex,
        selectedItemColor: Colors.blue[500],
        onTap: (int index) {
          ref.read(bottomNavigationIndexProvider.notifier).setIndex(index);
          context.go(routeList[index]);
        },
      ),
    );
  }
}
