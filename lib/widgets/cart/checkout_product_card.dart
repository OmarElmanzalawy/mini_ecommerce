import 'package:flutter/material.dart';
import 'package:mini_ecommerce/constants/app_colors.dart';
import 'package:mini_ecommerce/constants/app_styles.dart';
import 'package:mini_ecommerce/widgets/frosted.dart';

class CheckoutProductCard extends StatelessWidget {
  const CheckoutProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Stack(
      children: [
        Container(
        width: size.width * 0.88,
        height: 125,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white70
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Frosted(
                child: Container(
                  width: 100,
                  height: 125,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(image: AssetImage('assets/images/hoodie.png'),fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(12)
                    ),
                  ),
              ),
            ),
              const SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Product Title',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: kteal),),
                  const SizedBox(height: 2,),
                  Text('Category',style: TextStyle(color: kteal,fontWeight: FontWeight.w300),),
                  const SizedBox(height: 2,),
                  Text('\$120',style: TextStyle(fontSize: 15,color: kteal,),),
                  Spacer(),
                  Container(
                    width: 200,
                    // color: Colors.red,
                    alignment: Alignment.centerRight,
                    child: IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: Colors.red,)),
                  )
                ],
              )
          ],
        ),
      ),
      ]
    );
  }
}