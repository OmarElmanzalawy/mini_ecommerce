import 'package:flutter/material.dart';
import 'package:mini_ecommerce/constants/app_colors.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.name,this.isSelected = false});

  final String name;
  final bool isSelected; 

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      constraints: BoxConstraints(minWidth: 70),
                    duration: Duration(milliseconds: 400),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: isSelected ? kteal : null
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Text(name,style: TextStyle(color: isSelected ? Colors.white : kteal,fontSize: 15),textAlign: TextAlign.center,),
                    ),
                    );
  }
}