import 'package:flutter/material.dart';

class MasterDetailListItem extends StatelessWidget {
  const MasterDetailListItem({
    super.key,
    this.onTap,
    required this.content,
    required this.name,
    this.isSelected = false,
    this.imageUrl,
    this.dotColor,
    this.avatarWidget,
    this.startActions,
    this.endActions,
    this.showIndicator = false,
    this.showLeadingAvatar = true,
    this.showCheckbox = false,
    this.indicatorIcon = Icons.business_center,
    this.indicatorWidget,
  });

  final VoidCallback? onTap;
  final bool isSelected;
  final String name;
  final Widget? avatarWidget;
  final String? imageUrl;
  final Widget content;
  final Color? dotColor;
  final List<Widget>? startActions;
  final List<Widget>? endActions;
  final bool showIndicator;
  final bool showLeadingAvatar;
  final bool showCheckbox;
  final IconData indicatorIcon;
  final Widget? indicatorWidget;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget child = Builder(
      builder: (context) {
        final c = Padding(
          padding: EdgeInsets.fromLTRB(showLeadingAvatar ? 46 : 14, 14, showCheckbox ? 46 : 14, 14),
          child: content,
        );

        if (onTap != null) {
          return InkWell(
            onTap: () {
              onTap?.call();
            },
            child: c,
          );
        }

        return c;
      },
    );

    return Material(
      elevation: 2,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Stack(
          fit: StackFit.loose,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: showLeadingAvatar ? 32 : 0, right: showCheckbox ? 32 : 0),
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected && !showCheckbox ? theme.colorScheme.secondary : theme.cardTheme.color,
                ),
                constraints: const BoxConstraints(minHeight: 64),
                child: child,
              ),
            ),
            if (showCheckbox)
              Positioned(
                right: 0,
                child: InkWell(
                  onTap: onTap,
                  child: CircleAvatar(
                    child: Icon(Icons.abc),
                  ),
                ),
              ),
            if (showLeadingAvatar)
              Positioned(
                left: 0,
                child: Stack(
                  fit: StackFit.loose,
                  children: [
                    InkWell(
                      onTap: onTap,
                      child: CircleAvatar(
                        backgroundColor: Colors.pink,
                        child: Icon(Icons.abc, size: 30),
                      ),
                    ),
                  ],
                ),
              ),
            if (dotColor != null)
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    backgroundColor: dotColor,
                    radius: 8,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
