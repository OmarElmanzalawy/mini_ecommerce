import 'package:flutter/material.dart';
import 'package:mini_ecommerce/constants/app_colors.dart';

class SplashButton extends StatelessWidget {
  const SplashButton({super.key,this.ontap,this.isfinalIndex=false});

  final VoidCallback? ontap;
  final bool isfinalIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: ElevatedButton(
        style:const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(kteal,),
          splashFactory: NoSplash.splashFactory
        ),
        onPressed: ontap ?? (){},
         child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
      
          ),
          child:  Center(child: Text(isfinalIndex ? 'Sign In':'Next',style: TextStyle(fontSize: 15,color: kprimaryWhite),)),
         ),
         ),
    );
  }
}