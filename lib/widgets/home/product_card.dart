import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_ecommerce/constants/app_colors.dart';
import 'package:mini_ecommerce/models/product_model.dart';
import 'package:mini_ecommerce/widgets/frosted.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.model});

  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: (){
            print('Product Clicked');
            context.push('/productdetails',extra: model);
          },
          child: Frosted(
            child: Container(
              width: 150,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: kteal.withOpacity(0.2),
              ),
              child: Hero(
                tag: model.id,
                child: Image.network(model.image,fit: BoxFit.contain,)),
            ),
          ),
        ),
        const SizedBox(height: 7,),
        Row(
          children: [
            Text(model.title,style: TextStyle(color: Colors.black87,fontSize: 18,fontWeight: FontWeight.w500,),),
            const SizedBox(width: 4,),
            Icon(Icons.star,color: Colors.amber,),
            Text(model.rate.toString(),style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
          ],
        ),
        const SizedBox(height: 2,),
        Text('\$${model.price}}',style: TextStyle(fontWeight: FontWeight.bold),),
      ],
    );
  }
}