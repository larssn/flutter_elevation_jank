import 'package:flutter/material.dart';
import 'package:lala/item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return _buildItem(index);
        },
        itemCount: 2000,
      ),
    );
  }

  Widget _buildItem(int index) {
    return MasterDetailListItem(
      onTap: () => debugPrint('Tap $index'),
      showLeadingAvatar: true,
      content: Container(
        color: Colors.blue,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text('Item with a slightly longer name than normal $index'),
              ],
            ),
          ],
        ),
      ),
      name: 'Sub name: $index',
    );
  }
}
