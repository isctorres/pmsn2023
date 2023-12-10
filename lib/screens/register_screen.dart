import 'package:flutter/material.dart';
import 'package:pmsn20232/firebase/email_auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final conNameUser = TextEditingController();
  final conEmailUser = TextEditingController();
  final conPwdUser = TextEditingController();
  final emailAuth = EmailAuth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register a User'),),
      body: Column(
        children: [
          TextFormField(
            controller: conNameUser,
          ),
          TextFormField(
            controller: conEmailUser,
          ),
          TextFormField(
            controller: conPwdUser,
          ),
          ElevatedButton(onPressed: (){
            var email = conEmailUser.text;
            var pwd = conPwdUser.text;
            emailAuth.createUser(emailUser: email, pwdUser: pwd);
          }, child: Text('Save User'))
        ],
      ),
    );
  }
}