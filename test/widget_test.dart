import 'package:apitest/src/features/home/domain/entity/product_entity.dart';
import 'package:apitest/src/features/home/domain/entity/rating_entity.dart';
import 'package:apitest/src/features/home/presentation/widgets/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const product = ProductEntity(
    id: 1,
    title: 'Modern Wireless Headphones',
    price: 89.99,
    description: 'Noise cancelling headphones',
    category: 'electronics',
    image: 'https://example.com/headphones.png',
    rating: RatingEntity(rate: 4.7, count: 236),
  );

  testWidgets('shows product information and toggles its favorite state', (
    tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: ProductTile(product: product))),
    );

    expect(find.text(product.title), findsOneWidget);
    expect(find.text('electronics'), findsOneWidget);
    expect(find.text('4.7'), findsOneWidget);
    expect(find.text('(236)'), findsOneWidget);
    expect(find.text('\$89.99'), findsOneWidget);
    expect(find.byIcon(Icons.favorite_border_rounded), findsOneWidget);

    await tester.tap(find.byKey(const Key('product-favorite-1')));
    await tester.pump();

    expect(find.byIcon(Icons.favorite_rounded), findsOneWidget);
  });

  testWidgets('uses dark theme colors for the card and glass controls', (
    tester,
  ) async {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: Colors.pink,
      brightness: Brightness.dark,
    );

    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(colorScheme: colorScheme),
        home: const Scaffold(body: ProductTile(product: product)),
      ),
    );

    final card = tester.widget<Card>(find.byType(Card));
    final favoriteSurface = tester.widget<Material>(
      find.byKey(const Key('product-favorite-surface-1')),
    );

    expect(card.color, colorScheme.surfaceContainerLow);
    expect(
      favoriteSurface.color,
      colorScheme.surfaceContainerHigh.withValues(alpha: .88),
    );
  });
}
