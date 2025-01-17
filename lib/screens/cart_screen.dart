import 'package:flutter/material.dart';
import 'package:mini_ecommerce/constants/app_colors.dart';
import 'package:mini_ecommerce/widgets/action_button.dart';
import 'package:mini_ecommerce/widgets/cart/checkout_product_card.dart';
import 'package:mini_ecommerce/widgets/gradient_background.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('My Cart',style: TextStyle(color: kteal),),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: kteal),
      ),
      body: GradientBackground(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 120,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(height: 20,),
                  padding: EdgeInsets.zero,
                  itemCount: 12,
                  itemBuilder: (context,index){
                    return CheckoutProductCard();
                  }
                  ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 30),
              child: Row(
                children: [
                  Text('Total: 500\$',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  Spacer(),
                  ActionButton(text: 'Checkout',width: 120,padding: 0,)
                ],
              ),
            )
          ],
        )
        )
    );
  }
}