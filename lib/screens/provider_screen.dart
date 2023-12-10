import 'package:flutter/material.dart';
import 'package:pmsn20232/provider/test_provider.dart';
import 'package:provider/provider.dart';

class ProviderScreen extends StatelessWidget {
  const ProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final userProvider = 
      Provider.of<TestProvider>(context);

    return Scaffold(
      body: Center(
        child: Text(userProvider.user)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          userProvider.user = 'Rubensin TF :)';
        } 
      ),
    );
  }
}