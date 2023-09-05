import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      items: [

        const BottomNavigationBarItem(
          icon: Icon(Icons.home,),
          label: "Home",
        ),
        const BottomNavigationBarItem(
            icon: Icon(Icons.stay_current_portrait_sharp,), label: "Search"),
        const BottomNavigationBarItem(
            icon: Icon(Icons.rocket_launch_outlined ,), label: "Luxury",),
        BottomNavigationBarItem(icon: Image.asset('assets/icons/trophy.png',width: 25,color: Colors.black, ), label: "Setting"
        ),
      ],
      selectedItemColor: Colors.blue, // Set the color for the selected item
      unselectedItemColor: Colors.black,
      // Set the color for unselected items
      currentIndex: _selectedIndex,
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
        });

        if (index == 0) {

          //Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (context) => Body()));
          // Navigator.of(context).pushReplacement(
          //     MaterialPageRoute(builder: (context) => TransactionScreen()));
        } else if (index == 1) {
          //Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (context) => HotelListPage()));
          // Navigate to search screen
        } else if (index == 2) {
          //Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (context) => HotelListScreen()));
        }  else if (index == 3) {
          //Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (context) => SettingPage()));
        }
      },
    );

  }
}

