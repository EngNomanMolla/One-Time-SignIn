import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final storage = GetStorage();

  final TextEditingController emailController = TextEditingController();

  bool get signedIn => storage.hasData('email');

  void signIn() {
    setState(() {
      storage.write('email', emailController.text);
      emailController.clear();
    });

  }

  void signOut() {
    setState(() {
      storage.remove('email');
      Get.back();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('One-Time Sign In'),
      ),
      body: Center(
        child: signedIn ? _buildSignedInView() : _buildSignInView()
      ),
    );
  }

  Widget _buildSignInView() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: 'Email',
            ),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: signIn,
            child: Text('Sign In'),
          ),
        ],
      ),
    );
  }

  Widget _buildSignedInView() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You are signed in!',
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: signOut,
            child: Text('Sign Out'),
          ),
        ],
      ),
    );
  }
}
