import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled22/login.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  String email ='';
  String age ='';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  loadData() async{
    SharedPreferences sp =await SharedPreferences.getInstance();
    email=sp.getString('email')??'';
    age=sp.getString('age')??'';
setState(() {

});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: const Center(child: Text('Home')),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               const Text('Email'),
                Text(email.toString()),

              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               const Text('Age'),
                Text(age.toString()),

              ],
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: ()  async {
                SharedPreferences sp =await SharedPreferences.getInstance();
                sp.clear();
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const Login())
                );
              },
              child: Container(
                width: double.infinity,
                height: 50,
                color: Colors.redAccent,
                child:const Center(child:  Text('Logout')),


              ),
            ),
          ],
        ),
      ),
    );
  }
}
