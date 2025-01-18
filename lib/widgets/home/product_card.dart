import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_ecommerce/constants/app_colors.dart';
import 'package:mini_ecommerce/models/product_model.dart';
import 'package:mini_ecommerce/utils/app_utils.dart';
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
          child: Container(
            // width: 150,
            // height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Hero(
              tag: model.id,
              child: Image.network(model.image,fit: BoxFit.contain,width: 150,height: 110,)),
          ),
        ),
        const SizedBox(height: 7,),
        Text(AppUtils.splitLongWords(model.title),style: TextStyle(color: Colors.black87,fontSize: 14,fontWeight: FontWeight.bold,),),
        const SizedBox(width: 4,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('\$${model.price}',style: TextStyle(fontWeight: FontWeight.bold),),
            const SizedBox(width: 50,),
        
                    Icon(Icons.star,color: Colors.amber,),
            Text(model.rate.toString(),style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
          ],
        ),
      ],
    );
  }
}