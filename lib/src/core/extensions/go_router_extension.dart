import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension GoRouterExtension on BuildContext {
  String get currentLocation => GoRouter.of(this).state.matchedLocation;
}
