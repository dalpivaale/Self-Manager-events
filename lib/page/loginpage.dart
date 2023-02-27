import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bottom_navigation_bar/models/cart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:bottom_navigation_bar/page/homepage.dart';
import 'package:bottom_navigation_bar/page/loginpage.dart';
import 'package:bottom_navigation_bar/page/profilepage.dart';
import 'package:bottom_navigation_bar/page/schedulepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    //Check if the user is already logged in before rendering the login page
    _checkLogin();
  }//initState

  void _checkLogin() async {
    //Get the SharedPreference instance and check if the value of the 'username' filed is set or not
    final sp = await SharedPreferences.getInstance();
    if(sp.getString('username') != null){
      //If 'username is set, push the HomePage
      _toHomePage(context);
    }//if
  }//_checkLogin

  Future<String> _loginUser(LoginData data) async {
    if(data.name == 'bug@expert.com' && data.password == 'pippo'){

      final sp = await SharedPreferences.getInstance();
      sp.setString('username', data.name);

      return '';
    } else {
      return 'Wrong credentials';
    }
  } 
 // _loginUser
  Future<String> _signUpUser(SignupData data) async {
    return 'To be implemented';
  } 
 // _signUpUser
  Future<String> _recoverPassword(String email) async {
    return 'Recover password functionality needs to be implemented';
  } 
 // _recoverPassword
  @override
  Widget build(BuildContext context) {
    
    return FlutterLogin(
      title: 'User Login',
      theme: LoginTheme(primaryColor: Colors.orangeAccent,buttonStyle: TextStyle(color:Color.fromARGB(209, 249, 241, 4)),
      pageColorLight :Colors.yellow, accentColor:Colors.orangeAccent  ),
      onLogin: _loginUser,
      onSignup: _signUpUser,
      onRecoverPassword: _recoverPassword,
      onSubmitAnimationCompleted: () async{
        _toHomePage(context);
      },
    );
  } // build
  void _toHomePage(BuildContext context){
    Provider.of<Cart>(context,listen: false).addProduct(); 
  }//_toHomePage
  
  }                  