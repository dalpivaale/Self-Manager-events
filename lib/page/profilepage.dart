import 'package:flutter/material.dart';
import 'package:bottom_navigation_bar/models/cart.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ProfilePage extends StatefulWidget{
    const ProfilePage({Key? key}) : super(key: key);
  @override 
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage>{
  int index = 0;
  @override 
  int _index()
  {
   return index = index+1;
  }
  Widget build(BuildContext context) => Scaffold(
      body: Center(
        child: Column(
          children: [ 
           Container(child:  Icon(Icons.account_circle_rounded,size:200,color: Color.fromARGB(255, 248, 249, 250),),width:350,
            height: 230,decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.bottomCenter,
              end: Alignment.topCenter,colors: [Color.fromARGB(255, 251, 102, 15),Colors.white60]),borderRadius: BorderRadius.circular(12)),),
          
          SizedBox(height: 40),
          Container(
            height: 270,
            width: 400,
            child: ListView(
  children: const [
    ListTile(
        iconColor: Color.fromARGB(255, 255, 115, 0),
        leading: Icon(Icons.account_balance),
        title: Text('George Lucas'),
    ),
     ListTile(
          iconColor: Color.fromARGB(255, 255, 115, 0),
          leading: Icon(Icons.male),
          title: Text('Male'),
      ),
    
    ListTile(
        leading: Icon(Icons.cake),
        iconColor: Color.fromARGB(255, 255, 115, 0),
        title: Text('24 years'),
    ),
    ListTile(
        iconColor: Color.fromARGB(255, 255, 115, 0),
        leading: Icon(Icons.email),
        title: Text('info@gmail.com'),
    ),     
         ],
        ),
          ),
          ElevatedButton.icon(onPressed: ()=> _toLoginPage(context),icon:Icon(Icons.logout_rounded),label:Text('Logout'),
          style: ElevatedButton.styleFrom(primary: Colors.orangeAccent,)),
        ]),
      ),
  );
}

  void _toLoginPage(BuildContext context) async{
        //Unset the 'username' filed in SharedPreference 
    final sp = await SharedPreferences.getInstance();
    sp.remove('username');
        Provider.of<Cart>(context,listen: false).clearCart();    
  }
