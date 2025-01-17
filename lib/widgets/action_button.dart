import 'package:flutter/material.dart';
import 'package:mini_ecommerce/constants/app_colors.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({super.key,this.ontap, required this.text, this.width, this.height, this.padding, this.color});

  final VoidCallback? ontap;
  final String text;
  final double? width;
  final double? height;
  final double? padding;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding ?? 25.0),
      child: ElevatedButton(
        style:ButtonStyle(
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
          ),
          elevation: WidgetStatePropertyAll(0),
          backgroundColor: WidgetStatePropertyAll(color ?? kteal,),
          splashFactory: NoSplash.splashFactory
        ),
        onPressed: ontap ?? (){},
         child: Container(
          width: width ?? double.maxFinite,
          height: height ?? 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
      
          ),
          child:  Center(child: Text(text)),
         ),
         ),
    );
  }
}