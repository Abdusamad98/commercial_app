import 'package:commercial_app/local_data/local_database.dart';
import 'package:commercial_app/repository/repository.dart';
import 'package:commercial_app/screens/tab/carts_page/carts_screen.dart';
import 'package:commercial_app/screens/tab/home_page/home_page.dart';
import 'package:commercial_app/screens/tab/users_page/users_page.dart';
import 'package:commercial_app/service/api_provider.dart';
import 'package:flutter/material.dart';

class TabBox extends StatefulWidget {
  const TabBox({Key? key}) : super(key: key);

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  int currentIndex = 0;

  late MyRepository myRepository;

  List<Widget> screens = [];

  @override
  void initState() {
    myRepository = MyRepository(
      apiProvider: ApiProvider(),
      localDatabase: LocalDatabase(),
    );

    screens = [
      HomeScreen(myRepository: myRepository),
      CartsScreen(myRepository: myRepository),
      UsersScreen(myRepository: myRepository),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body:screens[currentIndex],
      // IndexedStack(
      //   index: currentIndex,
      //   children: screens,
      // ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blueAccent,
        iconSize: 24,
        onTap:
            (index) {
          setState(() {
            currentIndex = index;
          });

          switch(currentIndex){
            case 0:{}
              break;
          }
        },
        currentIndex: currentIndex,
        selectedItemColor: Colors.white,
        selectedLabelStyle: const TextStyle(color: Colors.green),
        items: [
          getItem(icon: Icons.home, labelText: "Home"),
          getItem(icon: Icons.shopping_basket, labelText: "Carts"),
          getItem(icon: Icons.people, labelText: "Users"),
        ],
      ),
    );
  }

  BottomNavigationBarItem getItem(
      {required IconData icon, required String labelText}) {
    return BottomNavigationBarItem(
        label: labelText,
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        activeIcon: Icon(
          icon,
          color: Colors.red,
        ));
  }
}
