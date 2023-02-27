import 'package:bottom_navigation_bar/page/homepage.dart';
import 'package:bottom_navigation_bar/page/loginpage.dart';
import 'package:bottom_navigation_bar/page/profilepage.dart';
import 'package:bottom_navigation_bar/page/schedulepage.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:provider/provider.dart';
import 'package:bottom_navigation_bar/models/cart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_login/flutter_login.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Cart>(
      create: (context) => Cart(), 
      child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Bottom navigation bar'),
    ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  final screens = [
    LoginPage(),
    HomePage(),
    SchedulePage(),
    ProfilePage(),
  ];
 void _OnItemTap(int index){
    print(index);
    //setState(()=>cart.indice = index);
  }
 
  @override
  Widget build(BuildContext context) {
    return Consumer <Cart>(
            builder: (context, cart, child) {        
             // int index = cart.indice;       
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Self Manager events'),
        backgroundColor:Colors.orange ,
      ),
           body: screens[cart.indice],
           bottomNavigationBar:BottomNavigationBar(
                backgroundColor: Colors.orange,
                selectedItemColor:Colors.orange,
                unselectedItemColor: Colors.white,
                type: BottomNavigationBarType.fixed,
                //currentIndex: cart.indice,
                onTap: (index)=> setState(()=>cart.indice = index),
                items:[ 
                   BottomNavigationBarItem(
                    icon: Icon(Icons.local_activity,size:1),
                    label: 'Login',
                    backgroundColor: Colors.orange,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  
                  ),
                   BottomNavigationBarItem(
                    icon: Icon(Icons.schedule),
                    label: 'Schedule',              
                  ),
                   BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Account',
                  ),               
        ]
        ),    // This trailing comma makes auto-formatting nicer for build methods.
    );
    });   
  }
}
