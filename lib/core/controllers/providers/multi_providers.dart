import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class Providers extends StatelessWidget {
  const Providers({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
      final providers = <SingleChildWidget>[];

  if (providers.isEmpty) {
    return child;
  }
    return MultiProvider(providers: [], child: child);
  }
}
