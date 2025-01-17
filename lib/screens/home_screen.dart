import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_ecommerce/constants/app_colors.dart';
import 'package:mini_ecommerce/constants/enums.dart';
import 'package:mini_ecommerce/view_model/bottom_navigation_bar_provider.dart';
import 'package:mini_ecommerce/view_model/products_provider.dart';
import 'package:mini_ecommerce/widgets/gradient_background.dart';
import 'package:mini_ecommerce/widgets/home/category_card.dart';
import 'package:mini_ecommerce/widgets/home/product_card.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  // PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final products = ref.watch(productsProvider);
    final productsList = ref.read(productsProvider.notifier).mapCategoryToList();
    final navIndex = ref.watch(bottomNavigationProvider);
    print(products.products);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar:  AppBar(
        actionsPadding: EdgeInsets.only(right: 8),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        
        title: Image.asset('assets/images/logo.png',fit: BoxFit.cover,width: 100,height: 70,color: kteal,),
        leading: GestureDetector(
            onTap: (){
              context.push('/profile',extra: FirebaseAuth.instance.currentUser);
            },
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
            onTap: (){
              context.push('/cart');
            },
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
      bottomNavigationBar: WaterDropNavBar(
        waterDropColor: kteal,
        backgroundColor: kprimaryBackground2,
        selectedIndex: navIndex,
        onItemSelected: (index) => ref.read(bottomNavigationProvider.notifier).changeIndex(index),
        bottomPadding: 15,
        barItems: [
          BarItem(
            filledIcon: Icons.holiday_village,
            outlinedIcon: Icons.holiday_village_outlined,
            ),
            BarItem(
            filledIcon: Icons.shopping_basket,
            outlinedIcon: Icons.shopping_basket_outlined,
            ),
            BarItem(
            filledIcon: Icons.person,
            outlinedIcon: Icons.person_outline,
            ),
        ],
       
        ),
      body: 
          GradientBackground(
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
                Expanded(
                  flex: 1,
                  child: ListView(
                    // shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                     CategoryCard(name: 'All',category: ActiveCategory.All,),
                     const SizedBox(width: 20,),
                     CategoryCard(name: 'Men',category: ActiveCategory.Men,),
                     const SizedBox(width: 20,),
                     CategoryCard(name: 'Women',category: ActiveCategory.Women,),
                     const SizedBox(width: 20,),
                     CategoryCard(name: 'Jewlery',category: ActiveCategory.Jewlery,),
                     const SizedBox(width: 20,),
                     CategoryCard(name: 'Electronics',category: ActiveCategory.Electronics,),
                    ],
                  ),
                ),
                const SizedBox(height: 15,),
                Expanded(
                  flex: 12,
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 100,
                      crossAxisSpacing: 0,
                      ),
                    itemCount: productsList.length,
                    itemBuilder: (context, index) {
                      return ProductCard(model: productsList[index],);
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