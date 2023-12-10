import 'package:firebase_auth/firebase_auth.dart';

class EmailAuth {
  
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<bool> createUser( 
    {required String emailUser, required String pwdUser} ) async {
      try{
        final credentials = 
          await auth.createUserWithEmailAndPassword(email: emailUser, password: pwdUser); 
        credentials.user!.sendEmailVerification();
        return true;  
      }catch( e ){
        return false;
      }
  }

  Future<bool> validateUser(
    {required String emailUser, required String pwdUser} 
  ) async {
    try{
      final credentials = await auth.signInWithEmailAndPassword(email: emailUser, password: pwdUser);
      if( credentials.user!.emailVerified ){
        return true;
      }else{
        return false;
      }

    }catch(e){
      return false;
    }
  }




}