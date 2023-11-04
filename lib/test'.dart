import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List texts=['Car','Transit','Bike'];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom Tab Indicator'),
          bottom: TabBar(onTap: (_){
            setState(() {

            });
          },
            controller: _tabController,
            tabs: [
              Tab(
                child: createTab('Car', _tabController.index==0),
              ),
              Tab(
                child: createTab('Transit', _tabController.index==1),
              ),
              Tab(
                child: createTab('Bike', _tabController.index==2),
              ),
            ],
            // Use Builder to get the context with the TabController
            labelPadding: EdgeInsets.zero,
            // This is important to ensure the background fills the tab
            indicator: const BoxDecoration(), // Removes the default indicator
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            Center(child: Text('Car View')),
            Center(child: Text('Transit View')),
            Center(child: Text('Bike View')),
          ],
        ),
      ),
    );
  }
}

// This creates a tab widget with a colored background based on the selection state
Widget createTab(String text, bool isSelected) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 8,horizontal: 5),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: isSelected ? Colors.red : Colors.grey.withOpacity(0.3),
      borderRadius: BorderRadius.circular(25),
    ),
    child: Text(
      text,
      style: TextStyle(color: isSelected ? Colors.white : Colors.black),
    ),
  );
}
