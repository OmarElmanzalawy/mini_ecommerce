import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_ecommerce/constants/app_colors.dart';
import 'package:mini_ecommerce/constants/enums.dart';
import 'package:mini_ecommerce/view_model/products_provider.dart';

class CategoryCard extends ConsumerWidget {
  const CategoryCard({super.key, required this.name, required this.category});

  final String name;
  final ActiveCategory category;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final bool isSelected = ref.read(productsProvider).activeCategory == category ? true : false;
    return GestureDetector(
      onTap: () {
        print('category click');
        ref.read(productsProvider.notifier).changeCategory(category);
      },
      child: AnimatedContainer(
        constraints: BoxConstraints(minWidth: 70),
                      duration: Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: isSelected ? kteal : null
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: Text(name,style: TextStyle(color: isSelected ? Colors.white : kteal,fontSize: 15),textAlign: TextAlign.center,),
                      ),
                      ),
    );
  }
}