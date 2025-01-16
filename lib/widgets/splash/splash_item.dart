import 'package:flutter/material.dart';

class SplashItem extends StatelessWidget {
  const SplashItem({super.key, required this.imagePath, required this.title, required this.subtitle});

  final String imagePath;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Image.asset(
            'assets/animations/$imagePath',
            fit: BoxFit.contain
            )
            ),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              Text(title,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black,),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(subtitle,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey.shade600,
                  
                ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
