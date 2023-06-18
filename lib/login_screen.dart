import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final storage=GetStorage();

  TextEditingController controller=TextEditingController();

  bool get loggedIn=>storage.hasData('login');


  login(){
    setState(() {
      storage.write('login', true);
      controller.clear();
    });
  }

  logout(){
    setState(() {
      storage.remove('login');
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('One time logging'),),
      body: Center(
        child: loggedIn? _home():_login() ,
      ),
    );
  }

  Widget _home(){
    return Column(
      children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Enter your mail'
          ),
        ),

        SizedBox(height: 10.0),

        ElevatedButton(onPressed: login, child: Text('Login'))


      ],
    );

  }

  Widget _login(){
    return Column(
      children: [
        Text('You are logged In'),
        SizedBox(height: 10.0),

        ElevatedButton(onPressed: logout, child: Text('Logout'))

      ],
    );
  }


}
