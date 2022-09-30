import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled22/home.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final PasswordController = TextEditingController();
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Login')),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              TextFormField(
                controller: emailController,
                decoration:const InputDecoration(
                  hintText: 'Username',
                ),
              ),
             const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: PasswordController,
                decoration:const InputDecoration(
                  hintText: 'Password',

                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: ageController,
                decoration:const InputDecoration(
                  hintText: 'Age',

                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  SharedPreferences sp =await SharedPreferences.getInstance();
                  sp.setString('email',emailController.text.toString());
                  sp.setString('age',ageController.text.toString());
                  sp.setBool('islogin',true);

                 Navigator.push(context,
                 MaterialPageRoute(builder: (context)=> HomeScreen())
                 );
                },
                child: Container(
                 width: double.infinity,
                  height: 50,
                  color: Colors.green,
                  child:const Center(child:  Text('Login')),


                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
