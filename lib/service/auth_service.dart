import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthService {

   static Future<bool> registerUser({required String username,required String email,required String password})async{
    try{
      if(username.isNotEmpty && email.isNotEmpty && password.isNotEmpty){
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    await userCredential.user!.updateDisplayName(username);
    return true;
      }
      else{
       return false;
      }
    }
    catch(e){
      return false;
    }
  }

  static Future<bool> login({required String email,required String password})async{

  try{
    if(email.isNotEmpty && password.isNotEmpty){
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return true;
    }
    return false;
  }
  catch (e){
    print(e.toString());
    return false;
  }

}

}