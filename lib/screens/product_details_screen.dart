import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_ecommerce/constants/app_colors.dart';
import 'package:mini_ecommerce/models/product_model.dart';
import 'package:mini_ecommerce/view_model/cart_provider.dart';
import 'package:mini_ecommerce/widgets/action_button.dart';
import 'package:mini_ecommerce/widgets/frosted.dart';
import 'package:mini_ecommerce/widgets/gradient_background.dart';

class ProductDetailsScreen extends ConsumerWidget {
  const ProductDetailsScreen({super.key, required this.model});

  final ProductModel model;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final Size size = MediaQuery.sizeOf(context);
    print(model.title);
    return Scaffold(

      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: kteal),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           const SizedBox(height: 120,),
            Hero(
              tag: model.id,
              child: Container(
                width: size.width,
                height: size.height * 0.4,
                decoration: BoxDecoration(
                  //  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bo: Radius.circular(25)),
                  image: DecorationImage(image: NetworkImage(model.image),fit: BoxFit.contain),
                ),
                ),
            ),
              Expanded(
                child: Frosted(
                  child: Container(
                    decoration: BoxDecoration(
                      color: kteal.withOpacity(0.6),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 14.0,left: 14,bottom: 14,right: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.star,color: Colors.yellow.shade800,size: 30,),
                              const SizedBox(width: 5,),
                              Text(model.rate.toString(),style: TextStyle(color: Colors.yellow.shade800,fontSize: 30,fontWeight: FontWeight.bold),),
                              Spacer(),
                              Container(
                                margin: EdgeInsets.only(right: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white70
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
                                child: Text('${model.count.toString()} reviews',style: TextStyle(fontWeight: FontWeight.normal),),
                              ),
                              )
                            ],
                          ),
                           const SizedBox(height: 10,),
                          Expanded(
                            child: ListView(
                              padding: EdgeInsets.zero,
                              children: [
                                                          Text(model.title,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                            const SizedBox(height: 5,),
                            Text(model.description,style: TextStyle(color: Colors.white),textAlign: TextAlign.start,)
                              ],
                            ),
                          ),
                         Container(
                          height: 100,
                          // color: Colors.red,
                           child: Row(
                children: [
                  Text('${model.price}\$',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white70),),
                  Spacer(),
                  ActionButton(
                    ontap: (){
                      final bool didAdd = ref.read(cartProvider.notifier).addToCart(model);
                      if(didAdd){
                    ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      // behavior: SnackBarBehavior.floating,
                      // margin: EdgeInsets.only(bottom: size.height - )  ,
                      content: Text('Product Added To Cart'),
                      backgroundColor: kteal,
                      )
                  );
                      }
                                          } ,
                    text: 'Add to Cart',
                    width: 120,
                    padding: 0,
                    color: Colors.black,
                    )
                ],
              ),
                         ),
                        ],
                      ),
                    ),
                  ),
                ),
              )

          ],
        )
    );
  }
}