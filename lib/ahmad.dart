import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled22/login.dart';

import 'home.dart';
class Ahmad extends StatefulWidget {
  const Ahmad({Key? key}) : super(key: key);

  @override
  State<Ahmad> createState() => _AhmadState();
}

class _AhmadState extends State<Ahmad> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    islogin();
  }
  void islogin() async{
    SharedPreferences sp =await SharedPreferences.getInstance();
    bool isLogin= sp.getBool('islogin')?? false;
    if(isLogin){
      Timer(Duration(seconds: 3), () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
      });
    }
    else{
      Timer(Duration(seconds: 3), () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const Login()));
      });
    }

  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  Image(
          fit: BoxFit.fill,
          height: double.infinity,
          image: NetworkImage('https://images.pexels.com/photos/13719624/pexels-photo-13719624.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')),
    );
  }
}
