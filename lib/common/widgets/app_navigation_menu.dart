import 'dart:ui';

import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';

class AppNavigationMenu extends StatefulWidget {
  const AppNavigationMenu({
    super.key,
    this.pages,
  });

  final List<Widget>? pages;

  @override
  State<AppNavigationMenu> createState() => _AppNavigationMenuState();
}

class _AppNavigationMenuState extends State<AppNavigationMenu> {
  static const double _navigationBarHeight = 76;
  static const double _navigationHorizontalInset = 20;
  static const double _navigationBottomInset = 16;
  // static const double _navigationTopClearance = 18;

  static const List<_AppNavigationItem> _items = [
    _AppNavigationItem(
      label: 'Home',
      icon: CupertinoIcons.house,
      activeIcon: CupertinoIcons.house_fill,
    ),
    _AppNavigationItem(
      label: 'Favorite',
      icon: CupertinoIcons.heart,
      activeIcon: CupertinoIcons.heart_fill,
    ),
    _AppNavigationItem(
      label: 'Settings',
      icon: CupertinoIcons.gear_alt,
      activeIcon: CupertinoIcons.gear_alt_fill,
    ),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = widget.pages ?? [];

    assert(
      pages.length == _items.length,
      'AppNavigationMenu pages length must match navigation item count.',
    );

    final bottomSafeArea = MediaQuery.viewPaddingOf(context).bottom;
    final bottomInset = bottomSafeArea > _navigationBottomInset
        ? bottomSafeArea
        : _navigationBottomInset;

    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: IndexedStack(
              index: _selectedIndex,
              children: pages,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SafeArea(
              top: false,
              minimum: const EdgeInsets.fromLTRB(
                _navigationHorizontalInset,
                0,
                _navigationHorizontalInset,
                _navigationBottomInset,
              ),
              child: _FloatingNavigationBar(
                items: _items,
                selectedIndex: _selectedIndex,
                onDestinationSelected: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FloatingNavigationBar extends StatelessWidget {
  const _FloatingNavigationBar({
    required this.items,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  final List<_AppNavigationItem> items;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final glassTint = isDark ? colorScheme.surface : Colors.white;

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(alpha: isDark ? 0.28 : 0.1),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
          BoxShadow(
            color: Colors.white.withValues(alpha: isDark ? 0.04 : 0.5),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(36),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: 76,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
              color: glassTint.withValues(alpha: isDark ? 0.5 : 0.7),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white.withValues(alpha: isDark ? 0.12 : 0.88),
                  glassTint.withValues(alpha: isDark ? 0.42 : 0.56),
                ],
              ),
              borderRadius: BorderRadius.circular(36),
              border: Border.all(
                color: Colors.white.withValues(alpha: isDark ? 0.18 : 0.95),
                width: 1.1,
              ),
            ),
            child: Row(
              children: [
                for (var index = 0; index < items.length; index++)
                  Expanded(
                    child: _NavigationItemButton(
                      item: items[index],
                      isSelected: selectedIndex == index,
                      onTap: () => onDestinationSelected(index),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavigationItemButton extends StatelessWidget {
  const _NavigationItemButton({
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  final _AppNavigationItem item;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final foregroundColor =
        isSelected ? colorScheme.onSurface : colorScheme.onSurfaceVariant;

    return Semantics(
      selected: isSelected,
      button: true,
      label: item.label,
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOutCubic,
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 7),
          decoration: BoxDecoration(
            color: isSelected
                ? Colors.white.withValues(alpha: 0.6)
                : Colors.transparent,
            gradient: isSelected
                ? LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withValues(alpha: 0.78),
                      colorScheme.primary.withValues(alpha: 0.1),
                    ],
                  )
                : null,
            borderRadius: BorderRadius.circular(30),
            border: isSelected
                ? Border.all(
                    color: Colors.white.withValues(alpha: 0.75),
                  )
                : null,
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: colorScheme.shadow.withValues(alpha: 0.08),
                      blurRadius: 14,
                      offset: const Offset(0, 6),
                    ),
                    BoxShadow(
                      color: colorScheme.primary.withValues(alpha: 0.08),
                      blurRadius: 18,
                      offset: const Offset(-6, 4),
                    ),
                  ]
                : null,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isSelected ? item.activeIcon : item.icon,
                color: foregroundColor,
                size: 25,
              ),
              const SizedBox(height: 3),
              Text(
                item.label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: foregroundColor,
                  fontWeight: FontWeight.w700,
                  height: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AppNavigationItem {
  const _AppNavigationItem({
    required this.label,
    required this.icon,
    required this.activeIcon,
  });

  final String label;
  final IconData icon;
  final IconData activeIcon;
}
