import 'package:flutter/material.dart';

/// The right-side drawer, which contains the links to navigate the app.
class MainDrawer extends StatefulWidget {
  const MainDrawer({
    super.key,
  });

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(topRight: Radius.circular(32.0), bottomRight: Radius.circular(32.0)),
      child: Drawer(
        child: Column(
          children: <Widget>[
            _Header(),
            _buildMenu(),
          ],
        ),
      ),
    );
  }

  Expanded _buildMenu() {
    final theme = Theme.of(context);

    // debugPrint('--------------------------------------------------');
    // debugPrint('Active subscription: $activeSubscription');
    // debugPrint('Is Printing null: ${printing == null}');
    // debugPrint('Is primary currency null: ${primCur == null}');
    // debugPrint('Is business null: ${bus == null}');
    // debugPrint('Is organization null: ${org == null}');
    // debugPrint('Is terminal enabled true or null: ${term?.enabled}');
    // debugPrint('User has permission: ${hasPermissions(user)}');
    // debugPrint('User is VIP: ${user.vip}');
    // debugPrint('--------------------------------------------------');

    return Expanded(
      child: Stack(
        children: <Widget>[
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 64),
                child: Column(
                  children: <Widget>[
                    _MenuItem(
                      title: 'Sales',
                      icon: Icons.attach_money,
                      onTap: () async {},
                    ),
                    _MenuItem(
                      title: 'Order',
                      icon: Icons.receipt,
                      onTap: () async {},
                    ),
                    _MenuItem(
                      title: 'Bookings',
                      icon: Icons.date_range,
                      onTap: () async {},
                    ),
                    _MenuItem(
                      title: 'Reports',
                      icon: Icons.show_chart,
                      onTap: () async {},
                    ),
                    _MenuItem(
                      title: 'Customers',
                      icon: Icons.people,
                      onTap: () async {},
                    ),
                    _MenuItem(
                      title: 'Settings',
                      icon: Icons.settings,
                      onTap: () async {},
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'tillty',
                    style: TextStyle(
                      fontSize: 20,
                      color: theme.textTheme.bodyMedium!.color,
                      fontFamily: 'FugazOne',
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Text(
                    'v1.0.0',
                    style: const TextStyle(fontSize: 12.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatefulWidget {
  const _Header();

  @override
  State<_Header> createState() => _HeaderState();
}

class _HeaderState extends State<_Header> {
  @override
  Widget build(BuildContext context) {
    final fullName = 'Lars Støttrup';
    final theme = Theme.of(context);
    final nav = Navigator.of(context, rootNavigator: true);

    return UserAccountsDrawerHeader(
      accountName: Text(fullName, style: theme.textTheme.titleLarge!.copyWith(color: Colors.white)),
      accountEmail: Text('Lars Fun House', style: theme.textTheme.titleLarge!.copyWith(color: Colors.white)),
      currentAccountPicture: GestureDetector(
        onTap: () async {
          void callback() {
            nav.pushNamedAndRemoveUntil('/profile', (_) => false);
          }

          if (context.mounted) {
            final route = ModalRoute.of(context) as PageRoute;

            if (route.popDisposition != RoutePopDisposition.doNotPop) {
              callback();
            }
          }
        },
        child: CircleAvatar(
          backgroundColor: Colors.white,
        ),
      ),
      otherAccountsPictures: <Widget>[
        IconButton(
          icon: const Icon(Icons.lock),
          color: Colors.white,
          iconSize: 32,
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        IconButton(
          icon: const Icon(Icons.person),
          color: Colors.white,
          iconSize: 32,
          onPressed: () async {
            void callback() {
              nav.pushNamedAndRemoveUntil('/profile', (_) => false);
            }

            if (context.mounted) {
              final route = ModalRoute.of(context) as PageRoute;

              if (route.popDisposition != RoutePopDisposition.doNotPop) {
                callback();
              }
            }
          },
        ),
        IconButton(
          icon: const Icon(Icons.exit_to_app),
          color: Colors.white,
          iconSize: 32,
          onPressed: () async {
            if (context.mounted) {
              final route = ModalRoute.of(context) as PageRoute;

              if (route.popDisposition != RoutePopDisposition.doNotPop) {}
            }
          },
        ),
      ],
      margin: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  const _MenuItem({
    required this.title,
    required this.icon,
    this.permissionCallback,
    required this.onTap,
  });

  final bool Function()? permissionCallback;
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final permissions = permissionCallback?.call() ?? true;

    return GestureDetector(
      onTap: permissions ? onTap : null,
      child: ListTile(
        leading: Icon(
          icon,
          color: permissions ? theme.primaryColor : theme.primaryColor.withOpacity(.25),
        ),
        title: Text(
          title,
          style: permissions
              ? theme.textTheme.titleMedium
              : theme.textTheme.titleMedium!.copyWith(color: theme.textTheme.titleMedium!.color!.withOpacity(.25)),
        ),
      ),
    );
  }
}
