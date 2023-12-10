import 'package:flutter/material.dart';
import 'package:pmsn20232/firebase/email_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final emailAuth = EmailAuth();

  @override
  Widget build(BuildContext context) {

    TextEditingController txtConUser = TextEditingController();
    TextEditingController txtConPass = TextEditingController();
    final txtUser = TextField(
      controller: txtConUser,
      decoration: const InputDecoration(
        border: OutlineInputBorder()
      ),
    );

    final txtPass = TextField(
      controller: txtConPass,
      obscureText: true,
      decoration: const InputDecoration(
        border: OutlineInputBorder()
      )
    );

    final imgLogo = Container(
      width: 300,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Mario_Series_Logo.svg/1280px-Mario_Series_Logo.svg.png')
        )
      ),
    );

    final btnEntrar = FloatingActionButton.extended(
      icon: Icon(Icons.login),
      label: Text('Entrar'),
      onPressed: () async {
        bool res = await emailAuth.validateUser(emailUser: txtConUser.text, pwdUser: txtConPass.text);
        print(bool);
        if( res ){
          Navigator.pushNamed(context, '/dash');
        }
      }
    );

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: .7,
            fit: BoxFit.fill,
            image: NetworkImage(
              'https://getwallpapers.com/wallpaper/full/a/7/c/1227626-widescreen-mario-bros-wallpaper-hd-1080x1920-retina.jpg')
          )
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 100.0),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 200,
                padding: EdgeInsets.all(30),
                margin: EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
                ),
                child: Column(
                  children: [
                    txtUser,
                    const SizedBox(height: 10,),
                    txtPass
                  ],
                ),
              ),
              //imgLogo,
              TextButton(
                onPressed: ()=>Navigator.pushNamed(context, '/register'), 
                child: Text('Registrarse :)', 
                  style: TextStyle(fontSize: 20, decoration: TextDecoration.underline),)
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: 
      FloatingActionButtonLocation.centerDocked,
      floatingActionButton: btnEntrar,
    );
  }
}