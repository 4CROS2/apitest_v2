import 'package:apitest/injection_container.dart';
import 'package:apitest/src/features/home/presentation/controller/home_controller.dart';
import 'package:apitest/src/features/home/presentation/widgets/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => sl<HomeController>()..fetchData(),
      child: Consumer<HomeController>(
        builder: (BuildContext context, HomeController value, _) => Scaffold(
          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 600),
            child: switch (value.status) {
              .loading => const Center(child: CircularProgressIndicator()),
              .success => SafeArea(
                child: GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 280,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                  ),
                  itemCount: value.products.length,
                  itemBuilder: (context, index) {
                    final product = value.products[index];
                    return ProductTile(product: product);
                  },
                ),
              ),
              .error => Center(
                child: Text(
                  value.errorMessage ?? 'An error occurred',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
              .idle => const SizedBox.shrink(),
            },
          ),
        ),
      ),
    );
  }
}
