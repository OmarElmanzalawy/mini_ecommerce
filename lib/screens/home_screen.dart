import 'package:flutter/material.dart';
import 'package:mini_ecommerce/constants/app_colors.dart';
import 'package:mini_ecommerce/widgets/gradient_background.dart';
import 'package:mini_ecommerce/widgets/home/category_card.dart';
import 'package:mini_ecommerce/widgets/home/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar:  AppBar(
        actionsPadding: EdgeInsets.only(right: 8),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        
        title: Image.asset('assets/images/logo.png',fit: BoxFit.cover,width: 100,height: 70,color: kteal,),
        leading: GestureDetector(
            onTap: (){},
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white60,
                shape: BoxShape.circle
              ),
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Icon(Icons.person,color: kteal,)
              ),
            ),
          ),
        actions: [
          GestureDetector(
            onTap: (){},
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white60,
                shape: BoxShape.circle
              ),
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Icon(Icons.shopping_bag,color: kteal,)
              ),
            ),
          )
        ],
      ),
      body: GradientBackground(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 150,),
              Text('Everything You Need\nOn One Platform!',style: TextStyle(fontSize: 25,color: Colors.teal.shade900,fontWeight: FontWeight.bold),),
              const SizedBox(height: 14,),
              SearchBar(
                hintText: 'Search here...',
                hintStyle: WidgetStatePropertyAll(TextStyle(color: Colors.black38)),
                elevation: WidgetStatePropertyAll(0),
                leading: Icon(Icons.search,color: kteal,),
              ),
              const SizedBox(height: 20,),
              Row(
                spacing: 20,
                children: [
                 CategoryCard(name: 'All',isSelected: true,),
                 CategoryCard(name: 'Men'),
                 CategoryCard(name: 'Women'),
                 CategoryCard(name: 'Jewlery'),
                ],
              ),
              const SizedBox(height: 15,),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 100,
                    crossAxisSpacing: 0,
                    ),
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return ProductCard();
                  },
                
                  ),
              )
            ],
          ),
        )
        ),
    );
  }
}