import 'package:flutter/material.dart';
import 'list_0.dart';
import 'week_0.dart';
import 'month_0.dart';

class BasicApp extends StatefulWidget {
  const BasicApp({Key? key}) : super(key: key);

  @override
  BasicAppState createState() => BasicAppState();
}

class BasicAppState extends State<BasicApp> {
  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOptions = <Widget>[
      const MenuWeek(),
      const MenuMonth(),
      const MenuList()
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        title: const Text('TODOLIST',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25)),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {},
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
          // print('Selected index: $index');
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.view_kanban),
            label: 'Week',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: 'Month',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ballot),
            label: 'List',
          ),
        ],
      ),
    );
  }
}

Widget menuComponent(String title, String content) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
        decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        height: 50,
        child: Row(children: [
          Text(title),
          Text(content),
        ])),
  );
}

Widget menuMonth() {
  return const Text('Month');
}

Widget menuList() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      menuComponent("title1", "content1"),
      menuComponent("title2", "content2"),
      menuComponent("title3", "content3"),
      menuComponent("test", "content4"),
    ],
  );
}

Widget menuWeek() {
  return const Text('Week');
}
