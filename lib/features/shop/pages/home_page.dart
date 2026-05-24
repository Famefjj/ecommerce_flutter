import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const List<_CategoryItem> _categories = [
    _CategoryItem(
      title: 'Laptops',
      imagePath: 'assets/images/categories/laptops.jpg',
    ),
    _CategoryItem(
      title: 'Computer parts',
      imagePath: 'assets/images/categories/computer_parts.jpg',
    ),
    _CategoryItem(
      title: 'Smartphones',
      imagePath: 'assets/images/categories/smartphones.jpg',
    ),
    _CategoryItem(
      title: 'Networking',
      imagePath: 'assets/images/categories/networking.jpg',
    ),
    _CategoryItem(
      title: 'Tablets',
      imagePath: 'assets/images/categories/tablets.jpg',
    ),
    _CategoryItem(
      title: 'Storage',
      imagePath: 'assets/images/categories/storage.jpg',
    ),
  ];

  static const List<_ProductItem> _products = [
    _ProductItem(
      name: 'MonaBook Air 14',
      category: 'Laptop',
      price: '\$899',
      icon: CupertinoIcons.device_laptop,
      colors: [Color(0xFF263234), Color(0xFF06B976)],
    ),
    _ProductItem(
      name: 'PixelWave Phone',
      category: 'Smartphone',
      price: '\$749',
      icon: CupertinoIcons.device_phone_portrait,
      colors: [Color(0xFFFF8A3D), Color(0xFF263234)],
    ),
    _ProductItem(
      name: 'Creator Keyboard',
      category: 'Computer parts',
      price: '\$129',
      icon: CupertinoIcons.keyboard,
      colors: [Color(0xFF5865F2), Color(0xFF06B976)],
    ),
    _ProductItem(
      name: 'Vault SSD 2TB',
      category: 'Storage',
      price: '\$179',
      icon: CupertinoIcons.archivebox,
      colors: [Color(0xFFFFB000), Color(0xFFFF6B35)],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 18, 24, 124),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildSearchHeader(context),
              const SizedBox(height: 34),
              _SectionTitle(
                title: 'Categories',
                trailingLabel: 'Personalized',
              ),
              const SizedBox(height: 18),
              _CategoryGrid(categories: _categories),
              const SizedBox(height: 32),
              // _buildCollectionBanner(context),
              const SizedBox(height: 34),
              const _SectionTitle(
                title: 'Picked for you',
                trailingLabel: 'View all',
              ),
              const SizedBox(height: 18),
              _ProductGrid(products: _products),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchHeader(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Expanded(
          child: Container(
            height: 45,
            padding: const EdgeInsets.symmetric(horizontal: 18),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(25),
            ),
            child: TextField(
              textInputAction: TextInputAction.search,
              cursorColor: colorScheme.primary,
              style: textTheme.titleMedium,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search for anything',
                hintStyle: textTheme.titleMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
                focusedBorder: InputBorder.none,
                fillColor: Colors.transparent,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 11),
                prefixIcon: Icon(
                  CupertinoIcons.search,
                  color: colorScheme.onSurface,
                  size: 18,
                ),
                prefixIconConstraints: const BoxConstraints(
                  minWidth: 34,
                  minHeight: 45,
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  tooltip: 'Search by image',
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(
                    minWidth: 34,
                    minHeight: 45,
                  ),
                  icon: Icon(
                    CupertinoIcons.camera,
                    color: colorScheme.onSurface,
                    size: 18,
                  ),
                ),
                suffixIconConstraints: const BoxConstraints(
                  minWidth: 34,
                  minHeight: 45,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        IconButton.filledTonal(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.cart),
        ),
      ],
    );
  }

  Widget _buildCollectionBanner(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colorScheme.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Build an elite collection',
            style: textTheme.headlineMedium?.copyWith(
              color: colorScheme.onPrimary,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Choose your next upgrade from personalized finds.',
            style: textTheme.bodyLarge?.copyWith(
              color: colorScheme.onPrimary.withValues(alpha: 0.88),
              height: 1.35,
            ),
          ),
          const SizedBox(height: 22),
          FilledButton.tonal(
            onPressed: () {},
            style: FilledButton.styleFrom(
              foregroundColor: colorScheme.primary,
              backgroundColor: colorScheme.onPrimary,
              minimumSize: const Size(0, 48),
              padding: const EdgeInsets.symmetric(horizontal: 22),
            ),
            child: const Text('Start your journey'),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({
    required this.title,
    required this.trailingLabel,
  });

  final String title;
  final String trailingLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Text(
            title,
            style: theme.textTheme.headlineMedium?.copyWith(
              color: colorScheme.onSurface,
              height: 1.08,
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            minimumSize: Size.zero,
            padding: const EdgeInsets.only(left: 12, bottom: 2),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(trailingLabel),
        ),
      ],
    );
  }
}

class _CategoryGrid extends StatelessWidget {
  const _CategoryGrid({required this.categories});

  final List<_CategoryItem> categories;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const columns = 3;
        const spacing = 16.0;
        final itemWidth =
            (constraints.maxWidth - spacing * (columns - 1)) / columns;

        return Wrap(
          spacing: spacing,
          runSpacing: 28,
          children: [
            for (final category in categories)
              SizedBox(
                width: itemWidth,
                child: _CategoryTile(category: category),
              ),
          ],
        );
      },
    );
  }
}

class _CategoryTile extends StatelessWidget {
  const _CategoryTile({required this.category});

  final _CategoryItem category;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: const Color(0xFFF7F7F7),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  category.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            category.title,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: textTheme.titleMedium?.copyWith(
              height: 1.12,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductGrid extends StatelessWidget {
  const _ProductGrid({required this.products});

  final List<_ProductItem> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 18,
        childAspectRatio: 0.74,
      ),
      itemBuilder: (context, index) {
        return _ProductTile(product: products[index]);
      },
    );
  }
}

class _ProductTile extends StatelessWidget {
  const _ProductTile({required this.product});

  final _ProductItem product;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: colorScheme.surfaceContainerHighest.withValues(
                  alpha: 0.42,
                ),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: product.colors,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Icon(
                      product.icon,
                      color: Colors.white,
                      size: 46,
                    ),
                  ),
                  Positioned(
                    top: 12,
                    right: 12,
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: colorScheme.surface.withValues(
                        alpha: 0.92,
                      ),
                      child: Icon(
                        CupertinoIcons.heart,
                        color: colorScheme.onSurface,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            product.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.titleMedium?.copyWith(
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            product.category,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            product.price,
            style: textTheme.titleMedium?.copyWith(
              color: colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryItem {
  const _CategoryItem({
    required this.title,
    required this.imagePath,
  });

  final String title;
  final String imagePath;
}

class _ProductItem {
  const _ProductItem({
    required this.name,
    required this.category,
    required this.price,
    required this.icon,
    required this.colors,
  });

  final String name;
  final String category;
  final String price;
  final IconData icon;
  final List<Color> colors;
}
