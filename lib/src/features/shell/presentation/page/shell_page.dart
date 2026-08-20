import 'package:apitest/src/features/shell/presentation/widgets/custom_appbar.dart';
import 'package:apitest/src/features/shell/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class ShellPage extends StatefulWidget {
  const ShellPage({super.key, required this.child});
  final Widget child;

  @override
  State<ShellPage> createState() => _ShellPageState();
}

class _ShellPageState extends State<ShellPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: widget.child,
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
