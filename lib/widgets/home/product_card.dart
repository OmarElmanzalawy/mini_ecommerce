import 'package:flutter/material.dart';
import 'package:mini_ecommerce/constants/app_colors.dart';
import 'package:mini_ecommerce/widgets/frosted.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Frosted(
          child: Container(
            width: 150,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: kteal.withOpacity(0.2),
            ),
            child: Image.asset('assets/images/hoodie.png',fit: BoxFit.contain,),
          ),
        ),
        const SizedBox(height: 7,),
        Row(
          children: [
            Text('Title',style: TextStyle(color: Colors.black87,fontSize: 18,fontWeight: FontWeight.w500,),),
            const SizedBox(width: 4,),
            Icon(Icons.star,color: Colors.amber,),
            Text('4.3',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
          ],
        ),
        const SizedBox(height: 2,),
        Text('\$120',style: TextStyle(fontWeight: FontWeight.bold),),
      ],
    );
  }
}