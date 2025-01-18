import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_ecommerce/constants/app_colors.dart';
import 'package:mini_ecommerce/models/product_model.dart';
import 'package:mini_ecommerce/widgets/gradient_background.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GradientBackground(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SizedBox(height: 150,),
             Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: kteal
              ),
               child: Padding(
                 padding: const EdgeInsets.all(50.0),
                 child: Column(
                   children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Welcome',style: TextStyle(color: Colors.white,fontSize: 25),),
                        const SizedBox(width: 5,),
                        Text(FirebaseAuth.instance.currentUser!.displayName!,style: TextStyle(color: Colors.white,fontSize: 25),)
                      ],
                    ),
                    const SizedBox(height: 20,),
                     Row(
                      children: [
                        Text('Email: ',style: TextStyle(fontSize: 15,color: Colors.white),),
                        const SizedBox(width: 10,),
                        Text(FirebaseAuth.instance.currentUser!.email!,style: TextStyle(color: Colors.white,fontSize: 15),),
                      ],
                     ),
                   ],
                 ),
               ),
             ),
             const SizedBox(height: 10,),
            ],
          ),
        )
    );
  }
}