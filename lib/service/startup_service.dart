import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_ecommerce/firebase_options.dart';
import 'package:mini_ecommerce/service/init_get_it.dart';
import 'package:mini_ecommerce/view_model/products_provider.dart';

class StartupService {

  static Future init()async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  print('Firebase Initialized');
  // await FirebaseAuth.instance.signOut();
  setupLocator();
  
}
    

Future loadLocalData(WidgetRef ref)async{
  Future.microtask(()async{
  print('microtasking');
  await ref.read(productsProvider.notifier).fetchProducts();
  });

}
}