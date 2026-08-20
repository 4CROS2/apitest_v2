import 'package:apitest/src/core/extensions/go_router_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum BottomNavigationBarItemType {
  home(path: '/home'),
  settings(path: '/settings');

  const BottomNavigationBarItemType({required this.path});
  final String path;
}

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  void _onDestinationSelected(BuildContext context, {required int index}) {
    final BottomNavigationBarItemType selectedItem =
        BottomNavigationBarItemType.values[index];

    
    if (selectedItem.path != context.currentLocation && selectedItem.path != '/home') {
      context.push(selectedItem.path);
    }

    if (selectedItem.path == '/home' && context.currentLocation != '/home') {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: BottomNavigationBarItemType.values.indexWhere(
        (item) => item.path == context.currentLocation,
      ),
      onDestinationSelected: (index) =>
          _onDestinationSelected(context, index: index),
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
        NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
      ],
    );
  }
}
