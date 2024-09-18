import 'package:basic_structure/src/common/constants/global_variables.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List<Widget> pages = [
    const Center(child: Text('Home')),
    const Center(child: Text('Driving')),
    const Center(child: Text('Safety')),
    const Center(child: Text('Membership')),
  ];

  List<BottomNavBarItem> bottomItems = [
    BottomNavBarItem(title: 'Home', icon: Icons.home),
    BottomNavBarItem(title: 'Driving', icon: Icons.home),
    BottomNavBarItem(title: 'Safety', icon: Icons.home),
    BottomNavBarItem(title: 'Membership', icon: Icons.home),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Home'),
        ),
        body: pages[currentIndex],
        floatingActionButton: Container(
          margin: const EdgeInsets.only(left: 32),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
              color: colorScheme(context).surface,
              borderRadius: BorderRadius.circular(8)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: bottomItems.asMap().entries.map((item) {
              return InkWell(
                onTap: () => setState(() {
                  currentIndex = item.key;
                }),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      item.value.icon,
                      size: 18,
                    ),
                    Text(
                      item.value.title,
                      style:
                          textTheme(context).bodySmall?.copyWith(fontSize: 10),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ));
  }
}

class BottomNavBarItem {
  final String title;
  final IconData icon;

  BottomNavBarItem({required this.title, required this.icon});
}
